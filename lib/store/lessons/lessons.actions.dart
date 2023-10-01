import 'package:amiadporat/models/lesson/tutorLesson/lesson.dart';

class AddLesson {
  final Lesson lesson;

  AddLesson({required this.lesson});
}

class AddManyLessons {
  final List<Lesson> lessons;

  AddManyLessons({required this.lessons});
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
