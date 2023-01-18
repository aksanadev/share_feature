import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final GlobalKey _shareKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'), actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              key: _shareKey,
              icon: Icon(Platform.isIOS ? CupertinoIcons.share : Icons.share),
              onPressed: () {
                // _getPositions();
                final RenderBox shareBox =
                    _shareKey.currentContext!.findRenderObject() as RenderBox;
                final positionShare = shareBox.localToGlobal(Offset.zero);
                Share.share('https://github.com/aksanadev/share_feature',
                    subject: 'Share git Repo',
                    sharePositionOrigin: Rect.fromLTWH(
                        positionShare.dx,
                        positionShare.dy,
                        shareBox.size.width,
                        shareBox.size.height));
              },
            )),
      ]),
    );
  }
}