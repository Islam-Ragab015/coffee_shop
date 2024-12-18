import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/assets_manager.dart';

class CustomCoffeeAppBar extends StatelessWidget {
  const CustomCoffeeAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        SvgPicture.asset(ImageAssets.category),
        Image.asset(ImageAssets.ellipse2),
      ],
    );
  }
}
