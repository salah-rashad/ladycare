import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';
import '../../data/models/services_category.dart';
import '../../domain/entities/salon_group.dart';
import 'salon_category_chip.dart';
import 'salon_tile.dart';

enum SalonCardType { compact, comfortable }

class SalonCard extends StatelessWidget {
  final SalonGroup salonGroup;
  final SalonCardType type;

  const SalonCard({
    super.key,
    required this.salonGroup,
    this.type = SalonCardType.compact,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: context.colors.container,
        boxShadow: [context.boxShadowTheme.surfaceShadowLite],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SalonTile(
            salon: salonGroup.salon,
            amenities: salonGroup.amenities,
            tileType: SalonTileType.withAmenities,
          ),
          // images list
          _categoriesList(salonGroup.categories)
        ].withGap(height: 16.0),
      ),
    );
  }

  Widget _categoriesList(List<ServicesCategory> categories) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: categories
            .map((category) {
              return SalonCategoryChip(label: category.name);
            })
            .toList()
            .withGap(width: 8.0),
      ),
    );
  }
}
