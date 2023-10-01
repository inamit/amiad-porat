// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'studentInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StudentInfo _$StudentInfoFromJson(Map<String, dynamic> json) => StudentInfo(
      student: json['student'] as String,
      status: json['status'] as String,
    );

const _$StudentInfoFieldMap = <String, String>{
  'student': 'student',
  'status': 'status',
};

Map<String, dynamic> _$StudentInfoToJson(StudentInfo instance) =>
    <String, dynamic>{
      'student': instance.student,
      'status': instance.status,
    };
