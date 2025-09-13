import 'package:flutter/material.dart';

class CompletedTaskCard extends StatelessWidget {
   final String taskName;
  final String taskId;
  final String taskMode;

  const CompletedTaskCard({
    super.key,
    required this.taskName,
    required this.taskId,
    required this.taskMode,
  });
 // const CompletedTaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(11.0),
          child: Container(
            height: 130, // Increased height to accommodate the buttons
            width: 600,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 207, 232, 222),
              borderRadius: BorderRadius.circular(20), // Circular radius
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20, top: 20),
                  child: Row(
                    children: [
                      // Circle Container
                      Container(
                        height: 77, // Diameter of the circle
                        width: 66, // Diameter of the circle
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(136, 105, 216, 103), 
                          borderRadius: BorderRadius.all(Radius.circular(11))
                          // Circle color
                          // Makes the shape circular
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.task_alt,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      const SizedBox(
                          width: 10), // Space between circle and text
                      // Text Widget
                       Column(
                        crossAxisAlignment: CrossAxisAlignment
                            .start, // Aligns text to the start
                        children: [
                          Text(
                            taskName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 12, 12, 12),
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                          'Id : #${taskId}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          SizedBox(height: 2),
                            Text(
                            'Task Mode : ${taskMode}',
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black54,
                            ),
                          ),
                          
                        ],
                      ),
                    ],
                  ),
                ),
            
              ],
            ),
          ),
        ),
      ],
    );
  }
}
