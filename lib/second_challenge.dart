import 'package:flutter/material.dart';

class SecondChallenge extends StatefulWidget {
  const SecondChallenge({super.key});

  @override
  State<SecondChallenge> createState() => _SecondChallengeState();
}

class _SecondChallengeState extends State<SecondChallenge> {
  int redAcceptedData = 0;
  int blueAcceptedData = 1;
  int greenAcceptedData = 2;

  bool redAccepted = false;
  bool blueAccepted = false;
  bool greenAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Physical Challenge')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              draggableCircle(redAcceptedData, Colors.red),

              draggableCircle(blueAcceptedData, Colors.blue),

              draggableCircle(greenAcceptedData, Colors.green),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CustomDragTarget(
                color: Colors.red,
                acceptedValue: 0,
                isAccepted: redAccepted,
                onAccepted: () {
                  setState(() {
                    redAccepted = true;
                  });
                },
              ),

              CustomDragTarget(
                color: Colors.blue,
                acceptedValue: 1,
                isAccepted: blueAccepted,
                onAccepted: () {
                  setState(() {
                    blueAccepted = true;
                  });
                },
              ),

              CustomDragTarget(
                color: Colors.green,
                acceptedValue: 2,
                isAccepted: greenAccepted,
                onAccepted: () {
                  setState(() {
                    greenAccepted = true;
                  });
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

Widget draggableCircle(int initialData, Color color) {
  return Draggable(
    data: initialData,

    feedback: CircleAvatar(backgroundColor: color, radius: 25),
    childWhenDragging: CircleAvatar(
      backgroundColor: color.withValues(alpha: 0.4),
      radius: 25,
    ),
    child: CircleAvatar(backgroundColor: color, radius: 25),
  );
}

class CustomDragTarget extends StatelessWidget {
  final Color color;
  final int acceptedValue;
  final bool isAccepted;
  final Function() onAccepted;

  const CustomDragTarget({
    Key? key,
    required this.color,
    required this.acceptedValue,
    required this.isAccepted,
    required this.onAccepted,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DragTarget<int>(
      onWillAcceptWithDetails: (data) {
        return data.data == acceptedValue;
      },
      onAcceptWithDetails: (data) {
        if (data.data as int == acceptedValue) {
          onAccepted();
        }
      },
      builder: (context, accepted, rejected) {
        // Rejected state - wrong item being dragged over
        if (rejected.isNotEmpty) {
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.2),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: color, width: 3),
            ),
            child: Icon(Icons.arrow_downward_outlined, color: Colors.white),
          );
        }

        // Accepted state - item has been successfully dropped
        if (isAccepted) {
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: color, width: 3),
            ),
            child: Icon(Icons.check, color: Colors.white),
          );
        }

        // Hovering state - correct item is being dragged over
        if (accepted.isNotEmpty) {
          return Container(
            width: 100,
            height: 100,
            decoration: BoxDecoration(
              color: color.withValues(alpha: 0.6),
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: color, width: 3),
            ),
            child: Icon(Icons.check, color: Colors.white),
          );
        }

        // Default state - empty target
        return Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            color: color.withValues(alpha: 0.3),
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: color, width: 3),
          ),
        );
      },
    );
  }
}
