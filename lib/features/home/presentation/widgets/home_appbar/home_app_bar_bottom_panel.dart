import 'package:flutter/material.dart';

import '../../../../../../../core/gen/assets.gen.dart';
import '../../../../../../../core/utils/extensions.dart';
import '../../../../../global/widgets/custom_sliver_persistent_header_delegate.dart';

class HomeAppBarBottomPanel extends StatelessWidget {
  final ExtrapolationFactor t;

  const HomeAppBarBottomPanel({
    super.key,
    required this.t,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 64.0,
      child: Row(
        children: [
          _loyalityPointsCard(context),
          _scanQrCodeButton(context),
        ].withGap(width: 8.0),
      ),
    );
  }

  Widget _loyalityPointsCard(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          color: context.colors.tertiary,
          boxShadow: [context.boxShadowTheme.surfaceShadow],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Row(
          children: [
            Assets.images.pointsIcon.image(
              width: 30.0,
              height: 30.0,
              fit: BoxFit.contain,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "نقاطك",
                    style: context.textTheme.labelLarge
                        .apply(color: Colors.white),
                  ),
                  Flexible(
                    child: Text(
                      "12 مكافأة ، 2 عرض ، 3 بطاقة إهداء",
                      style: context.textTheme.labelMedium
                          .apply(color: Colors.white70),
                      maxLines: 2,
                      overflow: TextOverflow.visible,
                    ),
                  ),
                ],
              ),
            )
          ].withGap(width: 8.0),
        ),
      ),
    );
  }

  Widget _scanQrCodeButton(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1 / 1,
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: context.colors.surface,
          boxShadow: [context.boxShadowTheme.surfaceShadow],
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: Assets.solarIcons.lineDuotone.qRCode(
          color: context.colors.primaryText,
          size: const Size.square(24.0),
        ),
      ),
    );
  }
}
