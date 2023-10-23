import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/extensions.dart';

class SalonImage extends StatelessWidget {
  final String url;
  final double radius;
  final Size size;
  const SalonImage({
    super.key,
    required this.url,
    this.radius = 12.0,
    this.size = const Size.square(48.0),
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: size.width,
          height: size.height,
          clipBehavior: Clip.hardEdge,
          decoration: ShapeDecoration(
            color: context.colors.surface,
            shape: RoundedRectangleBorder(
              side: const BorderSide(
                width: 2,
                color: Color(0x599CABC2),
                strokeAlign: BorderSide.strokeAlignOutside,
              ),
              borderRadius: BorderRadius.circular(radius),
            ),
          ),
          child: CachedNetworkImage(
            imageUrl: url,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return const SizedBox.shrink();
            },
          ),
        ),
      ],
    );
  }
}
