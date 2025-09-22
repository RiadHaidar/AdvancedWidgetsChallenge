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
   'complete flutter assignment', 'practice widget catalog']; 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Management')),
      body: ReorderableListView(
        children: items.asMap().entries.map((entry) {
        int index = entry.key;
          String item = entry.value;
          return Dismissible(
            background: Container(
              color: Colors.red,
              child: Icon(Icons.delete_outline_outlined,
              color: Colors.white,),
            ),
            key: ValueKey(entry.value),
            confirmDismiss: (direction) async {
              bool? shouldDelete = await showDialog<bool>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text('Confirm Delete'),
                    content: SingleChildScrollView(
                      child: ListBody(
                        children: <Widget>[
                          Text(
                            'Delete task: $item',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    actions: <Widget>[
                      TextButton(
                        child: const Text('Cancel'),
                        onPressed: () {
                          Navigator.of(context).pop(false); 
                        },
                      ),
                      TextButton(
                        child: const Text('Delete'),
                        onPressed: () {
                          Navigator.of(context).pop(true); 
                        },
                      ),
                    ],
                  );
                },
              );

              if (shouldDelete == true) {
                setState(() {
                  items.removeAt(index);
                });
                
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('Task "$item" deleted', 
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    action: SnackBarAction(
                      label: 'Undo',
                      onPressed: () {
                        setState(() {
                          items.insert(index, item);
                        });
                      },
                    ),
                  ),
                );
              }
              
              return shouldDelete; 
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
