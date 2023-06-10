import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lazmiles/const/appcolor.dart';
import 'package:lazmiles/ui/buutomcircle.dart';
import 'package:lazmiles/ui/product_detail_screen.dart';

class SeeMoreScreen extends StatefulWidget {
  const SeeMoreScreen({super.key});

  @override
  State<SeeMoreScreen> createState() => _SeeMoreScreenState();
}

class _SeeMoreScreenState extends State<SeeMoreScreen> {
  ScrollController controllers = ScrollController();
  bool closeTopControllers = false;
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;

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
    controllers.addListener(() {
      setState(() {
        closeTopControllers = controllers.offset > 50;
      });
    });
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.13;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.deep_orange,
        foregroundColor: Colors.white,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset(
              "assets/logo/logo.png",
              scale: 8,
            ),
            SizedBox(
              width: 5,
            ),
            Text(
              "Lazmiles",
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.more_vert))],
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: size.width,
                alignment: Alignment.topCenter,
                height: closeTopControllers ? 3 : categoryHeight,
                child: CircleButtom()),
            Expanded(
              child: GridView.builder(
                controller: controllers,
                // scrollDirection: Axis.vertical,
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
                                  "${_products[index]["product-img"][0]}"
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
      )),
    );
  }
}
