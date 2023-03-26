import 'package:flutter/material.dart';
import 'routine_list.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key,});

  

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: (){
           
          setState(() {
             AlertDialog(
            title: Text('br'),

            );
           
          });
          
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
          padding: const EdgeInsets.only(top: 15.0,left: 9,right: 9,bottom: 60),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: routineList,
                         ),
          ),
        ));
  }
}
