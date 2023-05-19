// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ButtonRowOptions extends StatelessWidget {
  final Function()? cancelButtonPressed;
  final Function()? saveButtonPressed;
  final String? saveText;

  const ButtonRowOptions(
      {super.key,
      this.saveButtonPressed,
      this.cancelButtonPressed,
      this.saveText = 'Save'});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        //Cancel Button
        TextButton(
          // style: ButtonStyle(
          //   backgroundColor: MaterialStateProperty.all(
          //       Color.fromARGB(119, 158, 158, 158)),
          // ),
          onPressed: cancelButtonPressed,//change to onCancel
          child: Text(
            'Cancel',
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(
          width: 8,
        ),
        // (Save , Add to Saved, Add to Routine) Button
        TextButton(
          onPressed: saveButtonPressed,// change to onSave
          child: Text(
            saveText!,
            style: TextStyle(color: Colors.black),
          ),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }
}
