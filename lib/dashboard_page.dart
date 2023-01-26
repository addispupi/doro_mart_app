import 'package:doro_mart/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants/color_palette.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  final List<String> productTypes = [
    'Sandwich',
    'Chicken',
    'Noodles',
    'Pizza',
    'Salads',
    'Burger'
  ];

  String selectedItem = 'Sandwich';
  int counter = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorPalette().scaffoldBg,
        bottomNavigationBar: _buildBottomBar(),
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
                width: (MediaQuery.of(context).size.width / 3) * 3 + 25.0,
                child: Text('Hi Addis, Good Afternoon!',
                    style: GoogleFonts.sourceSansPro(
                        fontWeight: FontWeight.bold,
                        color: ColorPalette().textColor,
                        fontSize: 25.0)),
              ),
              SizedBox(height: 20.0),
              SearchBar(),
              SizedBox(height: 20.0),

              // Product Types Tabs
              Padding(
                padding: EdgeInsets.only(left: 15.0, right: 15.0),
                child: ShaderMask(
                  shaderCallback: (Rect bounds) {
                    return LinearGradient(
                            begin: Alignment(0.6, -1.0),
                            end: Alignment(1.1, -1.0),
                            colors: <Color>[Colors.black, Colors.transparent])
                        .createShader(bounds);
                  },
                  blendMode: BlendMode.dstATop,
                  child: Container(
                    color: ColorPalette().btnFill,
                    width: MediaQuery.of(context).size.width - 35.0,
                    height: 40.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        ...productTypes.map((e) {
                          counter++;
                          if (counter <= 3)
                            return _buildTypes(e, counter);
                          else {
                            counter = 0;
                            return _buildTypes(e, counter);
                          }
                        }).toList()
                      ],
                    ),
                  ),
                ),
              ),

              // Products
              Container(
                height: (MediaQuery.of(context).size.height / 2) - 50.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  padding: EdgeInsets.only(top: 5.0),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                        color: ColorPalette().primaryColor,
                        width: MediaQuery.of(context).size.width - 10.0,
                        height: 255.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [],
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ));
  }

  Widget _buildTypes(product, counter) {
    return Padding(
      padding: counter != 0
          ? EdgeInsets.only(left: 20.0)
          : EdgeInsets.only(left: 10.0),
      child: Container(
        height: 50.0,
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  selectedItem = product;
                });
              },
              child: Text(
                product,
                style: GoogleFonts.sourceSansPro(
                    fontWeight: FontWeight.bold,
                    color: product == selectedItem
                        ? ColorPalette().secondaryColor
                        : ColorPalette().textColor,
                    fontSize: 18.0),
              ),
            ),
            SizedBox(height: 4.0),
            Container(
              height: 8.0,
              width: 8.0,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4.0),
                  color: product == selectedItem
                      ? ColorPalette().secondaryColor
                      : ColorPalette().primaryColor),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildBottomBar() {
    return Container(
      padding: EdgeInsets.only(left: 25.0, right: 25.0),
      height: 50.0,
      decoration: BoxDecoration(color: ColorPalette().secondaryColor),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Icon(
              Icons.home_filled,
              size: 30.0,
              color: ColorPalette().btnActive,
            ),
          ),
          Icon(
            Icons.fastfood_rounded,
            size: 30.0,
            color: ColorPalette().inputTextBg,
          ),
          Icon(
            Icons.favorite,
            size: 30.0,
            color: ColorPalette().inputTextBg,
          ),
          Container(
            child: Stack(
              children: [
                Icon(
                  Icons.notifications,
                  size: 30.0,
                  color: ColorPalette().inputTextBg,
                ),
                Positioned(
                  top: 5.0,
                  left: 18.0,
                  child: Container(
                    height: 7.0,
                    width: 7.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(7),
                        color: ColorPalette().textColor),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
