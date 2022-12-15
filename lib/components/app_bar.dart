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
            child: _buildButtonIcon(leftIcon),
          ),
          Image.asset("assets/logos/logo.png", height: 80, width: 200,),
          _buildButtonIcon(rightIcon),
        ],
      ),
    );
  }

  Widget _buildButtonIcon(IconData icon) {
    return Container(
            padding: EdgeInsets.all(8),
            decoration:
                BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white),
            child: Icon(icon),
          );
  }
}
