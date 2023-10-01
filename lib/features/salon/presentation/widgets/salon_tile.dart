import 'package:flutter/material.dart';

import '../../../../../core/gen/assets.gen.dart';
import '../../../../../core/utils/extensions.dart';
import '../../data/models/salon.dart';
import '../../data/models/salon_amenity.dart';
import 'salon_image.dart';

enum SalonTileType { comfortable, compact, withAmenities }

class SalonTile extends StatelessWidget {
  final Salon salon;
  final List<SalonAmenity> amenities;
  final SalonTileType tileType;

  const SalonTile({
    super.key,
    required this.salon,
    required this.amenities,
    this.tileType = SalonTileType.comfortable,
  });

  @override
  Widget build(BuildContext context) {
    return switch (tileType) {
      SalonTileType.comfortable => _comfortableView(context),
      SalonTileType.compact => _compactView(context),
      SalonTileType.withAmenities => _withAmenitiesView(context),
    };
  }

  Widget _comfortableView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SalonImage(url: salon.profileImageUrl),
          Expanded(
            child: Text(
              salon.name,
              style: context.textTheme.headlineSmall
                  ?.apply(color: context.colors.primaryText),
            ),
          ),
          Row(
            children: [
              Text(
                salon.ratingAverage.toString(),
                style: context.textTheme.numbersXSmall
                    ?.apply(color: context.colors.secondaryText),
              ),
              Assets.solarIcons.bold.star(
                color: context.colors.primary,
                size: const Size.square(14.0),
              ),
            ].withGap(width: 8.0),
          )
        ].withGap(width: 16.0),
      ),
    );
  }

  Widget _compactView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SalonImage(url: salon.profileImageUrl),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  salon.name,
                  style: context.textTheme.headlineSmall
                      ?.apply(color: context.colors.primaryText),
                ),
                Row(
                  children: [
                    Text(
                      salon.ratingAverage.toString(),
                      style: context.textTheme.numbersXSmall
                          ?.apply(color: context.colors.secondaryText),
                    ),
                    Assets.solarIcons.bold.star(
                      color: context.colors.primary,
                      size: const Size.square(14.0),
                    ),
                  ].withGap(width: 8.0),
                )
              ].withGap(height: 4.0),
            ),
          ),
        ].withGap(width: 16.0),
      ),
    );
  }

  Widget _withAmenitiesView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SalonImage(url: salon.profileImageUrl),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        salon.name,
                        style: context.textTheme.headlineSmall
                            ?.apply(color: context.colors.primaryText),
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          salon.ratingAverage.toString(),
                          style: context.textTheme.numbersXSmall
                              ?.apply(color: context.colors.secondaryText),
                        ),
                        Assets.solarIcons.bold.star(
                          color: context.colors.primary,
                          size: const Size.square(14.0),
                        ),
                      ].withGap(width: 8.0),
                    ),
                  ].withGap(width: 16.0),
                ),
                Wrap(
                  direction: Axis.horizontal,
                  spacing: 8.0,
                  runSpacing: 8.0,
                  children: _getAmenitiesIcons(context, amenities),
                )
              ].withGap(height: 8.0),
            ),
          )
        ].withGap(width: 16.0),
      ),
    );
  }

  List<Widget> _getAmenitiesIcons(
      BuildContext context, List<SalonAmenity> amenities) {
    final iconValues = Assets.solarIcons.boldDuotone.values;
    final iconWidgets = <Widget>[];
    for (final amenity in amenities) {
      try {
        final icon = iconValues.firstWhere(
          (element) => element.path.endsWith("${amenity.icon}.svg"),
        );
        iconWidgets.add(
            icon(size: const Size.square(18.0), color: context.colors.accent2));
      } catch (e) {
        //
      }
    }
    return iconWidgets;
  }
}
