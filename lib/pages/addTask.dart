import 'package:flutter/material.dart';

class addTask extends StatefulWidget {
  const addTask({Key? key}) : super(key: key);

  @override
  State<addTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<addTask> {
  bool isCompleted = false; // Track completion status

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Add",
              style: TextStyle(color: Colors.pinkAccent, fontSize: 20.0, fontWeight: FontWeight.bold),
            ),
            Text(
              "Task",
              style: TextStyle(color: Colors.pinkAccent, fontSize: 20.0, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(left: 20.0, top: 30.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Task Name",
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Text(
              "Description",
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Container(
              decoration: BoxDecoration(border: Border.all(), borderRadius: BorderRadius.circular(10)),
              child: TextField(
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Text(
              "Completion Status",
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Checkbox(
              value: isCompleted,
              onChanged: (value) {
                setState(() {
                  isCompleted = value ?? false;
                });
              },
            ),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(onPressed: (){

              }, child: Text("Add", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),)),
            )
          ],
        ),
      ),
    );
  }
}
