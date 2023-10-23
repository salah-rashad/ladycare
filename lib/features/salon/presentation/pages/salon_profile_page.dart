import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/gen/assets.gen.dart';
import '../../../../core/utils/extensions.dart';
import '../../../../global/widgets/custom_app_bar.dart';
import '../../data/models/salon.dart';
import '../widgets/salon_image.dart';

class SalonProfilePage extends StatelessWidget {
  final Salon salon;
  const SalonProfilePage({super.key, required this.salon});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        leading: IconButton(
          onPressed: context.pop,
          icon: Assets.solarIcons.linear.altArrowLeft(matchTextDirection: true),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Assets.solarIcons.linear.heart(),
            tooltip: "إضافة للمفضلة",
          ),
          IconButton(
            onPressed: () {},
            icon: Assets.solarIcons.linear.squareForward(),
            tooltip: "مشاركة",
          ),
          IconButton(
            onPressed: () {},
            icon: Assets.solarIcons.linear.flag(),
            tooltip: "تبليغ عن الصالون",
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 32.0),
        child: Column(
          children: [
            _topPanel(context),
          ].withGap(height: 22.0),
        ),
      ),
    );
  }

  Widget _topPanel(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32.0),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SalonImage(
                url: salon.profileImageUrl,
                size: const Size.square(80.0),
              ),
              Column(
                children: [
                  Text(
                    salon.name,
                    style: context.textTheme.headlineLarge,
                  ),
                ].withGap(height: 4.0),
              )
            ].withGap(width: 16.0),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SalonStatsItem(
                label: "${salon.locations.length} فروع",
                icon:
                    Assets.images.locationIcon.image(width: 32.0, height: 32.0),
              ),
              SalonStatsItem(
                label: "${salon.locations.length} فروع",
                icon:
                    Assets.images.locationIcon.image(width: 32.0, height: 32.0),
              ),
              SalonStatsItem(
                label: "${salon.locations.length} تعليق",
                icon:
                    Assets.images.locationIcon.image(width: 32.0, height: 32.0),
              ),
            ],
          )
        ].withGap(height: 32.0),
      ),
    );
  }
}

class SalonStatsItem extends StatelessWidget {
  final String label;
  final Widget icon;

  const SalonStatsItem({
    super.key,
    required this.label,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        icon,
        Text(
          label,
          style: context.textTheme.labelMedium
              .apply(color: context.colors.tertiaryText),
        )
      ].withGap(height: 8.0),
    );
  }
}
