import 'package:amiadporat/dal/group.dal.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../dal/lesson.dal.dart';
import '../../models/constants.dart';
import '../../models/lesson/absLesson.dart';
import '../../models/lesson/groupLesson/groupLesson.dart';
import '../../models/lesson/tutorLesson/lesson.dart';
import '../../models/lesson/tutorLesson/studentStatus.dart';
import '../../models/user/user.dart';
import '../../providers/auth_provider.dart';
import '../../utils/date_ext.dart';
import '../components/lessonTile.dart';
import '../components/mainPage.dart';

class WeeklySchedule extends StatefulWidget {
  const WeeklySchedule({Key? key}) : super(key: key);

  @override
  _WeeklyScheduleState createState() => _WeeklyScheduleState();
}

class _WeeklyScheduleState extends MainPageState<WeeklySchedule> {
  late AuthProvider authService;
  List<AbsLesson> lessonsData = [];
  DateTime _selectedDay = DateTime.now();
  late List<AbsLesson> _selectedDayLessons;
  List<GroupLesson?> myGroups = [];

  @override
  void initState() {
    authService = Provider.of<AuthProvider>(context, listen: false);
    super.initState();
  }

  @override
  refreshData() {
    getMyLessons();
    getGroupLesson();
    this._selectedDayLessons = <AbsLesson>[
      ...lessonsData
          .where((element) => element.date.isSameDate(DateTime.now()))
          .toList()
    ];
    _selectedDayLessons
        .sort((first, second) => first.date.difference(second.date).inMinutes);
  }

  void getMyLessons() async {
    if (authService.status == Status.Authenticated) {
      Map<String, String> studentInfo = Map();
      studentInfo.putIfAbsent('student', () => authService.uid!);
      studentInfo.putIfAbsent('status',
          () => StudentStatusHelper().getValue(StudentStatus.SCHEDULED));

      LessonQuerySnapshot snapshot =
          await lessonsRef.whereStudents(arrayContainsAny: [studentInfo]).get();

      setState(() {
        this.lessonsData = snapshot.docs.map((e) => e.data).toList();
      });
    }
  }

  getGroupLesson() async {
    MyUser? user = await authService.user;

    if (user != null && user.group != null) {
      user.group!.forEach((element) async {
        GroupLesson? lesson = await GroupDal.getGroupLesson(element);
        myGroups.add(lesson);

        if (lesson != null && _selectedDay.weekday == lesson?.date.weekday) {
          _selectedDayLessons.add(lesson!);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    List<Color> backgrounds = [red, orange, neonBlue];
    var calendarHeader = HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      leftChevronVisible: false,
      rightChevronVisible: false,
      headerPadding: EdgeInsets.all(18.0),
    );

    return FirestoreBuilder(
        ref: LessonDal.getLessonByUser(authService.uid!),
        builder: (context, AsyncSnapshot<LessonQuerySnapshot> snapshot,
            Widget? child) {
          if (snapshot.hasError) {}
          if (!snapshot.hasData) {}

          return Column(
            children: [
              TableCalendar(
                locale: "he_IL",
                weekendDays: [DateTime.friday, DateTime.saturday],
                startingDayOfWeek: StartingDayOfWeek.sunday,
                headerStyle: calendarHeader,
                focusedDay: _selectedDay,
                firstDay: now.subtract(Duration(days: now.weekday)),
                lastDay: _getEndOfWeek(),
                calendarFormat: CalendarFormat.week,
                selectedDayPredicate: (day) {
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: _onDaySelected,
              ),
              _selectedDayLessons.isEmpty
                  ? _noLessons()
                  : _lessonsList(backgrounds),
            ],
          );
        });
  }

  void _onDaySelected(selectedDay, focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _selectedDayLessons = <AbsLesson>[
        ...lessonsData
            .where((element) => element.date.isSameDate(_selectedDay))
            .toList()
      ];

      myGroups.forEach((group) {
        if (group != null && _selectedDay.weekday == group?.date.weekday) {
          _selectedDayLessons.add(group!);
        }
      });

      _selectedDayLessons.sort(
          (first, second) => first.date.difference(second.date).inMinutes);
    });
  }

  DateTime _getEndOfWeek() {
    return DateTime.now().add(Duration(days: 7));
  }

  Expanded _lessonsList(List<Color> backgrounds) {
    return Expanded(
      child: ListView.builder(
          itemCount: _selectedDayLessons.length,
          itemBuilder: (context, index) {
            return LessonTile(
              lesson: _selectedDayLessons[index],
              title: _selectedDayLessons[index].title,
            );
          }),
    );
  }

  Padding _noLessons() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        "אין לך תגבורים ביום הזה",
        style: TextStyle(fontSize: 20.0),
      ),
    );
  }
}
