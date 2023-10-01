import 'package:amiadporat/models/user/user.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/constants.dart';
import '../../../models/lesson_block.dart';
import '../../../models/subjects.dart';
import '../../../providers/auth_provider.dart';
import '../../../utils/date_ext.dart';
import '../../../utils/db.dart';

class AddLessonBlock extends StatefulWidget {
  AddLessonBlock(
      {Key? key,
      required this.onDeletePressed,
      required this.lesson,
      required this.validateForm,
      required this.lessons})
      : super(key: key);

  final void Function() onDeletePressed;
  final void Function() validateForm;
  final List<LessonBlock> lessons;

  final LessonBlock lesson;

  @override
  _AddLessonBlockState createState() => _AddLessonBlockState();
}

class _AddLessonBlockState extends State<AddLessonBlock> {
  late AuthProvider authService;
  MyUser? currentUser;

  bool isPermanent = false;
  int selectedSubject = 0;
  String? selectedHour;
  DateTime? selectedDate;

  final Map<int, Widget> _subjects = {};
  Map<String, String> _dropdownItems = {};

  List<DateTime> dates = [];

  bool isLoadingDates = true;

  @override
  void initState() {
    authService = Provider.of<AuthProvider>(context, listen: false);
    initSubjects();

    super.initState();
    getDates();
  }

  initSubjects() async {
    if (authService.status == Status.Authenticated) {
      currentUser = await authService.user;

      if (currentUser!.getSubjects!.isNotEmpty) {
        if (currentUser!.getSubjects!.length == 1) {
          this.selectedSubject = currentUser!.getSubjects!.first!.index;
        } else {
          currentUser!.getSubjects!.forEach((subject) {
            _subjects.putIfAbsent(subject!.index,
                () => Text(SubjectsHelper().getHebrew(subject)));
          });
        }
      }
    }
  }

