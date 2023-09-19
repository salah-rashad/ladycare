import 'package:flutter/material.dart';

class FlexiblePage extends StatelessWidget {
  final double? height;
  final Widget? child;
  final EdgeInsetsGeometry? padding;
  const FlexiblePage({super.key, this.height, this.child, this.padding});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: padding ?? EdgeInsets.zero,
            child: child,
          ),
        ),
      ],
    );
  }
}
