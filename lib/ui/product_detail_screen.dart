import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../const/appcolor.dart';

// ignore: must_be_immutable
class ProductDetails extends StatefulWidget {
  var _product;
  ProductDetails(this._product);
  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  List _products = [];
  var _firestoreInstance = FirebaseFirestore.instance;
  Future addToCart() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-cart-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "name": widget._product["product-name"],
      "price": widget._product["product-price"],
      "images": widget._product["product-img"],
    }).then((value) => print("Added to cart"));
  }

  Future addToFavourite() async {
    final FirebaseAuth _auth = FirebaseAuth.instance;
    var currentUser = _auth.currentUser;
    CollectionReference _collectionRef =
        FirebaseFirestore.instance.collection("users-favourite-items");
    return _collectionRef
        .doc(currentUser!.email)
        .collection("items")
        .doc()
        .set({
      "name": widget._product["product-name"],
      "price": widget._product["product-price"],
      "images": widget._product["product-img"],
    }).then((value) => print("Added to favourite"));
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
    fetchProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.deep_orange,
        elevation: 0,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            backgroundColor: AppColor.deep_orange,
            child: IconButton(
                onPressed: () => Navigator.pop(context),
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                )),
          ),
        ),
        actions: [
          StreamBuilder(
            stream: FirebaseFirestore.instance
                .collection("users-favourite-items")
                .doc(FirebaseAuth.instance.currentUser!.email)
                .collection("items")
                .where("name", isEqualTo: widget._product['product-name'])
                .snapshots(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.data == null) {
                return Text("");
              }
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.red,
                      child: IconButton(
                        onPressed: () => snapshot.data.docs.length == 0
                            ? addToFavourite()
                            : print("Already Added"),
                        icon: snapshot.data.docs.length == 0
                            ? Icon(
                                Icons.favorite_outline,
                                color: Colors.white,
                              )
                            : Icon(
                                Icons.favorite,
                                color: Colors.white,
                              ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        //
                      },
                      icon: Icon(
                        Icons.share_outlined,
                        color: Colors.white,
                      ),
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        ))
                  ],
                ),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        // scrollDirection: Axis.vertical,
        padding: EdgeInsets.only(bottom: 50),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(left: 12, right: 12, top: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AspectRatio(
                  aspectRatio: 2.5,
                  child: CarouselSlider(
                      items: widget._product['product-img']
                          .map<Widget>((item) => Padding(
                                padding:
                                    const EdgeInsets.only(left: 3, right: 3),
                                child: Container(
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(item),
                                          fit: BoxFit.cover)),
                                ),
                              ))
                          .toList(),
                      options: CarouselOptions(
                          autoPlay: true,
                          enlargeCenterPage: true,
                          viewportFraction: 0.8,
                          enlargeStrategy: CenterPageEnlargeStrategy.height,
                          onPageChanged: (val, carouselPageChangedReason) {
                            setState(() {});
                          })),
                ),
                Text(
                  widget._product['product-name'],
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Text(widget._product['product-description']),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "\Rp ${widget._product['product-price'].toString()}",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 30,
                      color: Colors.red),
                ),
                Divider(),
                SizedBox(
                  width: 1.sw,
                  height: 56.h,
                  child: ElevatedButton(
                    onPressed: () => addToCart(),
                    child: Text(
                      "Add to cart",
                      style: TextStyle(color: Colors.white, fontSize: 18.sp),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: AppColor.deep_orange,
                      elevation: 3,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
