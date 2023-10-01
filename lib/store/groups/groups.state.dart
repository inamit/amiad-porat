import 'package:amiadporat/models/lesson/groupLesson/groupLesson.dart';
import 'package:flutter/material.dart';

@immutable
class GroupsState {
  final Map<String, GroupLesson> groups;
  final String? error;
  final bool isLoading;

  GroupsState({
    required this.groups,
    this.error,
    required this.isLoading,
  });

  factory GroupsState.initial() {
    return GroupsState(groups: {}, isLoading: false);
  }

  GroupsState copyWith(
      {Map<String, GroupLesson>? groups, String? error, bool? isLoading}) {
    return new GroupsState(
      groups: groups ?? this.groups,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
    );
  }
}
