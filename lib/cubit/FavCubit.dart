import 'package:flutter_bloc/flutter_bloc.dart';

class FavCubit extends Cubit<List<String>> {
  FavCubit() : super([]);

  void addFactToFavorites(String fact) {
    state.add(fact);
    emit(List.from(state));
  }

  void removeFactFromFavorites(String fact) {
    state.remove(fact);
    emit(List.from(state));
  }
}
