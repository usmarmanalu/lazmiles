import 'package:flutter/material.dart';
import 'package:lazmiles/const/appcolor.dart';

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class PembayaranScreen extends StatefulWidget {
  const PembayaranScreen({super.key});

  @override
  State<PembayaranScreen> createState() => _PembayaranScreenState();
}

class _PembayaranScreenState extends State<PembayaranScreen> {
  BestTutorSite _site = BestTutorSite.javatpoint;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 243, 243, 243),
      appBar: AppBar(
        excludeHeaderSemantics: true,
        automaticallyImplyLeading: true,
        backgroundColor: AppColor.deep_orange,
        foregroundColor: Colors.white,
        title: Text(
          "Pilih Metode Pembayaran",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(bottom: 10),
        child: SafeArea(
          child: Container(
            margin: EdgeInsets.only(left: 8, right: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Metode yang direkomendasikan",
                          style: TextStyle(
                              fontSize: 11, fontWeight: FontWeight.bold)),
                      Row(
                        children: [
                          Image.asset('assets/logo/security.png', scale: 9),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Perlindungan",
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.green)),
                              Text("PembayaranLAZMILES",
                                  style: TextStyle(
                                      fontSize: 9, color: Colors.green)),
                            ],
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 1),
                    horizontalTitleGap: 1,
                    leading: Image.asset('assets/logo pembayaran/bca.png'),
                    title: Text(
                      "BCA",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Text(
                      "Bank Transfer",
                      style: TextStyle(fontSize: 9),
                    ),
                    trailing: Radio(
                      activeColor: Colors.blue,
                      value: BestTutorSite,
                      groupValue: _site,
                      onChanged: (BestTutorSite) {
                        setState(() {
                          _site = _site;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Metode lain yang disimpan",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 20, right: 15),
                    horizontalTitleGap: 30,
                    leading: Image.asset(
                      'assets/logo/kredivo.jpg',
                      scale: 25,
                    ),
                    title: Text(
                      'Expres*****kout',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Text(
                      "kredivo 0-Click",
                      style: TextStyle(fontSize: 9),
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 20),
                    horizontalTitleGap: 30,
                    leading: Image.asset(
                      'assets/logo/dana.png',
                      scale: 6,
                    ),
                    title: Text(
                      "62-888***34673",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Text(
                      "DANA",
                      style: TextStyle(fontSize: 9),
                    ),
                    trailing: Radio(
                      activeColor: Colors.blue,
                      value: BestTutorSite,
                      groupValue: _site,
                      onChanged: (BestTutorSite) {
                        setState(() {
                          _site = _site;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Metode pembayaran",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 10, right: 15),
                    horizontalTitleGap: 30,
                    leading: Image.asset(
                      'assets/logo/bank.jpg',
                      width: 50,
                    ),
                    title: Text(
                      "Bank Transfer",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(
                          "Bayar cepat, Mobile Banking",
                          style: TextStyle(fontSize: 9),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Image.asset(
                          'assets/logo/bni.png',
                          scale: 42,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Image.asset(
                          'assets/logo/mandiri.jpg',
                          scale: 19,
                        ),
                        Image.asset(
                          'assets/logo pembayaran/bca.png',
                          scale: 26,
                        ),
                      ],
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 20, right: 15),
                    horizontalTitleGap: 10,
                    leading: Image.asset(
                      'assets/logo pembayaran/ovo.png',
                      scale: 12,
                    ),
                    title: Text(
                      'OVO',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Text(
                      "Tautkan Akun OVO",
                      style: TextStyle(fontSize: 9),
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 10, right: 15),
                    horizontalTitleGap: 30,
                    leading: Image.asset(
                      'assets/logo/kartukredit.png',
                      width: 50,
                    ),
                    title: Text(
                      "Kartu Kredit/Debit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Kartu Kredit/Debit",
                          style: TextStyle(fontSize: 9),
                        ),
                        Image.asset(
                          'assets/logo/master.jpg',
                          scale: 16,
                        ),
                        Image.asset(
                          'assets/logo/jcb.jpg',
                          scale: 38,
                        ),
                        Icon(
                          Icons.more_horiz_outlined,
                          size: 15,
                        )
                      ],
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 10, right: 15),
                    horizontalTitleGap: 23,
                    leading: Image.asset(
                      'assets/logo/counter.jpg',
                      // scale: 2,
                    ),
                    title: Text(
                      "Bayar di counter",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Text(
                      "Alfamart/Indomaret",
                      style: TextStyle(fontSize: 9),
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 15, right: 15),
                    horizontalTitleGap: 30,
                    leading: Image.asset('assets/logo/klikbca.jpg', scale: 10),
                    title: Text(
                      "KlikBCA",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Text(
                      "Internet Banking",
                      style: TextStyle(fontSize: 9),
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 15, right: 15),
                    horizontalTitleGap: 30,
                    leading: Image.asset('assets/logo/debit.jpeg', scale: 7),
                    title: Text(
                      "Debit Instan",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Text(
                      "untuk Nasabah BRI & BNI",
                      style: TextStyle(fontSize: 9),
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 10, right: 15),
                    horizontalTitleGap: 30,
                    leading: Image.asset(
                      'assets/logo/cicilan.png',
                      width: 50,
                    ),
                    title: Text(
                      "Cicilan Kartu Kredit",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image.asset(
                          'assets/logo/master.jpg',
                          scale: 16,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/logo/jcb.jpg',
                          scale: 38,
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(
                          Icons.more_horiz_outlined,
                          size: 15,
                        )
                      ],
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)),
                  child: ListTile(
                    contentPadding: EdgeInsets.only(left: 15, right: 15),
                    horizontalTitleGap: 20,
                    leading: Image.asset('assets/logo/cod.png', scale: 6),
                    title: Text(
                      "Bayar di Tempat",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                    ),
                    subtitle: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Tidak tersedia. Klik untuk info lengkap",
                          style: TextStyle(fontSize: 9),
                        ),
                        Icon(
                          Icons.navigate_next,
                          size: 15,
                        )
                      ],
                    ),
                    trailing: Icon(
                      Icons.navigate_next,
                      color: Colors.blue,
                    ),
                  ),
                ),
                SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image.asset(
                      'assets/logo/norton.png',
                      scale: 20,
                      color: Colors.grey,
                    ),
                    Image.asset(
                      'assets/logo/pci.png',
                      scale: 10,
                      color: Colors.grey,
                    ),
                    Image.asset(
                      'assets/logo/verivedvisa.png',
                      scale: 10,
                      color: Colors.grey,
                    ),
                    Image.asset(
                      'assets/logo/securecode.png',
                      scale: 8,
                      color: Colors.grey,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    //
                  },
                  child: Container(
                    height: 35,
                    decoration: BoxDecoration(
                        color: AppColor.deep_orange,
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "Mengkonfirmasi pilihan",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
