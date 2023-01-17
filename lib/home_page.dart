import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GlobalKey _shareKey = GlobalKey();

  _getPositions() {
    final RenderBox shareBox =
        _shareKey.currentContext!.findRenderObject() as RenderBox;
    final positionShare = shareBox.localToGlobal(Offset.zero);
    log('position: $positionShare');
  }

  _afterLayout(_) {
    _getPositions();
  }

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback(_afterLayout);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page'), actions: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: IconButton(
              key: _shareKey,
              icon: const Icon(CupertinoIcons.share),
              onPressed: () {
                _getPositions();
                final RenderBox shareBox = _shareKey.currentContext!.findRenderObject() as RenderBox;
                final positionShare = shareBox.localToGlobal(Offset.zero);
                Share.share('Testing', subject: '', sharePositionOrigin:Rect.fromLTWH(positionShare!.dx, positionShare.dy, shareBox!.size.width, shareBox.size.height));
              },
            )),
      ]),
    );
  }
}
