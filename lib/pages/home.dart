import 'package:flutter/material.dart';
import 'package:task_mangement_app/pages/task.dart';
import 'addTask.dart'; // Import the TaskDetails page

class home extends StatefulWidget {
  const home({Key? key}) : super(key: key);

  @override
  State<home> createState() => _HomeState();
}

class _HomeState extends State<home> {
  List<taskDetails> tasks = []; // List to store tasks

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final newTask = await Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => addTask()), // Navigate to AddTask page
          );
          if (newTask != null) {
            setState(() {
              tasks.add(newTask);
            });
          }
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text("Task Management App"),
      ),
      body: ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(tasks[index].taskName),
              subtitle: Text(tasks[index].description), // Provide description
              trailing: Checkbox(
                value: tasks[index].isCompleted,
                onChanged: (bool? value) {
                  setState(() {
                  });
                },
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => taskDetails(
                      taskName: tasks[index].taskName,
                      description: tasks[index].description,
                      dueDate: tasks[index].dueDate,
                      isCompleted: tasks[index].isCompleted)),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

