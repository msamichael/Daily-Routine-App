// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:simple_daily_routine/widgets/my_alert_box.dart';
import 'package:simple_daily_routine/widgets/my_fab.dart';
import 'package:simple_daily_routine/widgets/routine_card.dart';
import 'package:simple_daily_routine/widgets/color_selection_row.dart';
import 'package:simple_daily_routine/data/routine_database.dart';
import 'package:hive_flutter/hive_flutter.dart';



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
  String? selectedTime;

  RoutineDatabase db = RoutineDatabase();
  final _myBox = Hive.box('Routine_Database');

  @override
  void initState(){
    //if there is no current routine List, then it is the 1st time ever opening the app
    //then create default data
    if (_myBox.get('CURRENT_ROUTINE_LIST') == null){
      db.createDefaultData();
    }

    //there already exists data, this is not the first time
    else{
      db.loadData();
    }

    //update the database
    db.updateDatabase();

    super.initState();


  }
 

 //validation for checkbox state
  void checkBoxTapped(bool? value, int index){
    setState(() {

      db.routineList[index][2]= value;
    });
   // db.updateDatabase();

  }



    
// display time picker
  Future<void> displayTimeDialog() async {
    final TimeOfDay? time =
        await showTimePicker(
          context: context, 
          initialTime: TimeOfDay.now(),
          cancelText: 'CANCEL'
          );
    if (time != null) {
      setState(() {
        selectedTime = time.format(context);
        //selectedScheduleTime= time.
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
     
        db.routineList.add([_newRoutineNameController.text, colour,false,selectedTime]);
      
      
    });
    }
      //Revert back to default RoutineCard colour
     colour = Colors.grey.shade600;
     //Revert time to null
     selectedTime = null;


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
     selectedTime = null;


    //clear textfield
    _newRoutineNameController.clear();
    // pop dialog box
    Navigator.of(context).pop();
  }

//delete routine
  void deleteRoutine(int index) {
    setState(() {
      db.routineList.removeAt(index);
    });
  }


  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.4,
        title: const Text(
          'Routine ',
          style: TextStyle(
            fontSize: 28, 
            color: Colors.black,
            fontFamily: 'Lato',
            fontWeight: FontWeight.bold),
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
                final item = db.routineList.removeAt(oldIndex);
                
                db.routineList.insert(newIndex, item);
              });},
              itemCount: db.routineList.length,
              itemBuilder: (context, index) {
                return RoutineCard(
                  key: ValueKey(index),
                  routineName: db.routineList[index][0],
                  deleteOnpressed: () => deleteRoutine(index),
                  routineCompleted: db.routineList[index][2],
                  routineOnChanged: (routineValue)=>checkBoxTapped(routineValue,index),
                  selectedTime: db.routineList[index][3],
                  
                 
                  onDropdownMenuPressed: (value) {
                    setState(() {
                      dropdownValue = value;
                    });
                  },
                  
                  routineColour: db.routineList[index][1],
                );
              })),
    );
  }
}




