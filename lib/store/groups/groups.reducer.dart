import 'package:amiadporat/models/lesson/groupLesson/groupLesson.dart';
import 'package:amiadporat/store/groups/groups.actions.dart';
import 'package:amiadporat/store/groups/groups.state.dart';
import 'package:redux/redux.dart';

GroupsState _addManyGroups(GroupsState state, AddManyGroups action) {
  Map<String, GroupLesson> groups = state.groups;
  action.groups.forEach((group) {
    if (group != null) {
      groups.putIfAbsent(group.id, () => group);
    }
  });
  return state.copyWith(groups: groups);
}

GroupsState _changeIsLoadingGroups(
    GroupsState state, ChangeIsLoadingGroups action) {
  return state.copyWith(isLoading: action.isLoading);
}

GroupsState _changeGroupsError(GroupsState state, ChangeGroupsError action) {
  return state.copyWith(error: action.error);
}

final groupsReducer = combineReducers<GroupsState>([
  TypedReducer<GroupsState, AddManyGroups>(_addManyGroups),
  TypedReducer<GroupsState, ChangeIsLoadingGroups>(_changeIsLoadingGroups),
  TypedReducer<GroupsState, ChangeGroupsError>(_changeGroupsError),
]);
