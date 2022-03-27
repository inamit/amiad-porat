import '../../absEnumHelper.dart';

enum StudentStatus { SCHEDULED, CANCELED, MISSED, ARRIVED }

class StudentStatusHelper implements AbsEnumHelper<StudentStatus, String> {
  static final StudentStatusHelper _helper = StudentStatusHelper._internal();

  factory StudentStatusHelper() {
    return _helper;
  }

  StudentStatusHelper._internal();

  StudentStatus? getEnum(String status) {
    switch (status) {
      case 'Scheduled':
        return StudentStatus.SCHEDULED;
      case 'Canceled':
        return StudentStatus.CANCELED;
      case 'Missed':
        return StudentStatus.MISSED;
      case 'Arrived':
        return StudentStatus.ARRIVED;
      default:
        return null;
    }
  }

  String getValue(StudentStatus status) {
    switch (status) {
      case StudentStatus.SCHEDULED:
        return 'Scheduled';
      case StudentStatus.CANCELED:
        return 'Canceled';
      case StudentStatus.MISSED:
        return 'Missed';
      case StudentStatus.ARRIVED:
        return 'Arrived';
    }
  }

  String getHebrew(StudentStatus status) {
    switch (status) {
      case StudentStatus.SCHEDULED:
        return "קבע";
      case StudentStatus.CANCELED:
        return "ביטל";
      case StudentStatus.MISSED:
        return "פספס";
      case StudentStatus.ARRIVED:
        return "הגיע";
    }
  }
}
