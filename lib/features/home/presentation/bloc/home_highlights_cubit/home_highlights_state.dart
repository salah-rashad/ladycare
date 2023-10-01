part of 'home_highlights_cubit.dart';

sealed class HomeHighlightsState extends Equatable {
  const HomeHighlightsState();

  @override
  List<Object> get props => [];
}

final class HomeHighlightsInitial extends HomeHighlightsState {}

final class HomeHighlightsLoading extends HomeHighlightsState {}

final class HomeHighlightsSucceed extends HomeHighlightsState {
  final List<Highlight> highlights;
  const HomeHighlightsSucceed({required this.highlights});

  @override
  List<Object> get props => [highlights];
}

final class HomeHighlightsFailed extends HomeHighlightsState {
  final String message;
  const HomeHighlightsFailed({required this.message});

  @override
  List<Object> get props => [message];
}
