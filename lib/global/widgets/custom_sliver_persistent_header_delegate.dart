import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../core/utils/extensions.dart';

typedef ExtrapolationFactor = double Function(double factor);
typedef ExtrapoFactorWidget = Widget Function(ExtrapolationFactor t);

class CustomSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  final ExtrapoFactorWidget topPanel;
  final ExtrapoFactorWidget bottomPanel;
  final ImageProvider<Object> background;
  final EdgeInsets? paddingExpanded;
  final EdgeInsets? paddingCollapsed;

  @override
  final double minExtent;
  @override
  final double maxExtent;
  @override
  final TickerProvider? vsync;
  @override
  final FloatingHeaderSnapConfiguration? snapConfiguration;

  const CustomSliverPersistentHeaderDelegate({
    required this.topPanel,
    required this.bottomPanel,
    required this.background,
    double? minExtent,
    double? maxExtent,
    this.paddingExpanded,
    this.paddingCollapsed,
  })  : minExtent = minExtent ?? 80.0,
        maxExtent = maxExtent ?? 260.0,
        vsync = null,
        snapConfiguration = null;

  const CustomSliverPersistentHeaderDelegate.snap({
    required this.vsync,
    required this.snapConfiguration,
    required this.topPanel,
    required this.bottomPanel,
    required this.background,
    double? minExtent,
    double? maxExtent,
    this.paddingExpanded,
    this.paddingCollapsed,
  })  : minExtent = minExtent ?? 80.0,
        maxExtent = maxExtent ?? 260.0;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    const overlayColor = Color.fromRGBO(0, 0, 0, 0.15);

    return Align(
      child: Container(
        padding: EdgeInsets.lerp(
            paddingCollapsed, paddingExpanded, _t(shrinkOffset, 1.0)),
        decoration: BoxDecoration(
          image: DecorationImage(
            image: background,
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.lerp(
                    context.colors.surface,
                    overlayColor,
                    _t(shrinkOffset, 0.7),
                  ) ??
                  overlayColor,
              BlendMode.srcATop,
            ),
          ),
        ),
        // height: shrinkOffset,
        // width: double.infinity,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: _t(shrinkOffset, 0.3),
                child: bottomPanel((time) => _t(shrinkOffset, time)),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: topPanel((time) => _t(shrinkOffset, time)),
            ),
          ],
        ),
      ),
    );
  }

  double _t(double shrinkOffset, double time) {
    final x = 1.0 - shrinkOffset / (maxExtent * time);
    return clampDouble(x, 0.0, 1.0);
  }

  @override
  bool shouldRebuild(
          covariant CustomSliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.minExtent != minExtent ||
      oldDelegate.maxExtent != maxExtent ||
      oldDelegate.background != background ||
      oldDelegate.topPanel != topPanel ||
      oldDelegate.bottomPanel != bottomPanel ||
      oldDelegate.paddingExpanded != paddingExpanded ||
      oldDelegate.paddingCollapsed != paddingCollapsed;
}
