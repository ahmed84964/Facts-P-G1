import 'package:flutter/material.dart';

import '../widget/custom_app_bar.dart';
import '../widget/custom_button.dart';
import '../widget/custom_icon.dart';
import 'favourate_fact_page.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(text: "Daily Facts"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                color: Colors.blueGrey,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Fun Fact",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Text(
                    "the fact",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [CustomIcon(icon: Icons.add_rounded,),
                      CustomIcon(icon: Icons.star_rounded,),],
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                CustomButton(text: 'Fav', onPressed: () { Navigator.push(context, MaterialPageRoute(builder: (context) =>FavScreen())); },),
                CustomButton(text: 'Generate', onPressed: () {  },),
              ],
            ),
          ],
        ),
      ),
    );
  }
}




