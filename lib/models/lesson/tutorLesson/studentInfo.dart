import 'package:json_annotation/json_annotation.dart';

import 'studentStatus.dart';

part 'studentInfo.g.dart';

@JsonSerializable()
class StudentInfo {
  final String student;
  final String status;

  StudentStatus? get getStatus => StudentStatusHelper().getEnum(this.status);

  StudentInfo({required this.student, required this.status});

  factory StudentInfo.fromJson(Map<String, dynamic> json) =>
      _$StudentInfoFromJson(json);

  Map<String, dynamic> toJson() => _$StudentInfoToJson(this);
}
