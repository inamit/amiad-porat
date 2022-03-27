import 'absEnumHelper.dart';

enum Subjects { Math, English }

class SubjectsHelper extends AbsEnumHelper<Subjects, String> {
  @override
  Subjects? getEnum(String value) {
    switch (value) {
      case 'math':
        return Subjects.Math;
      case 'english':
        return Subjects.English;
      default:
        return null;
    }
  }

  @override
  String getHebrew(Subjects enumValue) {
    switch (enumValue) {
      case Subjects.Math:
        return 'מתמטיקה';
      case Subjects.English:
        return 'אנגלית';
    }
  }

  @override
  String getValue(Subjects enumValue) {
    switch (enumValue) {
      case Subjects.Math:
        return 'math';
      case Subjects.English:
        return 'english';
    }
  }
}
