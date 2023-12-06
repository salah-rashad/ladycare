import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../common/widgets/errors_list.dart';
import '../../../../../core/config/env.dart';
import '../../../data/models/highlight.dart';
import '../../bloc/home_highlights_cubit/home_highlights_cubit.dart';
import 'highlight_card.dart';
import 'highlights_shimmer.dart';

class HomeHighlightsCarousalSlider extends StatelessWidget {
  const HomeHighlightsCarousalSlider({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: sl<HomeHighlightsCubit>(),
      child: _build(context),
    );
  }

  Widget _build(BuildContext context) {
    const sliderSize = Size.fromHeight(160);

    return BlocBuilder<HomeHighlightsCubit, HomeHighlightsState>(
      builder: (context, state) {
        switch (state) {
          case HomeHighlightsInitial():
          case HomeHighlightsLoading():
            return const HighlightsShimmer(
              size: sliderSize,
            );
          case HomeHighlightsSucceed():
            final highlights = state.highlights;
            return _succeedView(context, highlights, sliderSize);
          case HomeHighlightsFailed():
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: ErrorsList(messages: [state.message]),
            );
        }
      },
    );
  }

  Widget _succeedView(
    BuildContext context,
    List<Highlight> highlights,
    Size size,
  ) {
    // final screenSize = context.mediaQuery.size;
    final bool autoplay = highlights.length >= 2;
    final bool enableInfiniteScroll = highlights.length >= 2;
    return CarouselSlider(
      options: CarouselOptions(
        clipBehavior: Clip.none,
        autoPlay: autoplay,
        // aspectRatio: 16 / 9,
        enableInfiniteScroll: enableInfiniteScroll,
        height: size.height,
        enlargeCenterPage: true,
        pauseAutoPlayOnManualNavigate: true,
        pauseAutoPlayOnTouch: true,
        autoPlayCurve: Curves.linearToEaseOut,
        viewportFraction: 0.75,
        enlargeFactor: 0.25,
        enlargeStrategy: CenterPageEnlargeStrategy.scale,
        autoPlayInterval: const Duration(seconds: 5),
        autoPlayAnimationDuration: const Duration(milliseconds: 1200),
      ),
      items: highlights.map((item) {
        return HighlightCard(highlight: item);
      }).toList(),

      // dynamicItemSize: true,
    );
  }
}
