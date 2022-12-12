import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  final IconData leftIcon;
  final IconData rightIcon;
  final Function? leftCallback;
  CustomAppBar(this.leftIcon, this.rightIcon, {this.leftCallback});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 25,
        right: 25,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            // onTap: leftCallback != null ? () => leftCallback!() : null,
            child: Container(
              padding: EdgeInsets.all(8),
              decoration:
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
              child: Icon(leftIcon),
            ),
          ),
          // Image.asset("assets/images/logos/doro_mart_logo.png", height: 80),
          Container(
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Colors.white),
            child: Icon(Icons.shopping_cart),
          ),
        ],
      ),
    );
  }
}
