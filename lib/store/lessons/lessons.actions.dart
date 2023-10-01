import 'package:amiadporat/models/lesson/tutorLesson/lesson.dart';

class AddLesson {
  final Lesson lesson;

  AddLesson({required this.lesson});
}

class AddManyLessons {
  final List<Lesson> lessons;
  final DateTime earliestLesson;

  AddManyLessons({required this.lessons, required this.earliestLesson});
}

class RemoveLesson {
  final String lessonId;

  RemoveLesson({required this.lessonId});
}

class ChangeLessonError {
  final String error;

  ChangeLessonError({required this.error});
}

class ChangeIsLoadingLessons {
  final bool isLoading;

  ChangeIsLoadingLessons({required this.isLoading});
}
