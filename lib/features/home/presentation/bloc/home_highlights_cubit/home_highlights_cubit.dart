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
    fetchHighlights();
  }

  Future<void> fetchHighlights() async {
    emit(HomeHighlightsLoading());
    final result = await _getHighlightsUsecase();
    final state = result.fold(
      (failure) => HomeHighlightsError(message: failure.message),
      (highlights) => HomeHighlightsLoaded(highlights: highlights),
    );
    emit(state);
  }
}
