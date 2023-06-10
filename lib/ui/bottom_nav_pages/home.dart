// import 'dart:typed_data';

import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lazmiles/ui/seemore.dart';
import '../../const/appcolor.dart';
import '../product_detail_screen.dart';
import '../search_screen.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ScrollController controller = ScrollController();
  bool closeTopController = false;
  List<String> _carouselImages = [];
  TextEditingController _searchController = TextEditingController();
  var _dotPosition = 0;
  List _products = [];

  var _firestoreInstance = FirebaseFirestore.instance;
  fetchCarouselImages() async {
    QuerySnapshot qn =
        await _firestoreInstance.collection("carousel-slider").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _carouselImages.add(
          qn.docs[i]["img-path"],
        );
        print(qn.docs[i]["img-path"]);
      }
    });

    return qn.docs;
  }

  fetchProducts() async {
    QuerySnapshot qn = await _firestoreInstance.collection("products").get();
    setState(() {
      for (int i = 0; i < qn.docs.length; i++) {
        _products.add({
          "product-name": qn.docs[i]["product-name"],
          "product-description": qn.docs[i]["product-description"],
          "product-price": qn.docs[i]["product-price"],
          "product-img": qn.docs[i]["product-img"],
          "category": qn.docs[i]["category"],
          "location": qn.docs[i]["location"],
          "rating": qn.docs[i]["rating"],
          "sold": qn.docs[i]["sold"],
        });
      }
    });

    return qn.docs;
  }

  @override
  void initState() {
    controller.addListener(() {
      setState(() {
        closeTopController = controller.offset > 90;
      });
    });
    fetchCarouselImages();
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHight = size.height * 0.1;
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(3),
          // padding: EdgeInsets.only(bottom: 5),
          child: Column(
            children: [
              AnimatedContainer(
                // transform: Matrix4.f
                duration: Duration(milliseconds: 300),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopController ? .2 : categoryHight,
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 20.h,
                    right: 20.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      TextFormField(
                        controller: _searchController,
                        readOnly: true,
                        decoration: InputDecoration(
                          suffixIcon: Icon(
                            Icons.keyboard_voice,
                            color: AppColor.deep_orange,
                          ),
                          prefixIcon: Icon(
                            Icons.search,
                            size: 27,
                          ),
                          prefixIconColor: AppColor.deep_orange,
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.blue)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              borderSide: BorderSide(color: Colors.grey)),
                          hintText: "Search products here",
                          hintStyle: TextStyle(fontSize: 15.sp),
                        ),
                        onTap: () => Navigator.push(
                          context,
                          CupertinoPageRoute(
                            builder: (_) => SearchScreen(),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              AspectRatio(
                aspectRatio: 2.5,
                child: CarouselSlider(
                  items: _carouselImages
                      .map(
                        (item) => Padding(
                          padding: const EdgeInsets.only(left: 3, right: 3),
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              image: DecorationImage(
                                image: NetworkImage(item),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      )
                      .toList(),
                  options: CarouselOptions(
                    aspectRatio: 2.5,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    viewportFraction: 0.8,
                    enlargeStrategy: CenterPageEnlargeStrategy.height,
                    onPageChanged: (val, carouselPageChangedReason) {
                      setState(
                        () {
                          _dotPosition = val;
                        },
                      );
                    },
                  ),
                ),
              ),
              DotsIndicator(
                dotsCount:
                    _carouselImages.length == 0 ? 1 : _carouselImages.length,
                position: _dotPosition.toInt(),
                decorator: DotsDecorator(
                  activeColor: AppColor.deep_orange,
                  color: AppColor.deep_orange.withOpacity(0.5),
                  spacing: EdgeInsets.all(2),
                  activeSize: Size(8, 8),
                  size: Size(6, 6),
                ),
              ),
              TextButton(
                style: ButtonStyle(),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SeeMoreScreen()));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "see more",
                      style: TextStyle(color: Colors.red, fontSize: 10),
                    ),
                    Icon(
                      Icons.navigate_next,
                      color: Colors.red,
                    )
                  ],
                ),
              ),
              // expanded
              Expanded(
                child: GridView.builder(
                  controller: controller,
                  scrollDirection: Axis.vertical,
                  itemCount: _products.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 1),
                  itemBuilder: (_, index) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ProductDetails(_products[index]),
                        ),
                      ),
                      child: Card(
                        borderOnForeground: true,
                        clipBehavior: Clip.antiAlias,
                        color: Colors.white,
                        // semanticContainer: true,
                        elevation: 3,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            AspectRatio(
                              aspectRatio: 2.5,
                              child: Container(
                                color: Colors.white,
                                child: Image.network(
                                    repeat: ImageRepeat.repeat,
                                    fit: BoxFit.contain,
                                    "${_products[index]["product-img"][1]}"
                                    // _products[index]["product-img"][0],
                                    ),
                              ),
                            ),
                            Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(5)),
                                  child: Text(
                                    "${_products[index]["category"]}",
                                    style: TextStyle(
                                        fontSize: 9,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                SizedBox(
                                  width: 3,
                                ),
                                Flexible(
                                  child: Text(
                                    maxLines: 2,
                                    softWrap: true,
                                    textDirection: TextDirection.ltr,
                                    overflow: TextOverflow.clip,
                                    "${_products[index]["product-name"]}",
                                    style: TextStyle(
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              "Rp ${_products[index]["product-price"].toString()}",
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.redAccent),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 14,
                                  color: Colors.yellow,
                                ),
                                Text(
                                  "${_products[index]["rating"].toString()}",
                                  style: TextStyle(fontSize: 12),
                                ),
                                SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  "${_products[index]["sold"]}",
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Icon(
                                  Icons.location_on,
                                  size: 14,
                                  color: Colors.grey,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  "${_products[index]["location"].toString()}",
                                  style: TextStyle(fontSize: 12),
                                ),
                                Icon(
                                  Icons.more_horiz,
                                  size: 16,
                                  color: Colors.grey,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
