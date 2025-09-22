import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const FirstChallenge(),
    );
  }
}

class FirstChallenge extends StatefulWidget {
  const FirstChallenge({Key? key}) : super(key: key);

  @override
  State<FirstChallenge> createState() => _FirstChallenge();
}

class _FirstChallenge extends State<FirstChallenge> {
 
 
  @override
  Widget build(BuildContext context) {
    List<int> items = List<int>.generate(5, (int index) => index);

    SnackBar snackBar = SnackBar(
      content: Text('Yay! A SnackBar!'),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          

          print('undo logic');
        },
      ),
    );  


    return Scaffold(
      appBar: AppBar(title: Text('Task Management')),
      body: ReorderableListView(
        children: items.map((index) {
          return Dismissible(
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete_outline, color: Colors.white),
            ),
            onDismissed: (direction) async {
              if (direction == DismissDirection.startToEnd) {
                showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      int removedItem = items[index];
                //items.removeAt(index);
      return AlertDialog(
        title: const Text('Confirm Delete'),
        content:  SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text('Delete task number $removedItem'),
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('Delete'),
            onPressed: () {
              setState(() {
                items.removeAt(removedItem);
              });
                           Navigator.of(context).pop();

ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text(' task no. $removedItem deleted'),
    action: SnackBarAction(
      label: 'Undo',
      onPressed: () {
        setState(() => items.insert(index, removedItem));
      },
    ),
  ),
);
            },
          ),

             TextButton(
            child: const Text('Cancel'),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );



                // setState(() {
                //   items.remove(item);
                // }
                // );

               // return true;
              }
              //return true;
            },
            key: ValueKey(index),

            child: ListTile(
              onTap: () {
                print('clicked $index');
              },
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  color: Colors.blue, 

                  width: 3,
                ), // Define border color and width
                borderRadius: BorderRadius.circular(10), // Add rounded corners
              ),
              leading: Icon(Icons.menu),
              title: Text('Task $index'),
            ),
          );
        }).toList(),
        onReorder: (oldIndex, newIndex) {
          print('moved');
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final int item = items.removeAt(oldIndex);
            items.insert(newIndex, item);
          });
        },
      ),
    );
  }
}


class TaskModel{
  String taskTitle;

  TaskModel(this.taskTitle);
}