import 'package:flutter/material.dart';

class CircleButtom extends StatelessWidget {
  const CircleButtom({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        margin: EdgeInsets.only(top: 10),
        child: Column(children: [
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconCircleButton(
                  icon: Icons.logout_sharp,
                  colors: Colors.green,
                  textButton: 'Gratis Ongkir',
                  onTap: () {
                    //
                  },
                ),
                IconCircleButton(
                  icon: Icons.description_outlined,
                  colors: Colors.blueAccent,
                  textButton: 'Cashback',
                  onTap: () {
                    //
                  },
                ),
                IconCircleButton(
                  icon: Icons.credit_card,
                  colors: Colors.green,
                  textButton: 'Promo & Diskon',
                  onTap: () {
                    //
                  },
                ),
                IconCircleButton(
                  icon: Icons.stop_circle,
                  colors: Colors.orange,
                  textButton: 'Ambil Koin',
                  onTap: () {
                    //
                  },
                ),
                IconCircleButton(
                  icon: Icons.shopping_bag_outlined,
                  colors: Colors.pink,
                  textButton: 'MilesMall',
                  onTap: () {
                    //
                  },
                ),
                IconCircleButton(
                  icon: Icons.change_circle_outlined,
                  colors: Color.fromARGB(255, 156, 214, 228),
                  textButton: 'Pulsa & Tagihan',
                  onTap: () {
                    //
                  },
                ),
                IconCircleButton(
                  icon: Icons.qr_code_2,
                  colors: const Color.fromARGB(255, 12, 126, 220),
                  textButton: 'Miles Beauty',
                  onTap: () {
                    //
                  },
                ),
                IconCircleButton(
                    icon: Icons.analytics_outlined,
                    colors: Color.fromARGB(255, 24, 114, 114),
                    textButton: 'PayLatter',
                    onTap: () {
                      //
                    }),
                IconCircleButton(
                  icon: Icons.money_outlined,
                  colors: Colors.purple,
                  textButton: 'MilesHealth',
                  onTap: () {
                    //
                  },
                ),
                IconCircleButton(
                  icon: Icons.location_city_outlined,
                  colors: const Color.fromARGB(255, 9, 43, 71),
                  textButton: 'Tech Junkies',
                  onTap: () {
                    //
                  },
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

class IconCircleButton extends StatelessWidget {
  IconCircleButton({
    super.key,
    required this.onTap,
    required this.icon,
    required this.colors,
    required this.textButton,
  });
  final Function onTap;
  final IconData icon;
  final Color colors;
  final String textButton;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap(),
      child: Container(
        width: 70,
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: colors,
              radius: 25,
              child: Icon(icon, color: Colors.white),
            ),
            Container(
              height: 40,
              margin: EdgeInsets.only(left: 10, right: 3),
              child: Center(
                child: Text(
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  textButton,
                  style: TextStyle(
                    fontSize: 11,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
