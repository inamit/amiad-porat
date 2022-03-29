import 'lesson/tutorLesson/lesson.dart';
import 'subjects.dart';

class LessonBlock {
  bool _isPermanent = false;
  Subjects _selectedSubject = Subjects.Math;
  String? _selectedHour;
  DateTime? _selectedDate;
  DateTime? _selectedDay;

  LessonBlock();
  factory LessonBlock.fromLesson(Lesson lesson) {
    LessonBlock block = new LessonBlock();
    block._selectedSubject = SubjectsHelper().getEnum(lesson.subject)!;
    block._selectedHour = "${lesson.date.hour}:${lesson.date.minute}";

    return block;
  }

  clean() {
    this._selectedHour = null;
    this._selectedDay = null;
    this._selectedDate = null;
  }

  bool get isPermanent => this._isPermanent;
  Subjects get selectedSubject => this._selectedSubject;
  DateTime? get selectedDay => this._selectedDay;
  String? get selectedHour => this._selectedHour;
  DateTime? get selectedDate =>
      this._selectedDate != null && this._selectedHour != null
          ? new DateTime(
              this._selectedDate!.year,
              this._selectedDate!.month,
              this._selectedDate!.day,
              int.parse(this.selectedHour!.split(":")[0]),
              int.parse(this.selectedHour!.split(":")[1]))
          : this._selectedDate;

  bool isValid() => this.selectedDate != null && this._selectedHour != null;

  set isPermanent(value) => this._isPermanent = value;
  set selectedSubject(value) => this._selectedSubject = value;
  set selectedHour(value) => this._selectedHour = value;
  set selectedDate(value) => this._selectedDate = value;
  set selectedDay(DateTime? value) => this._selectedDay = value;

  @override
  String toString() {
    return """IsPermanent: ${this.isPermanent}
SelectedSubject: ${this.selectedSubject}
SelectedHour: ${this.selectedHour}
SelectedDate: ${this.selectedDate}
--------------------------------------------------------""";
  }
}
