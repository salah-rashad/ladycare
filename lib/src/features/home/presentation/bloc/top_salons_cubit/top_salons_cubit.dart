import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../salon/data/models/salon.dart';
import '../../../../salon/domain/usecases/get_top_rated_salons_usecase.dart';

part 'top_salons_state.dart';

class TopSalonsCubit extends Cubit<TopSalonsState> {
  final GetTopRatedSalonsUsecase _getTopRatedSalonsUsecase;
  TopSalonsCubit(this._getTopRatedSalonsUsecase) : super(TopSalonsInitial());

  Future<void> fetchTopSalons() async {
    emit(TopSalonsLoading());
    const params = GetTopRatedSalonsParams(limit: 5);
    final result = await _getTopRatedSalonsUsecase(params);
    final state = result.fold(
      (failure) => TopSalonsFailed(message: failure.message),
      (salons) => TopSalonsSucceed(salons: salons),
    );
    emit(state);
  }
}
