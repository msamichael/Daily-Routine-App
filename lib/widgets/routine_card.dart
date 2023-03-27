import 'package:flutter/material.dart';





class RoutineCard extends StatefulWidget {



   final String? newTaskTitle;
  
   RoutineCard({
    super.key,
    @required  this.newTaskTitle, 
  });

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {


  @override
  Widget build(BuildContext context) {
 
 

    return Container(
       margin: EdgeInsets.only(bottom: 6,top: 6),
      
      
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(7),
        color: Color.fromARGB(255, 189, 202, 217),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(
              '${widget.newTaskTitle}',
              style: TextStyle(fontSize: 25 ),
              ),
              IconButton(onPressed: (){}, icon: const Icon(Icons.drag_handle_sharp))
          ],
        ),
      ),
      
    );
  }
}

