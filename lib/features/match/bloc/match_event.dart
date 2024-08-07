part of 'match_bloc.dart';

abstract class MatchEvent {}

class GetMatchesEvent extends MatchEvent {}

class AddMatchEvent extends MatchEvent {
  final MatchModel match;
  AddMatchEvent({required this.match});
}

class DeleteMatchEvent extends MatchEvent {
  final int id;
  DeleteMatchEvent({required this.id});
}
