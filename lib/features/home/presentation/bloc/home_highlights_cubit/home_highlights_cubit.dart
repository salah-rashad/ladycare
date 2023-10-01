import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/highlight.dart';
import '../../../domain/usecases/get_highlights_usecase.dart';

part 'home_highlights_state.dart';

class HomeHighlightsCubit extends Cubit<HomeHighlightsState> {
  final GetHighlightsUsecase _getHighlightsUsecase;
  HomeHighlightsCubit(this._getHighlightsUsecase)
      : super(HomeHighlightsInitial());

  Future<void> fetchHighlights() async {
    emit(HomeHighlightsLoading());
    final result = await _getHighlightsUsecase();
    final state = result.fold(
      (failure) => HomeHighlightsFailed(message: failure.message),
      (highlights) => HomeHighlightsSucceed(highlights: highlights),
    );
    emit(state);
  }
}
