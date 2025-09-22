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
  List<String> items = ['Review clean arch',
   'complete flutter assignment', 'practice widget catalog']; // Your data source

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Management')),
      body: ReorderableListView(
        children: items.asMap().entries.map((entry) {
          return Dismissible(
            key: ValueKey(entry.value),
            onDismissed: (direction) {
              showDialog<void>(
                context: context,
                barrierDismissible: false, // user must tap button!
                builder: (BuildContext context) {
                  int removedItem = entry.key;
                  String removedTaskTitle = items[entry.key];
                  //items.removeAt(index);
                  return AlertDialog(
                    title: const Text('Confirm Delete'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text('Delete task number $removedTaskTitle',
                                                        style: TextStyle(fontWeight: FontWeight.bold ),

                          ),
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
                              content: Text(' task $removedTaskTitle deleted',
                              style: TextStyle(fontWeight: FontWeight.bold ),
                              ),
                              action: SnackBarAction(
                                label: 'Undo',
                                onPressed: () {
                                  setState(
                                    () => items.insert(
                                      removedItem,
                                      removedTaskTitle,
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        },
                      ),
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          setState(
                                    () => items.insert(
                                      removedItem,
                                      removedTaskTitle,
                                    ),
                                  );
                          Navigator.of(context).pop(); // Close the dialog
                        },
                      ),
                    ],
                  );
                },
              );

        
            },

            child: Card(
              key: ValueKey(entry.value),
              elevation: 4,
              margin: EdgeInsets.all(8),
              child: ListTile(
                key: ValueKey(entry.value),

                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Colors.blue, width: 3),
                  borderRadius: BorderRadius.circular(10),
                ),
                leading: Icon(Icons.menu),
                title: Text(entry.value),
              ),
            ),
          );
        }).toList(),

        onReorder: (oldIndex, newIndex) {
          print('moved');
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
        String taskTitle=   items[oldIndex];
            items.removeAt(oldIndex);
            items.insert(newIndex, taskTitle);
          });
        },
      ),
    );
  }
}
