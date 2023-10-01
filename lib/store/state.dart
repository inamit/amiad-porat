import 'package:amiadporat/store/groups/groups.reducer.dart';
import 'package:amiadporat/store/groups/groups.state.dart';
import 'package:amiadporat/store/lessons/lessons.reducer.dart';
import 'package:amiadporat/store/lessons/lessons.state.dart';
import 'package:meta/meta.dart';

@immutable
class AppState {
  final LessonsState lessonsState;
  final GroupsState groupsState;

  AppState({required this.lessonsState, required this.groupsState});

  factory AppState.initial() {
    return new AppState(
        lessonsState: LessonsState.initial(),
        groupsState: GroupsState.initial());
  }
}

AppState appReducer(AppState state, dynamic action) => new AppState(
    lessonsState: lessonsReducer(state.lessonsState, action),
    groupsState: groupsReducer(state.groupsState, action));
