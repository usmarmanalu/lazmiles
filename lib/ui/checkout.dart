import 'package:flutter/material.dart';
import 'package:image_card/image_card.dart';
import 'package:lazmiles/const/appcolor.dart';

import '../widget/bank_transfer.dart';
import '../widget/fetchProducts.dart';
import 'pembayaran.dart';

class CheckOut extends StatefulWidget {
  const CheckOut({super.key});

  @override
  State<CheckOut> createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        backgroundColor: AppColor.deep_orange,
        title: Text(
          "CheckOut",
          style: TextStyle(
              color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 5),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(bottom: 10, left: 5, right: 5, top: 5),
            padding: EdgeInsets.only(bottom: 5),
            child: Column(
              children: [
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.amber[100],
                      borderRadius: BorderRadius.circular(5)),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.error,
                        size: 14,
                        color: Colors.amber[700],
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        maxLines: 2,
                        '''Untuk menghindari gagal pengiriman, pastikan
 ALAMAT yang Anda cantumkan sudah BENAR''',
                        style:
                            TextStyle(color: Colors.amber[700], fontSize: 12),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 248, 250),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(
                          Icons.pin_drop,
                          color: AppColor.deep_orange,
                        ),
                        title: Row(
                          children: [
                            Text(
                              "Usmar Manalu",
                              style: TextStyle(fontSize: 12),
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "+62 8123456789",
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 12),
                            ),
                          ],
                        ),
                        subtitle: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 50,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(15)),
                              child: Center(
                                child: Text(
                                  "Kantor",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 9),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              '''Komplek Pergudangan ABC            
SAT KOSAMBI. Kab. Tangerang,
BANTEN''',
                              style: TextStyle(fontSize: 9),
                            )
                          ],
                        ),
                        trailing: Icon(Icons.navigate_next),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Siap untuk pengiriman Instan/Same Day",
                          style: TextStyle(fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                FillImageCard(
                  width: 200,
                  heightImage: 140,
                  imageProvider: AssetImage('assets/products/laptop.jpeg'),
                  title: Text('Vivobook Go 14 Flip (TP1400)'),
                  description: Text(
                    "Rp. 12.556.999",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pilih Pengiriman",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        //
                      },
                      child: Row(
                        children: [
                          Text(
                            "Lihat Semua pilihan",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.blue,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  padding: EdgeInsets.only(left: 10, right: 10),
                  height: 70,
                  decoration: BoxDecoration(
                      color: Color.fromARGB(255, 247, 248, 250),
                      borderRadius: BorderRadius.circular(15)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Ekonomi"),
                          Text(
                            "Rp25.000",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.directions_car,
                            color: Colors.blue,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Estimasi tiba 20-27 Jun")
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.loyalty,
                            color: Colors.orange,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text("Promosi Toko")
                        ],
                      ),
                      Text(
                        "-Rp.26.500",
                        style: TextStyle(color: Colors.orange),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.only(right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('1 items, Subtotal:'),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Rp12.587.976',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Pilih metode pembayaran",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => PembayaranScreen(),
                            ));
                      },
                      child: Row(
                        children: [
                          Text(
                            "Lihat Semua Metode",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 12,
                            ),
                          ),
                          Icon(
                            Icons.navigate_next,
                            color: Colors.blue,
                            size: 18,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Pembayaran(
                        logobank: AssetImage('assets/logo pembayaran/bca.png'),
                        judulPembayaran: "Bank Tranfert",
                      ),
                      Pembayaran(
                        logobank:
                            AssetImage('assets/logo pembayaran/gopay.png'),
                        judulPembayaran: "Tautkan akun Gopay",
                      ),
                      Pembayaran(
                        logobank: AssetImage('assets/logo pembayaran/ovo.png'),
                        judulPembayaran: "Tautkan akun OVO",
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[50],
                      borderRadius: BorderRadius.circular(3)),
                  child: TextField(
                    decoration: InputDecoration(
                        enabled: true,
                        hintText: 'Masukkan Kode Voucher',
                        hintStyle: TextStyle(color: Colors.grey)),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Container(
                  padding: EdgeInsets.only(right: 15, left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Subtotal",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "(1 Items)",
                            style: TextStyle(color: Colors.grey),
                          )
                        ],
                      ),
                      Text(
                        "Rp2.601.900",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.loyalty,
                    color: Colors.orange,
                  ),
                  title: Text(
                    "Voucher & MilesBonus",
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Text(
                    "-Rp10,000",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.label,
                    color: Colors.redAccent,
                  ),
                  title: Text(
                    "Tukarkan jumlah koin Anda",
                    style: TextStyle(fontSize: 12),
                  ),
                  trailing: Text(
                    "-Rp10,000",
                    style: TextStyle(color: Colors.redAccent),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Total Biaya Pengiriman",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                  ),
                  trailing: Text(
                    "Rp25.000",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                ListTile(
                  title: Row(
                    children: [
                      Text(
                        "Jumlah Pesanan",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 12),
                      ),
                      Text(
                        "(Termasuk PPN)",
                        style: TextStyle(fontSize: 10),
                      )
                    ],
                  ),
                  trailing: Text(
                    "Rp12.640.776",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("Total: "),
                    Text(
                      "Rp12.640.776 ",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColor.deep_orange),
                        onPressed: () {},
                        child: Text(
                          "Buat Pesanan",
                          style: TextStyle(color: Colors.white),
                        ))
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
