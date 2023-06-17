import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lazmiles/const/appcolor.dart';
import 'package:lazmiles/ui/checkout.dart';

class LoadingChecOut extends StatefulWidget {
  const LoadingChecOut({super.key});

  @override
  State<LoadingChecOut> createState() => _LoadingChecOutState();
}

class _LoadingChecOutState extends State<LoadingChecOut> {
  @override
  void initState() {
    Timer(
      Duration(seconds: 2),
      () => Navigator.push(
        context,
        CupertinoPageRoute(
          builder: (_) => CheckOut(),
        ),
      ),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.deep_orange,
      body: Center(
          child: SafeArea(
              child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CircularProgressIndicator(color: Colors.white),
          SizedBox(
            height: 15,
          ),
          Text(
            "Mohon Tunggu Sebentar..",
            style: TextStyle(color: Colors.white, fontSize: 10),
          )
        ],
      ))),
    );
  }
}
