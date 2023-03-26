import 'package:flutter/material.dart';
import 'routine_list.dart';

// int index = routineList.index;

int? index;


class RoutineCard extends StatefulWidget {
  
  const RoutineCard({
    super.key,
  });

  @override
  State<RoutineCard> createState() => _RoutineCardState();
}

class _RoutineCardState extends State<RoutineCard> {
  @override
  Widget build(BuildContext context) {
  
 

    return Padding(
      padding: const EdgeInsets.only(bottom: 20,left: 8,right: 8),
      child: Container(
        // margin: EdgeInsets.only(bottom: 20,left: 8,right: 8),
        
        color: Color.fromARGB(255, 189, 202, 217),
        key:  widget.key,
        
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Wake Upwsww',
                style: TextStyle(fontSize: 25 ),
                ),
                IconButton(onPressed: (){}, icon: const Icon(Icons.delete))
            ],
          ),
        ),
        
      ),
    );
  }
}

