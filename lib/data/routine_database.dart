import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter/material.dart';

//reference our box
final _myBox = Hive.box('Routine_Database');

class RoutineDatabase{

//[routineName,routineColor,routineCompleted,selectedTime]
List<List<dynamic>> routineList =[];

//create initial default data
void createDefaultData(){
  //[routineName,routineColor,routineCompleted,selectedTime]
  routineList = [
    ['Run',Colors.grey.shade700,false,null],
    ['Read',Colors.grey.shade700,false,null],
  ];
}

//update routine list 
void updateDatabase(){
_myBox.put('CURRENT_ROUTINE_LIST', routineList);
}

//load data if it already exist
void loadData(){
  routineList = _myBox.get('CURRENT_ROUTINE_LIST');

}

}