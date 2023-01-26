import 'package:doro_mart/constants/color_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 15.0, right: 15.0),
      child: Container(
        padding: EdgeInsets.all(5.0),
        width: MediaQuery.of(context).size.width - 30.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: ColorPalette().inputTextBg),
        child: TextField(
          decoration: InputDecoration(
              filled: true,
              hintText: 'Find Products . . .',
              contentPadding: EdgeInsets.fromLTRB(10.0, 7.0, 7.0, 12.0),
              hintStyle: GoogleFonts.sourceSansPro(
                  color: ColorPalette().textColor, fontSize: 20.0),
              border: InputBorder.none,
              fillColor: ColorPalette().inputTextBg,
              prefixIcon: Padding(
                padding: EdgeInsets.only(right: 6.0, left: 6.0),
                child: Icon(
                  Icons.search_rounded,
                  size: 30.0,
                  color: ColorPalette().secondaryColor,
                ),
              ),
              prefixIconConstraints:
                  BoxConstraints(maxHeight: 20.0, maxWidth: 40.0),
              prefixIconColor: ColorPalette().secondaryColor),
          style: GoogleFonts.sourceCodePro(),
        ),
      ),
    );
  }
}
