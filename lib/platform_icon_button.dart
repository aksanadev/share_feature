import 'dart:io';
import 'package:flutter/cupertino.dart';
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
    if (Platform.isIOS) {
      return _buildCupertinoButton();
    } else {
      return _buildMaterialButton();
    }
  }

  Widget _buildCupertinoButton() {
    return CupertinoButton(
      key: keyValue,
      child: customIcon,
      onPressed: () {
        onPressed();
      });
  }

  Widget _buildMaterialButton() {
    return IconButton(
      icon: customIcon,
      onPressed: () {
        onPressed();
      },
    );
  }
}
