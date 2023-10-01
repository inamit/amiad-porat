import 'package:amiadporat/store/lessons/lessons.reducer.dart';
import 'package:amiadporat/store/lessons/lessons.state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final LessonsState lessonsState;

  AppState({required this.lessonsState});

  factory AppState.initial() {
    return new AppState(lessonsState: LessonsState.initial());
  }
}

AppState appReducer(AppState state, dynamic action) =>
    new AppState(lessonsState: lessonsReducer(state.lessonsState, action));
