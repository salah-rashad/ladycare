import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../injection_container.dart';
import '../../../domain/entities/highlight.dart';
import '../../bloc/home_highlights_cubit/home_highlights_cubit.dart';
import 'highlight_card.dart';

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
    return BlocBuilder<HomeHighlightsCubit, HomeHighlightsState>(
      builder: (context, state) {
        switch (state) {
          case HomeHighlightsInitial():
            return const Center(
              child: CircularProgressIndicator(),
            );
          case GetHighlightsSucceed():
            final highlights = state.highlights;
            return _succeedView(context, highlights);
          case GetHighlightsFailed():
            return Center(
              child: Text(state.message),
            );
        }
      },
    );
  }

  Widget _succeedView(BuildContext context, List<Highlight> highlights) {
    // final screenSize = context.mediaQuery.size;
    final bool autoplay = highlights.length >= 2;
    final bool enableInfiniteScroll = highlights.length >= 2;
    return CarouselSlider(
      options: CarouselOptions(
        autoPlay: autoplay,
        // aspectRatio: 16 / 9,
        enableInfiniteScroll: enableInfiniteScroll,
        height: 160,
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
