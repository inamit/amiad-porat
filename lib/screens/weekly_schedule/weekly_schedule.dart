import '../../constants.dart';
import '../../data/lessons.dart';
import '../../models/lesson_block.dart';
import '../home/components/homepage_card.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../utils/date_ext.dart';

class WeeklySchedule extends StatefulWidget {
  const WeeklySchedule({Key? key}) : super(key: key);

  @override
  _WeeklyScheduleState createState() => _WeeklyScheduleState();
}

class _WeeklyScheduleState extends State<WeeklySchedule> {
  DateTime _selectedDay = DateTime.now();
  List<LessonBlock> _selectedDayLessons = lessonsData
      .where((element) => element.selectedDay!.isSameDate(DateTime.now()))
      .toList();

  @override
  void initState() {
    _selectedDayLessons.sort((first, second) =>
        first.selectedDay!.difference(second.selectedDay!).inMinutes);
    super.initState();
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

    return Column(
      children: [
        TableCalendar(
          locale: "he_IL",
          weekendDays: [DateTime.friday, DateTime.saturday],
          startingDayOfWeek: StartingDayOfWeek.sunday,
          headerStyle: calendarHeader,
          focusedDay: now,
          firstDay: now.subtract(Duration(days: now.weekday)),
          lastDay: _getEndOfWeek(),
          calendarFormat: CalendarFormat.week,
          selectedDayPredicate: (day) {
            return isSameDay(_selectedDay, day);
          },
          onDaySelected: _onDaySelected,
        ),
        _selectedDayLessons.isEmpty ? _noLessons() : _lessonsList(backgrounds),
      ],
    );
  }

  void _onDaySelected(selectedDay, focusedDay) {
    setState(() {
      _selectedDay = selectedDay;
      _selectedDayLessons = lessonsData
          .where((element) => element.selectedDay!.isSameDate(_selectedDay))
          .toList();
      _selectedDayLessons.sort((first, second) =>
          first.selectedDay!.difference(second.selectedDay!).inMinutes);
    });
  }

  DateTime _getEndOfWeek() {
    return DateTime.now().add(Duration(
        days: DateTime.now().weekday < DateTime.thursday
            ? DateTime.thursday - DateTime.now().weekday
            : DateTime.thursday));
  }

  Expanded _lessonsList(List<Color> backgrounds) {
    return Expanded(
      child: ListView.builder(
          itemCount: _selectedDayLessons.length,
          itemBuilder: (context, index) {
            return HomepageCard(
                color: backgrounds[index % backgrounds.length],
                content: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: _lessonDetails(
                    _selectedDayLessons[index].selectedSubject,
                    _selectedDayLessons[index].selectedDay!,
                  ),
                ));
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

  Row _lessonDetails(int selectedSubject, DateTime hour) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 10.0),
          child: Icon(
            selectedSubject == 0 ? mathIcon : englishIcon,
            size: 64,
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${hour.hour}:${hour.minute.toString().padLeft(2, '0')}-${hour.hour + 1}:${hour.minute.toString().padLeft(2, '0')}",
              style: TextStyle(fontSize: 18),
            )
          ],
        )
      ],
    );
  }
}
