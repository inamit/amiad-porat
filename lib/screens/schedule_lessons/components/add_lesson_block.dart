import '../../../models/subjects.dart';

import '../../../models/lesson_block.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants.dart';

class AddLessonBlock extends StatefulWidget {
  AddLessonBlock(
      {Key? key,
      required this.onDeletePressed,
      required this.lesson,
      required this.validateForm})
      : super(key: key);

  final void Function() onDeletePressed;
  final void Function() validateForm;

  LessonBlock lesson;

  @override
  _AddLessonBlockState createState() => _AddLessonBlockState();
}

class _AddLessonBlockState extends State<AddLessonBlock> {
  bool isPermanent = false;
  int selectedSubject = 0;
  String? selectedHour;
  DateTime? selectedDate;

  final Map<int, Widget> _subjects = {
    Subjects.Math.index: Text("מתמטיקה"),
    Subjects.English.index: Text("אנגלית")
  };
  final Map<String, String> _dropdownItems = {
    "14:00": "14:00",
    "15:00": "15:00",
    "16:00": "16:00",
    "18:00": "18:00"
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 20),
      child: Column(
        children: [
          _buildSubjectSegmentedControl(),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 25.0),
            child: _getDropdowns(context),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                _buildCheckbox(),
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
              initialDate: widget.lesson.selectedDate ?? DateTime.now(),
              firstDate: DateTime.now(),
              lastDate: DateTime.now().add(Duration(
                  days: DateTime.now().weekday < DateTime.thursday
                      ? DateTime.thursday - DateTime.now().weekday
                      : DateTime.thursday)),
            );
            setState(() {
              widget.lesson.selectedDate = picked ?? widget.lesson.selectedDate;
              widget.lesson.selectedDay = new DateTime(
                  picked!.year,
                  picked.month,
                  picked.day,
                  widget.lesson.selectedDay != null
                      ? widget.lesson.selectedDay!.hour
                      : 0,
                  widget.lesson.selectedDay != null
                      ? widget.lesson.selectedDay!.minute
                      : 0);
            });

            widget.validateForm();
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
                onChanged: (String? value) {
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
                },
              ),
            ),
          ),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              border: Border.all(color: neonBlue.withOpacity(0.5), width: 2)),
          height: 40,
          width: 150,
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

    return items;
  }
}
