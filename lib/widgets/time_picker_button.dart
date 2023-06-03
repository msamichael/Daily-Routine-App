import 'package:flutter/material.dart';

const double padding = 10.0;

class TimePickerWidget extends StatelessWidget {
  
  final Function()? timePressed;

  const TimePickerWidget({
    super.key,
    required this.timePressed, 
    });

  

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color:  Color.fromARGB(255, 51, 53, 52),
      onPressed: timePressed,
      child: const Text('Select Time', style: TextStyle(color: Colors.white),),
    );
  }
}


