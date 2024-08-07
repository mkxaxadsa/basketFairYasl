import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/models/basket_model.dart';
import '../../../core/models/match.dart';
import '../../../core/utils.dart';
import '../api/match_api.dart';

part 'match_event.dart';
part 'match_state.dart';

class MatchBloc extends Bloc<MatchEvent, MatchState> {
  List<MatchModel> _matches = [];
  List<BasketModel> _games = [];

  final api = MatchApi();

  MatchBloc() : super(MatchInitial()) {
    on<GetMatchesEvent>((event, emit) async {
      if (matchesList.isEmpty) {
        _matches = await getModels();
        _games = await api.fetchMatches();
        emit(MatchesLoadedState(
          matches: _matches,
          games: _games,
        ));
      } else {
        emit(MatchesLoadedState(
          matches: _matches,
          games: _games,
        ));
      }
    });

    on<AddMatchEvent>((event, emit) async {
      matchesList.add(event.match);
      _matches = await updateModels();
      emit(MatchesLoadedState(
        matches: _matches,
        games: _games,
      ));
    });

    on<DeleteMatchEvent>((event, emit) async {
      matchesList.removeWhere((element) => element.id == event.id);
      _matches = await updateModels();
      emit(MatchesLoadedState(
        matches: _matches,
        games: _games,
      ));
    });
  }
}
