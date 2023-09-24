import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../../core/utils/extensions.dart';
import '../../../domain/entities/highlight.dart';
import '../../../domain/usecases/get_highlights_usecase.dart';

part 'home_highlights_state.dart';

class HomeHighlightsCubit extends Cubit<HomeHighlightsState> {
  final GetHighlightsUsecase _getHighlightsUsecase;
  HomeHighlightsCubit(this._getHighlightsUsecase)
      : super(HomeHighlightsInitial()) {
    getHighlights();
  }

  void getHighlights() async {
    final result = await _getHighlightsUsecase();
    final state = result.fold(
      (failure) => GetHighlightsFailed(message: failure.message),
      (highlights) => GetHighlightsSucceed(highlights: highlights),
    );
    emit(state);
  }
}
