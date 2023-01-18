// import 'package:share_feature/custom_button.dart';
import 'package:share_feature/platform_icon_button.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StatelessHomePage extends StatelessWidget {
  StatelessHomePage({super.key});
  final GlobalKey _shareKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: PlatformIconButton(
                keyValue: _shareKey,
                customIcon: const Icon(CupertinoIcons.share),
                onPressed: () {
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
                }),
          )
        ],
      ),
    );
  }
}