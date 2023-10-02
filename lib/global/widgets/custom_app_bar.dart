import 'package:flutter/material.dart';

import '../../core/utils/extensions.dart';

class CustomAppBar extends PreferredSize {
  final String? title;
  final Widget? leading;
  final List<Widget>? actions;
  final bool centerTitle;
  final Color? backgroundColor;
  final PreferredSizeWidget? bottom;

  const CustomAppBar({
    super.key,
    this.title,
    this.leading,
    this.actions,
    this.centerTitle = true,
    this.backgroundColor,
    this.bottom,
  }) : super(
          child: const SizedBox.shrink(),
          preferredSize: const Size.fromHeight(56),
        );

  @override
  Size get preferredSize =>
      Size.fromHeight(56 + (bottom?.preferredSize.height ?? 0));

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.bottomCenter,
      color: backgroundColor ?? context.colors.surface,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 32.0, left: 32.0),
            child: AppBar(
              title: title != null ? Text(title!) : null,
              centerTitle: centerTitle,
              titleTextStyle: context.textTheme.headlineMedium,
              backgroundColor: backgroundColor ?? context.colors.surface,
              surfaceTintColor: backgroundColor ?? context.colors.surface,
              scrolledUnderElevation: 0,
              elevation: 0,
              leading: leading,
              actions: actions,
            ),
          ),
          if (bottom != null) Expanded(child: bottom!),
        ],
      ),
    );
  }
}
