import '../absEnumHelper.dart';

enum UserRole { STUDENT, TUTOR, TEACHER, ADMIN }

class UserRoleHelper implements AbsEnumHelper<UserRole, int> {
  static final UserRoleHelper _helper = UserRoleHelper._internal();

  factory UserRoleHelper() {
    return _helper;
  }

  UserRoleHelper._internal();

  UserRole? getEnum(int role) {
    switch (role) {
      case 1:
        return UserRole.STUDENT;
      case 2:
        return UserRole.TUTOR;
      case 3:
        return UserRole.TEACHER;
      case 4:
        return UserRole.ADMIN;
      default:
        return null;
    }
  }

  int getValue(UserRole role) {
    switch (role) {
      case UserRole.STUDENT:
        return 1;
      case UserRole.TUTOR:
        return 2;
      case UserRole.TEACHER:
        return 3;
      case UserRole.ADMIN:
        return 4;
    }
  }

  String getHebrew(UserRole role) {
    switch (role) {
      case UserRole.STUDENT:
        return "תלמיד";
      case UserRole.TUTOR:
        return "מתרגל";
      case UserRole.TEACHER:
        return "מורה";
      case UserRole.ADMIN:
        return "מנהל";
    }
  }
}
