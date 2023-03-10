import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PlatformIconButton extends StatelessWidget {
  final GlobalKey keyValue;
  final Icon customIcon;
  final Function onPressed;
  
  const PlatformIconButton(
    {super.key,
    required this.keyValue,
    required this.customIcon,
    required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
        color: Colors.red,
        key: keyValue,
        child: customIcon,
        onPressed: () {
          onPressed();
        });
  }
}