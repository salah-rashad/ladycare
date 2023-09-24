import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/highlight.dart';
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
          case HomeHighlightsLoaded():
            final highlights = state.highlights;
            return _succeedView(context, highlights, sliderSize);
          case HomeHighlightsError():
            return Center(
              child: Text(state.message),
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
