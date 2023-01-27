import 'package:DoroMart/constants/color_palette.dart';
import 'package:DoroMart/dashboard_page.dart';
import 'package:DoroMart/models/product_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetail extends StatefulWidget {
  final ProductItem foodItem;
  const ProductDetail({super.key, required this.foodItem});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: screenHeight,
            width: screenWidth,
          ),
          Hero(
              tag: widget.foodItem.prodImgUri.toString(),
              child: Container(
                height: (screenHeight / 2) + 120.0,
                width: screenWidth + 20.0,
                decoration: BoxDecoration(
                    image: DecorationImage(
                        image:
                            AssetImage(widget.foodItem.prodImgUri.toString()),
                        fit: BoxFit.cover)),
              )),
          Positioned(
              top: 35.0,
              left: 10.0,
              child: Container(
                color: Colors.transparent,
                height: 50.0,
                width: screenWidth - 20.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: Container(
                        height: 45.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                            color: ColorPalette().btnBg,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: ColorPalette().textColor, width: 1.0)),
                        child: Icon(
                          Icons.arrow_back_ios_new_rounded,
                          size: 25.0,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => DashboardPage(),
                        // ));
                      },
                      child: Container(
                        height: 45.0,
                        width: 45.0,
                        decoration: BoxDecoration(
                            color: ColorPalette().btnBg,
                            borderRadius: BorderRadius.circular(10.0),
                            border: Border.all(
                                color: ColorPalette().textColor, width: 1.0)),
                        child: Icon(
                          Icons.favorite_border_rounded,
                          size: 25.0,
                        ),
                      ),
                    )
                  ],
                ),
              )),
          Positioned(
            top: (screenHeight / 2) - 30.0,
            child: GlassContainer(
              height: 150.0,
              width: screenWidth,
              blur: 5,
              border: Border.fromBorderSide(BorderSide.none),
              borderRadius: BorderRadius.circular(20.0),
              color: ColorPalette().primaryGradientEnd.withOpacity(0.6),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 25.0),
                    height: 140.0,
                    width: (screenWidth - 20.0) / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.foodItem.prodTitle!,
                          style: GoogleFonts.bebasNeue(
                              fontSize: 25.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          widget.foodItem.prodIngredients!,
                          style: GoogleFonts.bebasNeue(
                              fontSize: 17.0,
                              fontWeight: FontWeight.w400,
                              color: ColorPalette().inputText),
                        ),
                        SizedBox(height: 8.0),
                        Row(
                          children: [
                            Icon(
                              Icons.star,
                              color: ColorPalette().btnActive,
                              size: 30.0,
                            ),
                            SizedBox(height: 8.0),
                            Text(
                              widget.foodItem.prodScore.toString(),
                              style: GoogleFonts.bebasNeue(
                                  fontSize: 25.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 15.0, right: 15.0),
                    height: 140.0,
                    width: (screenWidth - 20.0) / 2,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7.0),
                                  color: ColorPalette().textColor),
                              child: Text(widget.foodItem.prodMenu.toString(),
                                  style: GoogleFonts.sourceSansPro(
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.w400)),
                            )
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
