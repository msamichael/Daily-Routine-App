import 'package:hive_flutter/hive_flutter.dart';

import 'package:flutter/material.dart';

final _myBox = Hive.box('Routine_Database');

class RoutineDatabase{

List<List<dynamic>> routineList =[
               //['Wake Up',Color.fromARGB(255, 51, 53, 52)],
];

//create initial default data
void createDefaultData(){
  routineList = [
    ['Run',Colors.grey.shade600,false,null],
    ['Read',Colors.grey.shade600,false,null],
  ];
}

//update routine list 
void updateDatabase(){
_myBox.put('CURRENT_ROUTINE_LIST', routineList);
}


void loadData(){
  routineList = _myBox.get('CURRENT_ROUTINE_LIST');

}

}