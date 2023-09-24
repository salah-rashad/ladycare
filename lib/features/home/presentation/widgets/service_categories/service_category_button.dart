import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';
import '../../../domain/entities/service_category.dart';

class ServiceCategoryButton extends StatelessWidget {
  final ServiceCategory serviceCategory;

  const ServiceCategoryButton({
    super.key,
    required this.serviceCategory,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          clipBehavior: Clip.antiAlias,
          width: 60,
          height: 75,
          decoration: const ShapeDecoration(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(200),
              ),
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: CircleAvatar(
                    backgroundColor: context.colors.accent1
                        .withOpacity(context.isDarkMode ? 0.3 : 0.1),
                  ),
                ),
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: CachedNetworkImage(
                  imageUrl: serviceCategory.iconUrl,
                  fit: BoxFit.contain,
                  errorWidget: (context, url, error) {
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
        Text(
          serviceCategory.name,
          textAlign: TextAlign.center,
          style: context.textTheme.labelLarge,
          maxLines: 2,
        ),
      ].withGap(height: 8.0),
    );
  }
}
