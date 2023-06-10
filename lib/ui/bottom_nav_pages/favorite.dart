import 'package:flutter/material.dart';
import 'package:lazmiles/const/appcolor.dart';

import '../../widget/fetchProducts.dart';

class Favourite extends StatefulWidget {
  @override
  _FavouriteState createState() => _FavouriteState();
}

class _FavouriteState extends State<Favourite> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.deep_orange,
        title: Text(
          "Favorite",
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SafeArea(
        child: fetchData("users-favourite-items"),
      ),
    );
  }
}
