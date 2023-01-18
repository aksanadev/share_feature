import 'package:flutter/material.dart';

class PlatformIconButton extends StatelessWidget {
  const PlatformIconButton(
      {super.key,
      required this.keyValue,
      required this.customIcon,
      required this.onPressed});

  final GlobalKey keyValue;
  final Icon customIcon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        key: keyValue,
        icon: customIcon,
        onPressed: () {
          onPressed();
        });
  }
}