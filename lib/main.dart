// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:simple_daily_routine/constants.dart';
import 'screens/homepage.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';


void main() async{
  //initialize hive
  await Hive.initFlutter();

  //open a box
  await Hive.openBox('Routine_Database');

  runApp(const MyApp());
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daily Routine',
      theme: ThemeData(
        useMaterial3: true,
        
        timePickerTheme: TimePickerThemeData(
          hourMinuteTextColor: Colors.white,
          hourMinuteColor: kgreyBlack,
          dialHandColor: kgreyBlack,
          dayPeriodColor: kgreyBlack,
          dayPeriodTextColor: Colors.white,
          
          
          
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(),
    );
  }
}

