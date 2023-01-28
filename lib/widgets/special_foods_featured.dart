import 'package:DoroMart/constants/color_palette.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SpecialFoods extends StatefulWidget {
  const SpecialFoods({super.key});

  @override
  State<SpecialFoods> createState() => _SpecialFoodsState();
}

class _SpecialFoodsState extends State<SpecialFoods> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: Text(
            'Special Foods',
            style: GoogleFonts.bebasNeue(
                fontWeight: FontWeight.bold, fontSize: 20.0),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
          child: Container(
            padding: EdgeInsets.all(10.0),
            height: 125.0,
            width: MediaQuery.of(context).size.width - 20.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: <Color>[
                      ColorPalette().primaryGradientStart,
                      ColorPalette().primaryGradientEnd
                    ])),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 115.0,
                  width: 125.0,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15.0),
                      image: DecorationImage(
                          image: AssetImage('assets/images/beansbottom.jpg'),
                          fit: BoxFit.cover)),
                ),
                Container(
                  height: 115.0,
                  child: Container(
                    height: 100.0,
                    width: MediaQuery.of(context).size.width - 185.0,
                    child: Text(
                      'Special Doro Wet',
                      style: GoogleFonts.bebasNeue(
                          fontSize: 20.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }
}
