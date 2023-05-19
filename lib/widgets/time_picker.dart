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



// class TimePickerWidget extends StatefulWidget {
//   @override
//   _TimePickerWidgetState createState() => _TimePickerWidgetState();
// }

// class _TimePickerWidgetState extends State<TimePickerWidget> {
//    TimeOfDay? _selectedTime;

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//         child: ElevatedButton(
//           child: Text('Select Time'),
//           onPressed: () {
            // showTimePicker(
            //   context: context,
            //   initialTime: TimeOfDay.now(),
            //   onTimeChanged: (time) {
            //     setState(() {
            //       _selectedTime = time;
            //     });
//               },
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
