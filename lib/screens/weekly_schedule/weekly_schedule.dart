import 'package:amiadporat/store/state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:table_calendar/table_calendar.dart';

import '../../models/constants.dart';
import '../../models/lesson/absLesson.dart';
import '../../utils/date_ext.dart';
import '../components/lessonTile.dart';
import '../components/mainPage.dart';

class WeeklySchedule extends StatefulWidget {
  const WeeklySchedule({Key? key}) : super(key: key);

  @override
  _WeeklyScheduleState createState() => _WeeklyScheduleState();
}

class _WeeklyScheduleState extends MainPageState<WeeklySchedule> {
  DateTime _selectedDay = DateTime.now();

  @override
  refreshData() {}

  @override
  Widget build(BuildContext context) {
    DateTime now = DateTime.now();
    var calendarHeader = HeaderStyle(
      formatButtonVisible: false,
      titleCentered: true,
      leftChevronVisible: false,
      rightChevronVisible: false,
      headerPadding: EdgeInsets.all(18.0),
    );

    return StoreConnector(
      distinct: true,
      converter: (Store<AppState> store) {
        return [
          ...store.state.lessonsState.lessons.values,
          ...store.state.groupsState.groups.values
        ];
      },
      builder: (BuildContext context, List<AbsLesson> values) {
        return Column(
          children: [
            TableCalendar(
              locale: "he_IL",
              weekendDays: [DateTime.friday, DateTime.saturday],
              startingDayOfWeek: StartingDayOfWeek.sunday,
              headerStyle: calendarHeader,
              focusedDay: _selectedDay,
              firstDay: now,
              lastDay: _getEndOfWeek(),
              calendarFormat: CalendarFormat.week,
              selectedDayPredicate: (day) {
                return isSameDay(_selectedDay, day);
              },
              onDaySelected: _onDaySelected,
            ),
            getLessonsList(<AbsLesson>[
              ...values
                  .where((element) => element.date.isSameDate(_selectedDay))
                  .toList()
            ]),
          ],
        );
      },
    );
  }

  void _onDaySelected(selectedDay, focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
    });
  }

  DateTime _getEndOfWeek() {
    return DateTime.now().add(Duration(days: 13));
  }

  Widget getLessonsList(List<AbsLesson> lessons) => lessons.isEmpty
      ? _noLessons()
      : _lessonsList([red, orange, neonBlue], lessons);

  Expanded _lessonsList(List<Color> backgrounds, List<AbsLesson> lessons) {
    return Expanded(
      child: ListView.builder(
          itemCount: lessons.length,
          itemBuilder: (context, index) {
            return LessonTile(
              lesson: lessons[index],
              title: lessons[index].title,
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
