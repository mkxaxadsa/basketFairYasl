part of 'match_bloc.dart';

abstract class MatchState {}

final class MatchInitial extends MatchState {}

class MatchesLoadedState extends MatchState {
  final List<MatchModel> matches;
  final List<BasketModel> games;
  MatchesLoadedState({
    required this.matches,
    required this.games,
  });
}
