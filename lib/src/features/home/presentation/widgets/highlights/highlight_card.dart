import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../../../../../core/utils/extensions.dart';
import '../../../data/models/highlight.dart';

class HighlightCard extends StatelessWidget {
  final Highlight highlight;
  const HighlightCard({super.key, required this.highlight});

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 260,
      // height: 160,
      alignment: Alignment.center,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        boxShadow: [context.boxShadowTheme.surfaceShadow],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: highlight.imageUrl,
              fit: BoxFit.cover,
            ),
          ),
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withOpacity(0),
                    Colors.black.withOpacity(0.5)
                  ],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      highlight.label,
                      style: context.textTheme.headlineSmall.apply(
                        color: context.colors.white,
                        shadows: [
                          const Shadow(
                            blurRadius: 3,
                            color: Colors.black,
                            offset: Offset(0, 1),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
