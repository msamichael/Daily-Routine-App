import 'package:flutter/material.dart';
import 'package:simple_daily_routine/constants.dart';


class RoutineCard extends StatelessWidget {

  final String? routineName;
  final Function(String?)? onDropdownMenuPressed;
  final Function()? deleteOnpressed;
  final bool routineCompleted;
  final Function(bool?)? routineOnChanged;
  final String? dropdownValue;
  String? selectedTime;
  Color? colour;

  RoutineCard({
    super.key,
    required this.routineName,
    required this.onDropdownMenuPressed,
    required this.deleteOnpressed,
    required this.routineOnChanged,
    required this.routineCompleted,
     this.dropdownValue,
    required this.selectedTime,
    required this.colour ,

  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Card(
        color: colour,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
          child: ListTile(
            leading: Checkbox(
              activeColor: kgreyBlack,
              checkColor: Colors.white,
              value: routineCompleted,
              onChanged: routineOnChanged,
              ),
               subtitle: Text( selectedTime ?? '',
               style: TextStyle(color:kgreyBlack,
               fontWeight: FontWeight.bold,
               fontSize:13.0,
               ),
               
               ),
            title: Text(routineName!,
              style: const TextStyle(fontSize: 21, color: Colors.white),
            ),
            trailing: DropdownButton(
              underline:Container(
                width: 0,
              
              ) ,
              value: dropdownValue,
              onChanged: onDropdownMenuPressed,
              icon: const Icon (
                Icons.more_vert,
                color: Colors.white,
              ),
              items: [
                
                DropdownMenuItem(
                  value: 'Delete',
                  child: Text('Delete'),
                  onTap: deleteOnpressed,
                ),
              ],
            ),
            style: ListTileStyle.list,
          ),
        ),
      ),
    );
  }
}


