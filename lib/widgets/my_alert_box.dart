// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:simple_daily_routine/widgets/time_picker.dart';

import 'color_selection_row.dart';

class MyAlertBox extends StatelessWidget {
  final TextEditingController? controller;
  final String headingText;
  final String hintText;
  final VoidCallback onSave;
  final VoidCallback onCancel;
  final Widget colorSelectionRow;
  final Function()? timePressed;

  MyAlertBox({
    super.key,
    required this.controller,
    required this.headingText,
    required this.hintText,
    required this.onSave,
    required this.onCancel,
    required this.colorSelectionRow,
    required this.timePressed
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(headingText),
      backgroundColor: Colors.white,
      content: TextField(
        maxLength: 40,
        cursorColor: Colors.black,
        // style: TextStyle(color: Colors.white),
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Colors.grey[600]),
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 1.0),
              borderRadius:
                  BorderRadius.all(Radius.circular(20.0))), //was 25.0 before
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.black, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(20.0))),
        ),
      ),
      actions: [
        Column(
          children: [
           


            //Color Selection Row
            Padding(
              padding:
                  const EdgeInsets.only(top:8.0,bottom: 8.0, left: 8.0, right: 8.0),
              child: colorSelectionRow,
            ),
             //Time Picker
            


            //Row
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
              padding: const EdgeInsets.only(right:9.0),
              child: TimePickerWidget(
                timePressed: timePressed,
                ),
            ),Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    //Cancel Button
                    MaterialButton(
                      onPressed: onCancel,
                      color: Color.fromARGB(255, 51, 53, 52),
                      child: Text(
                        'Cancel',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    //Save Button
                    MaterialButton(
                      onPressed: onSave,
                      color: Color.fromARGB(255, 51, 53, 52),
                      child: Text(
                        'Save',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

