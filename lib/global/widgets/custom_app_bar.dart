import 'package:flutter/material.dart';

class CustomAppBar extends PreferredSize {
  final String? title;
  final List<Widget>? actions;
  final bool centerTitle;

  const CustomAppBar({
    super.key,
    this.title,
    this.actions,
    this.centerTitle = true,
  }) : super(
          child: const SizedBox.shrink(),
          preferredSize: const Size.fromHeight(80),
        );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
    );
  }
}
