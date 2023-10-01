import 'package:amiadporat/models/lesson/tutorLesson/lesson.dart';
import 'package:flutter/material.dart';

@immutable
class LessonsState {
  final Map<String, Lesson> lessons;
  final String? error;
  final bool isLoading;
  final DateTime? firstLoadedDate;

  LessonsState({
    required this.lessons,
    this.error,
    required this.isLoading,
    this.firstLoadedDate,
  });

  factory LessonsState.initial() {
    return LessonsState(lessons: {}, isLoading: false);
  }

  LessonsState copyWith({Map<String, Lesson>? lessons,
    String? error,
    bool? isLoading,
    DateTime? firstLoadedDate,
    DateTime? lastLoadedDate}) {
    return new LessonsState(
      lessons: lessons ?? this.lessons,
      error: error ?? this.error,
      isLoading: isLoading ?? this.isLoading,
      firstLoadedDate: firstLoadedDate ?? this.firstLoadedDate,
    );
  }
}
