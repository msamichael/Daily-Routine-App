// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:simple_daily_routine/widgets/my_alert_box.dart';
import 'package:simple_daily_routine/widgets/my_fab.dart';
import 'package:simple_daily_routine/widgets/routine_card.dart';
import 'package:simple_daily_routine/models/routine_list.dart';
import 'package:simple_daily_routine/widgets/color_selection_row.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String? routineName;
  Color? colour = Colors.grey.shade700;
  String? dropdownValue;
  bool? routineValue;
  String? _selectedTime;

  void checkBoxTapped(bool? value, int index){
    setState(() {

      routineList[index][2]= value;
    });
   // db.updateDatabase();

  }


  Future<void> displayTimeDialog() async {
    final TimeOfDay? time =
        await showTimePicker(
          context: context, 
          initialTime: TimeOfDay.now(),
          cancelText: 'CANCEL'
          );
    if (time != null) {
      setState(() {
        _selectedTime = time.format(context);
      });
    }
  }


  final _newRoutineNameController = TextEditingController();

  //create a new routine
  void createNewRoutine() {
    //show alert dialog for user to enter the new habit details
    showDialog(
        context: context,
        builder: (context) {
          return MyAlertBox(
            controller: _newRoutineNameController,
            headingText: 'Add Routine',
            hintText: 'Enter Routine Name..',
            onSave: saveNewRoutine,
            onCancel: cancelDialogRoutine,
            timePressed: displayTimeDialog,
            colorSelectionRow: ColorSelectionRow(
              greyButtonPressed: () {
                colour = Colors.grey.shade600;
              },
              blueButtonPressed: () {
                colour = Colors.blue.shade500;
              },
              greenButtonPressed: () {
                colour = Colors.green.shade500;
              },
              
              purpleButtonPressed: () {
                colour = Colors.purple.shade500;
              },
              redButtonPressed: () {
                colour = Colors.red.shade500;
              },
            ),
          );
        });
  }

//save new routine
  void saveNewRoutine() {
    //add new routine to todays routine list
    if (_newRoutineNameController.text.isNotEmpty){
    setState(() {
     
        routineList.add([_newRoutineNameController.text, colour,false,_selectedTime]);
      
      
    });
    }
      //Revert back to default RoutineCard colour
     colour = Colors.grey.shade600;
     //Revert time to null
     _selectedTime = null;


    //clear textfield
    _newRoutineNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();

    // db.updateDatabase();
  }

  //cancel new routine
  void cancelDialogRoutine() {
    //Revert back to default RoutineCard colour
     colour = Colors.grey.shade600;
     //Revert time to null
     _selectedTime = null;


    //clear textfield
    _newRoutineNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();
  }

//delete routine
  void deleteRoutine(int index) {
    setState(() {
      routineList.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.grey[200],
        elevation: 0.7,
        title: const Text(
          'Routine ',
          style: TextStyle(fontSize: 28, color: Colors.black),
        ),
        centerTitle: true,
      ),
      floatingActionButton: MyFloatingActionButton(
        onPressed: createNewRoutine,
      ),

      //The List View
      body: Padding(
          padding:
              const EdgeInsets.only(top: 20.0, left: 13, right: 13, bottom: 60),

          // Lists of Routine Tasks
          child: ReorderableListView.builder(
            onReorder: ( oldIndex, newIndex) {
              setState(() {
                if (oldIndex < newIndex) {
                  newIndex -= 1;
                   
                }
                final item = routineList.removeAt(oldIndex);
                
                routineList.insert(newIndex, item);
              });},
              itemCount: routineList.length,
              itemBuilder: (context, index) {
                return RoutineCard(
                  key: ValueKey(index),
                  routineName: routineList[index][0],
                  deleteOnpressed: () => deleteRoutine(index),
                  routineCompleted: routineList[index][2],
                  routineOnChanged: (routineValue)=>checkBoxTapped(routineValue,index),
                  selectedTime: routineList[index][3],
                  
                 // dropdownValue: dropdownValue,
                  onDropdownMenuPressed: (value) {
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                  
                  colour: routineList[index][1],
                );
              })),
    );
  }
}




// ListView.builder(
//               itemCount: routineList.length,
//               itemBuilder: (context, index) {
//                 return RoutineCard(
//                   routineName: routineList[index][0],
//                   deleteOnpressed: () => deleteRoutine(index),
//                   editOnpressed: ()=> editRoutine(index),
//                   dropdownValue: dropdownValue,
//                   onDropdownMenuPressed: (value) {
//                     setState(() {
//                       dropdownValue = value;
//                     });
//                   },
                  
//                   colour: routineList[index][1],
//                 );
//               })),
