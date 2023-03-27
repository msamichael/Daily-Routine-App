// ignore_for_file: prefer_const_constructors, curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:simple_daily_routine/widgets/routine_card.dart';
import '../models/routine_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String? newTaskTitle;
  int? index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //To determine the index of the current RoutineCard added for the key parameter
                for(int i = 0; i < routineList.length; i++){
                  index = i+1;
                }
                
           
          showDialog(
  context: context,
  builder: (BuildContext context) {
    return AlertDialog(
      title: Text('Add Routine'),
      content: TextField(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(32)),
            
          ),
          enabledBorder:  OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black,width: 1.0),
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
            
          ),
          focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: Colors.black, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
        ) ,
        onChanged: (newTask){
          newTaskTitle = newTask;
        },

      ),
      actions: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            TextButton(
              onPressed: () {
                
                Navigator.of(context).pop();
              },
              child: Text('Cancel'),
            ),
            
            TextButton(
              
              onPressed: () {
                setState(() {
                  
                 routineList.add(RoutineCard(newTaskTitle:newTaskTitle,key: ValueKey('$index'),));
                
                });
                print(routineList);
                Navigator.of(context).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ],
    );
  },
);

        },
        backgroundColor: const Color.fromARGB(255, 51, 53, 52),
        child: const Icon(
          Icons.add,
          color: Colors.white,),
        ),
      
        backgroundColor: const Color(0xFFFDFDFD),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.7,
          title: const Text(
            'Daily Routine',
            style: TextStyle(fontSize: 28,color: Colors.black),
            
          ),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 20.0,left: 13,right: 13,bottom: 60),
          child: ReorderableListView(          
              
            children: routineList,
            
            
            onReorder: (int oldIndex,int newIndex){
              setState(() {
                if(oldIndex < newIndex){
                  newIndex -= 1;
                }
                final item = routineList.removeAt(oldIndex);
                routineList.insert(newIndex,item);
              });
            }

            ,),
        ));
  }
}