  getDates() async {
    setState(() {
      this.isLoadingDates = true;
    });

    if (authService.status == Status.Authenticated) {
      try {
        List<DateTime> lessonsDates = await DB.getLessonDates(authService.uid, [widget.lesson.selectedSubject]);

        widget.lessons
            .where((scheduledLesson) =>
                scheduledLesson.selectedSubject ==
                widget.lesson.selectedSubject)
            .forEach((scheduledLesson) {
          lessonsDates.removeWhere(
              (date) => date.isSameDate(scheduledLesson.selectedDate));
        });

        setState(() {
          this.dates = lessonsDates;
        });
      } on FirebaseException catch (error) {
        FirebaseCrashlytics.instance.recordError(error, error.stackTrace,
            reason: 'Exception while fetching lesson dates');

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content:
                Text('לא הצלחנו למצוא תגבורים. שווה לנסות שוב מאוחר יותר.')));
      }
    }

    setState(() {
      this.isLoadingDates = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 20),
      child: Column(
        children: [
          if (this.currentUser != null &&
              this.currentUser!.subjects!.length > 1)
            _buildSubjectSegmentedControl(),
          this.isLoadingDates
              ? Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: LinearProgressIndicator(),
                )
              : (!this.isLoadingDates && this.dates.isEmpty
                  ? Text("אין תאריכים זמינים לתגבור 😢 כדאי לדבר עם המשרד!")
                  : Padding(
                      padding: const EdgeInsets.only(top: 10, right: 25.0),
                      child: _getDropdowns(context),
                    )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                if (this.dates.isNotEmpty) _buildCheckbox(),
                Expanded(child: Container()),
                _buildDeleteButton(),
              ],
            ),
          ),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  CupertinoSlidingSegmentedControl<int> _buildSubjectSegmentedControl() {
    return CupertinoSlidingSegmentedControl<int>(
      thumbColor: neonBlue,
      groupValue: widget.lesson.selectedSubject.index,
      children: _subjects,
      onValueChanged: (int? index) {
        setState(() {
          widget.lesson.selectedSubject = Subjects.values[index!];
        });
        this._dropdownItems = {};
        widget.lesson.clean();
        this.getDates();
      },
    );
  }

  Padding _buildDeleteButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: IconButton(
        onPressed: () {
          widget.onDeletePressed();
          widget.validateForm();
        },
        icon: Icon(
          deleteIcon,
          color: Colors.red,
        ),
      ),
    );
  }

  Row _buildCheckbox() {
    return Row(
      children: [
        Text(
          "נתראה בזמן הזה כל שבוע?",
          textAlign: TextAlign.center,
        ),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Checkbox(
            value: widget.lesson.isPermanent,
            onChanged: (value) {
              setState(() {
                widget.lesson.isPermanent = value!;
              });
              widget.validateForm();
            },
            fillColor: MaterialStateProperty.all(neonBlue),
          ),
        ),
      ],
    );
  }

  Row _getDropdowns(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: _getDatePicker(
              widget.lesson.selectedDate != null
                  ? "${widget.lesson.selectedDate!.day}/${widget.lesson.selectedDate!.month}/${widget.lesson.selectedDate!.year}"
                  : "יום", () async {
            final DateTime? picked = await showDatePicker(
                context: context,
                initialDate:
                    this.dates.isNotEmpty ? this.dates[0] : DateTime.now(),
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(
                  Duration(
                      days: DateTime.now().weekday < DateTime.thursday
                          ? DateTime.thursday - DateTime.now().weekday + 7
                          : DateTime.thursday + 7),
                ),
                selectableDayPredicate: (DateTime val) {
                  bool hasDate = false;
                  this.dates.forEach((element) {
                    if (element.isSameDate(val)) {
                      hasDate = true;
                    }
                  });

                  return hasDate;
                });

            if (picked != null) {
              setState(() {
                widget.lesson.selectedDate = picked;
                widget.lesson.selectedDay = new DateTime(
                    picked.year,
                    picked.month,
                    picked.day,
                    widget.lesson.selectedDay != null
                        ? widget.lesson.selectedDay!.hour
                        : 0,
                    widget.lesson.selectedDay != null
                        ? widget.lesson.selectedDay!.minute
                        : 0);

                this._dropdownItems = {};
                this
                    .dates
                    .where((date) => date.isSameDate(picked))
                    .forEach((date) {
                  this._dropdownItems[
                          "${date.hour}:${date.minute.toString().padLeft(2, '0')}"] =
                      "${date.hour}:${date.minute.toString().padLeft(2, '0')}";
                });
              });

              widget.validateForm();
            }
          }),
        ),
        Container(
          child: DropdownButtonHideUnderline(
            child: ButtonTheme(
              alignedDropdown: true,
              child: DropdownButton<String>(
                hint: Text(
                  "שעה",
                  style: TextStyle(color: Colors.black),
                ),
                value: widget.lesson.selectedHour,
                items: _getMenuItems(),
                icon: Padding(
                  padding: const EdgeInsets.only(left: 12),
                  child: Icon(Icons.keyboard_arrow_down),
                ),
                onChanged: this._dropdownItems.length > 0
                    ? (String? value) {
                        setState(() {
                          widget.lesson.selectedHour = value!;
                          widget.lesson.selectedDay = new DateTime(
                              widget.lesson.selectedDay!.year,
                              widget.lesson.selectedDay!.month,
                              widget.lesson.selectedDay!.day,
                              int.parse(value.split(":")[0]),
                              int.parse(value.split(":")[1]));
                        });

                        widget.validateForm();
                      }
                    : null,
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: neonBlue.withOpacity(0.5), width: 2)),
          height: 40,
          width: 170,
        ),
      ],
    );
  }

  OutlinedButton _getDatePicker(String text, void Function() onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
              child: Text(
            text,
            style: TextStyle(fontSize: 15),
          )),
          Icon(weeklyScheduleIcon)
        ],
      ),
      style: ButtonStyle(
          fixedSize: MaterialStateProperty.all(Size(150, 40)),
          foregroundColor: MaterialStateProperty.all(Colors.black),
          side: MaterialStateProperty.all(
              BorderSide(color: neonBlue.withOpacity(0.5), width: 2)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)))),
    );
  }

  List<DropdownMenuItem<String>> _getMenuItems() {
    List<DropdownMenuItem<String>> items = [];
    this._dropdownItems.forEach((key, value) {
      items.add(DropdownMenuItem(child: Text(value), value: key));
    });

    return items.isNotEmpty
        ? items
        : [DropdownMenuItem(child: Text("אין שעות פנויות"))];
  }
}
