import 'package:flutter/material.dart';
import 'package:lazmiles/const/appcolor.dart';

import '../../widget/fetchProducts.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.deep_orange,
        title: Text(
          "Card",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: fetchData("users-cart-items"),
      ),
    );
  }
}
