import 'package:amiadporat/models/lesson/tutorLesson/lesson.dart';
import 'package:amiadporat/store/lessons/lessons.actions.dart';
import 'package:amiadporat/store/lessons/lessons.state.dart';
import 'package:redux/redux.dart';

LessonsState addLesson(LessonsState state, AddLesson action) {
  Map<String, Lesson> lessons = state.lessons;
  lessons.putIfAbsent(action.lesson.id, () => action.lesson);
  return state.copyWith(lessons: lessons);
}

LessonsState addManyLessons(LessonsState state, AddManyLessons action) {
  Map<String, Lesson> lessons = state.lessons;
  action.lessons.forEach((lesson) {
    lessons.putIfAbsent(lesson.id, () => lesson);
  });

  if (action.earliestLesson.isBefore(state.firstLoadedDate!)) {
    return state.copyWith(
        lessons: lessons, firstLoadedDate: action.earliestLesson);
  }
  return state.copyWith(lessons: lessons);
}

LessonsState removeLesson(LessonsState state, RemoveLesson action) {
  state.lessons.remove(action.lessonId);
  return state;
}

LessonsState changeLessonError(LessonsState state, ChangeLessonError action) {
  return state.copyWith(error: action.error);
}

LessonsState changeIsLoadingLessons(
    LessonsState state, ChangeIsLoadingLessons action) {
  return state.copyWith(isLoading: action.isLoading);
}

final lessonsReducer = combineReducers([
  new TypedReducer<LessonsState, AddLesson>(addLesson),
  new TypedReducer<LessonsState, AddManyLessons>(addManyLessons),
  new TypedReducer<LessonsState, RemoveLesson>(removeLesson),
  new TypedReducer<LessonsState, ChangeLessonError>(changeLessonError),
  new TypedReducer<LessonsState, ChangeIsLoadingLessons>(
      changeIsLoadingLessons),
]);
