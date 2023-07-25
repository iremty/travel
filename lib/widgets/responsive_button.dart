import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel/colors.dart';

class ResponsiveButton extends StatelessWidget {
  bool isResponsive;
  double? width;
  ResponsiveButton({this.width, this.isResponsive = false, super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        fixedSize: Size(width!, 60),
        primary: AppColors.mainColor, // Butonun arka plan rengi
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Image.asset("assets/btn.png")],
      ),
    );
  }
}
