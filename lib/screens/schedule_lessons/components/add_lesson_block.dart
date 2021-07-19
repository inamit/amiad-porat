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

  final Map<int, Widget> _subjects = {0: Text("מתמטיקה"), 1: Text("אנגלית")};
  final Map<String, String> _dropdownItems = {
    "1": "14:00",
    "2": "15:00",
    "3": "16:00",
    "4": "18:00"
  };

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 20),
      child: Column(
        children: [
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
          _buildSubjectSegmentedControl(),
          Padding(
            padding: const EdgeInsets.only(top: 10, right: 25.0),
            child: _getDropdowns(context),
          ),
          Divider(thickness: 2),
        ],
      ),
    );
  }

  CupertinoSlidingSegmentedControl<int> _buildSubjectSegmentedControl() {
    return CupertinoSlidingSegmentedControl<int>(
      thumbColor: neonBlue,
      groupValue: widget.lesson.selectedSubject,
      children: _subjects,
      onValueChanged: (int? index) {
        setState(() {
          widget.lesson.selectedSubject = index!;
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
          Icons.delete,
          color: Colors.red,
        ),
      ),
    );
  }

  Row _buildCheckbox() {
    return Row(
      children: [
        Text(
          "נתראה בזמן \n הזה כל שבוע?",
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
          child: _getDropdown(
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

  OutlinedButton _getDropdown(String text, void Function() onPressed) {
    return OutlinedButton(
      onPressed: onPressed,
      child: Row(
        children: [
          Expanded(
              child: Text(
            text,
            style: TextStyle(fontSize: 15),
          )),
          Icon(Icons.keyboard_arrow_down)
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
