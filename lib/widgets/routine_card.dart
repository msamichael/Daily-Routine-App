import 'package:flutter/material.dart';
import 'package:simple_daily_routine/constants.dart';



class RoutineCard extends StatelessWidget {

  final String? routineName;
  final Function(String?)? onDropdownMenuPressed;
  final Function()? deleteOnpressed;
  final bool routineCompleted;
  final Function(bool?)? routineOnChanged;
  final String? dropdownValue; 
  final String? selectedTime;
  final Color? routineColour;


  const RoutineCard({
    super.key,
    required this.routineName,
    required this.onDropdownMenuPressed,
    required this.deleteOnpressed,
    required this.routineOnChanged,
    required this.routineCompleted,
    this.dropdownValue,   
    required this.selectedTime,
    required this.routineColour ,
    

  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1.0),
      child: Card(
        color: routineColour,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
          child: ListTile(
            leading: Checkbox(
              activeColor: kgreyBlack,
              checkColor: Colors.white,
              value: routineCompleted,
              onChanged: routineOnChanged,
              ),
            title: Text(routineName!,
              style: const TextStyle(
                fontFamily:'Lato',
                fontSize: 21, 
                color: Colors.white,
                fontWeight: FontWeight.bold
                ),
            ),
            
              subtitle: Text( selectedTime ?? '',
               style: const TextStyle(color:kgreyBlack,
               fontWeight: FontWeight.bold,
               fontSize:13.0,
               ),
               
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
                  onTap: deleteOnpressed,
                  child: const Text('Delete'),
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


