import 'package:flutter/material.dart';
import 'package:s_bin_collector/src/common/widgets/app_colors.dart';

class AppBackground extends StatelessWidget {
  final Widget child;
  const AppBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
            AppColors.mellowYel,
            AppColors.mellowYel,
            Colors.white
          ])),
      child: child,
    );
  }
}
