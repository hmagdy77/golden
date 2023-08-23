import 'package:flutter/material.dart';

import '../../../core/constants/app_image_assets.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(8.0),
      child: Image(
        image: AssetImage(AppImageAssets.logo),
        width: double.infinity,
      ),
    );
  }
}
