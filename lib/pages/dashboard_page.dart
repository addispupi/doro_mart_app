import 'package:DoroMart/models/product_item.dart';
import 'package:DoroMart/pages/product_detail.dart';
import 'package:DoroMart/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/color_palette.dart';

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

  final List<ProductItem> productList = [
    ProductItem(
        prodTitle: 'Double Burger',
        prodImgUri: 'assets/images/secondary.jpg',
        prodDesc: 'Big bread with salad and beef',
        prodMenu: 'Launch,Dinner',
        prodPrice: '250',
        prodScore: 4.5,
        prodType: 'Burger',
        prodIngredients: 'Beef, Salad, Onion, Cheese, Tomato'),
    ProductItem(
        prodTitle: 'Pizza 20cm',
        prodImgUri: 'assets/images/coffeemain.jpg',
        prodDesc: '20 Diameter Fasting Pizza',
        prodMenu: 'Launch,Dinner',
        prodPrice: '480',
        prodScore: 3.9,
        prodType: 'Pizza',
        prodIngredients: 'Beef, Onion, Cheese'),
    ProductItem(
      prodTitle: 'Cochin Fried Chicken',
      prodImgUri: 'assets/images/beansbottom.jpg',
      prodDesc:
          'Cochin Fried Chicken, the Headquarters of Fried Chicken, combines Cochin Chicken sourced from abroad with a blend of homemade sauces to serve delicious meals.',
      prodPrice: '450',
      prodType: 'Chicken',
      prodMenu: 'Breakfast, Dinner',
      prodScore: 4.1,
      prodIngredients: 'Beef, Cheese, Tomato',
    )
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // bottomNavigationBar: _buildBottomBar(),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: ColorPalette().secondaryColor,
            selectedItemColor: ColorPalette().btnActive,
            unselectedItemColor: ColorPalette().btnFill,
            selectedFontSize: 15.0,
            unselectedFontSize: 14.0,
            onTap: (value) {
              //..
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.fastfood_rounded),
                label: 'Menus',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                label: 'My Orders',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notifications',
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(15.0, 25.0, 15.0, 5.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Account Menu
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

                    // Main Logo
                    Image.asset(
                      "assets/logos/logo.png",
                      height: 80,
                      width: 200,
                    ),

                    // Cart Button
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

              // Greetings Text
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                width: (MediaQuery.of(context).size.width / 3) * 3 + 25.0,
                child: Text('Hi Addis, Good Afternoon!',
                    style: GoogleFonts.bebasNeue(fontSize: 25.0)),
              ),
              SizedBox(height: 20.0),

              // Search Bar
              SearchBar(),
              SizedBox(height: 20.0),

              // Product Types Tabs
              Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                  child: ShaderMask(
                    shaderCallback: (Rect bounds) {
                      return LinearGradient(
                              begin: Alignment(0.6, -1.0),
                              end: Alignment(1.1, -1.0),
                              colors: <Color>[Colors.black, Colors.transparent])
                          .createShader(bounds);
                    },
                    blendMode: BlendMode.dstIn,
                    child: Container(
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
                        )),
                  )),
              SizedBox(height: 10.0),

              // Products
              Container(
                height: (MediaQuery.of(context).size.height / 2) + 20.0,
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  padding: EdgeInsets.only(top: 5.0),
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 15.0, right: 15.0),
                      child: Container(
                        // color: ColorPalette().primaryColor,
                        width: MediaQuery.of(context).size.width - 10.0,
                        height: 255.0,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            ...productList.map((e) {
                              return _buildProducts(e);
                            }).toList()
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
                      child: Text(
                        'Special Foods',
                        style: GoogleFonts.bebasNeue(
                            fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
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
                                      image: AssetImage(
                                          'assets/images/beansbottom.jpg'),
                                      fit: BoxFit.cover)),
                            ),
                            Container(
                              height: 115.0,
                              child: Container(
                                height: 100.0,
                                width:
                                    MediaQuery.of(context).size.width - 185.0,
                                child: Text(
                                  'Special Doro Wet',
                                  style: GoogleFonts.bebasNeue(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            )
                          ],
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
                        : ColorPalette().primaryColor,
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

  Widget _buildProducts(ProductItem cItem) {
    return Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.0),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ProductDetail(foodItem: cItem)));
          },
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: <Color>[
                    ColorPalette().primaryGradientStart,
                    ColorPalette().primaryGradientEnd
                  ]),
            ),
            height: 200.0,
            width: 150.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 145.0,
                  width: 150.0,
                  child: Stack(
                    children: [
                      Positioned(
                        top: 10.0,
                        left: 10.0,
                        child: Hero(
                            tag: cItem.prodImgUri.toString(),
                            child: Container(
                              height: 125.0,
                              width: 130.0,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(cItem.prodImgUri!),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(20.0)),
                            )),
                      ),
                      Positioned(
                          right: 10.0,
                          top: 10.0,
                          child: Container(
                            height: 25.0,
                            width: 50.0,
                            decoration: BoxDecoration(
                                color: ColorPalette()
                                    .primaryGradientStart
                                    .withOpacity(0.7),
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(15.0),
                                    bottomLeft: Radius.circular(15.0))),
                            child: Center(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: ColorPalette().btnActive,
                                    size: 15.0,
                                  ),
                                  Text(
                                    cItem.prodScore.toString(),
                                    style: GoogleFonts.sourceSansPro(
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, bottom: 5.0),
                  child: Text(
                    cItem.prodTitle!,
                    style: GoogleFonts.bebasNeue(
                        fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0),
                  child: Text(
                    cItem.prodMenu!,
                    style: GoogleFonts.bebasNeue(
                        fontSize: 15.0,
                        fontWeight: FontWeight.w400,
                        color: ColorPalette().inputText),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 10.0, right: 10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 40.0,
                        width: 60.0,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(cItem.prodPrice!,
                                style: GoogleFonts.sourceCodePro(
                                    fontWeight: FontWeight.bold,
                                    color: ColorPalette().btnActive,
                                    fontSize: 19.0)),
                            Text('ETB',
                                style: GoogleFonts.sourceCodePro(
                                    fontWeight: FontWeight.bold))
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          //..
                        },
                        child: Container(
                          height: 30.0,
                          width: 30.0,
                          decoration: BoxDecoration(
                              color: ColorPalette().secondaryColor,
                              borderRadius: BorderRadius.circular(10.0)),
                          child: Center(child: Icon(Icons.add, size: 25.0)),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }

  // Widget _buildBottomBar() {
  //   return Container(
  //     padding: EdgeInsets.only(left: 25.0, right: 25.0),
  //     height: 50.0,
  //     decoration: BoxDecoration(color: ColorPalette().secondaryColor),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //       children: [
  //         Container(
  //           child: Icon(
  //             Icons.home_filled,
  //             size: 30.0,
  //             color: ColorPalette().btnActive,
  //           ),
  //         ),
  //         Icon(
  //           Icons.fastfood_rounded,
  //           size: 30.0,
  //           color: ColorPalette().inputTextBg,
  //         ),
  //         Icon(
  //           Icons.favorite,
  //           size: 30.0,
  //           color: ColorPalette().inputTextBg,
  //         ),
  //         Container(
  //           child: Stack(
  //             children: [
  //               Icon(
  //                 Icons.notifications,
  //                 size: 30.0,
  //                 color: ColorPalette().inputTextBg,
  //               ),
  //               Positioned(
  //                 top: 5.0,
  //                 left: 18.0,
  //                 child: Container(
  //                   height: 7.0,
  //                   width: 7.0,
  //                   decoration: BoxDecoration(
  //                       borderRadius: BorderRadius.circular(7),
  //                       color: ColorPalette().textColor),
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
