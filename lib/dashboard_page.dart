import 'package:doro_mart/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/color_palette.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette().scaffoldBg,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        //todo
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 42.0,
                        width: 42.0,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/images/model.jpg'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(12.0)),
                      ),
                    ),
                    Image.asset(
                      "assets/logos/logo.png",
                      height: 80,
                      width: 200,
                    ),
                    GestureDetector(
                      onTap: () {
                        //todo
                      },
                      child: Container(
                        padding: EdgeInsets.all(8.0),
                        height: 42.0,
                        width: 42.0,
                        decoration: BoxDecoration(
                            color: ColorPalette().btnBg,
                            borderRadius: BorderRadius.circular(12.0)),
                        child: Icon(
                          Icons.shopping_cart,
                          size: 24.0,
                          color: ColorPalette().btnFill,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, top: 15.0),
                width: (MediaQuery.of(context).size.width / 3) * 2 + 25.0,
                child: Text('Find Products',
                    style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.bold,
                        color: ColorPalette().textColor,
                        fontSize: 25.0)),
              ),
              SizedBox(height: 20.0),
              SearchBar(),
            ],
          ),
        ));
  }
}
