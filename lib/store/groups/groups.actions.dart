import 'package:amiadporat/models/lesson/groupLesson/groupLesson.dart';

class AddManyGroups {
  final List<GroupLesson?> groups;

  AddManyGroups({required this.groups});
}

class ChangeGroupsError {
  final String error;

  ChangeGroupsError({required this.error});
}

class ChangeIsLoadingGroups {
  final bool isLoading;

  ChangeIsLoadingGroups({required this.isLoading});
}
