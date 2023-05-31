import 'package:flutter/material.dart';
import 'package:s_bin_collector/src/common/app_tags.dart';
import 'package:s_bin_collector/src/common/widgets/app_colors.dart';

class CommonAppBar extends StatelessWidget {
  final String title;
  final Widget? leadingWidget;
  final List<Widget>? customActions;
  const CommonAppBar({
    super.key,
    required this.title,
    this.leadingWidget,
    this.customActions,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: AppColors.mellowYel,
      automaticallyImplyLeading: false,
      leading: leadingWidget,
      elevation: 0,
      actions: customActions,
      centerTitle: true,
      title: Text(
        title,
        style: AppTags.font20weight500black,
      ),
    );
  }
}
