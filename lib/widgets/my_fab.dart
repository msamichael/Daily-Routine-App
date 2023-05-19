import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {

  final Function()? onPressed;

  const MyFloatingActionButton({
    super.key,
    required this.onPressed,

    });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(7)),
        
      ),
      onPressed: onPressed,
      backgroundColor: Color.fromARGB(255, 51, 53, 52),
      child: Icon(Icons.add,color: Colors.white,),
    );
  }
}