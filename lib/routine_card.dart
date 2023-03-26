import 'package:flutter/material.dart';



class RoutineCard extends StatelessWidget {
  const RoutineCard({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20,left: 8,right: 8),
      
      color: Color.fromARGB(255, 189, 202, 217),
      
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
      
    );
  }
}

