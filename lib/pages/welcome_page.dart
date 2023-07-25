import 'package:flutter/material.dart';
import 'package:travel/colors.dart';
import 'package:travel/widgets/app_large_text.dart';
import 'package:travel/widgets/responsive_button.dart';

import '../widgets/app_text.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  List images = ["we.jpeg", "aw.jpeg", "indir.jpeg"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder: (_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/" + images[index]),
                fit: BoxFit.cover,
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 150, left: 20, right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AppLargeText(text: "Seyahat"),
                      AppText(
                        text: "Keşfet",
                        size: 30,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: 250,
                        child: AppText(
                          text:
                              "Dağ yürüyüşleri, dayanıklılık testi ile birlikte size inanılmaz bir özgürlük duygusu verir",
                          color: AppColors.txtColor2,
                          size: 14,
                        ),
                      ),
                      SizedBox(
                        height: 40,
                      ),
                      ResponsiveButton(
                        width: 120,
                      ),
                    ],
                  ),
                  Column(
                    children: List.generate(3, (indexDots) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 2),
                        width: 8,
                        height: index==indexDots?25:8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: index==indexDots?AppColors.mainColor:AppColors.mainColor.withOpacity(0.3)),
                      );
                    }),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
