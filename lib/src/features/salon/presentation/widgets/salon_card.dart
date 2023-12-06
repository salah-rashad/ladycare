import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/routes/routes.dart';
import '../../../../core/utils/extensions.dart';
import '../../data/models/salon.dart';
import 'salon_category_chip.dart';
import 'salon_tile.dart';

enum SalonCardType { compact, comfortable }

class SalonCard extends StatelessWidget {
  final Salon salon;
  final SalonCardType type;

  const SalonCard({
    super.key,
    required this.salon,
    this.type = SalonCardType.compact,
  });

  List<String> get categoryNames => salon.services
      .groupListsBy<String>(
        (element) => element.category?.name ?? "غير مصنف",
      )
      .keys
      .toList()
    ..sort();

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: context.colors.container,
        boxShadow: [context.boxShadowTheme.surfaceShadowLite],
        borderRadius: BorderRadius.circular(20),
      ),
      child: Material(
        type: MaterialType.transparency,
        child: InkWell(
          onTap: () {
            context.pushNamed(Routes.SALON_PROFILE.name, extra: salon);
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SalonTile(
                  salon: salon,
                  amenities: salon.amenities,
                  tileType: SalonTileType.withAmenities,
                ),
                _categoriesList()
              ].withGap(height: 16.0),
            ),
          ),
        ),
      ),
    );
  }

  Widget _categoriesList() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: categoryNames
            .map((category) {
              return SalonCategoryChip(label: category);
            })
            .toList()
            .withGap(width: 8.0),
      ),
    );
  }
}
