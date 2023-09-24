part of 'home_highlights_cubit.dart';

sealed class HomeHighlightsState extends Equatable {
  const HomeHighlightsState();

  @override
  List<Object> get props => [];
}

final class HomeHighlightsInitial extends HomeHighlightsState {}

final class GetHighlightsSucceed extends HomeHighlightsState {
  final List<Highlight> highlights;
  const GetHighlightsSucceed({required this.highlights});

  @override
  List<Object> get props => [highlights];
}

final class GetHighlightsFailed extends HomeHighlightsState {
  final String message;
  const GetHighlightsFailed({required this.message});

  @override
  List<Object> get props => [message];
}
