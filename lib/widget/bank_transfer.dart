import 'package:flutter/material.dart';

class Pembayaran extends StatelessWidget {
  const Pembayaran({
    super.key,
    required this.logobank,
    required this.judulPembayaran,
  });
  final AssetImage logobank;
  final String judulPembayaran;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10),
      margin: EdgeInsets.only(right: 10),
      height: 80,
      width: 150,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 244, 246, 248),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Image(
            image: logobank,
            width: 65,
          ),
          Text(
            judulPembayaran,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}
