import 'package:flutter/material.dart';

import '../constants/color_palette.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: TextField(
        decoration: InputDecoration(
            prefixIcon: Icon(Icons.search),
            hintText: 'Find your Product...',
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPalette().inputText),
                borderRadius: BorderRadius.circular(20.0)),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: ColorPalette().inputText),
                borderRadius: BorderRadius.circular(20.0))),
      ),
    );
  }
}
