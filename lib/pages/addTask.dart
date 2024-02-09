import 'package:flutter/material.dart';
import 'package:task_mangement_app/pages/task.dart';
import 'home.dart'; // Import HomeScreen

class addTask extends StatefulWidget {
  const addTask({Key? key}) : super(key: key);

  @override
  State<addTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<addTask> {
  bool isCompleted = false; // Track completion status
  late DateTime _selectedDate;
  TextEditingController taskNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _selectedDate = DateTime.now();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2101),
    );
    if (pickedDate != null && pickedDate != _selectedDate)
      setState(() {
        _selectedDate = pickedDate;
      });
  }

  void _showTaskDetails(BuildContext context) {
    taskDetails task = taskDetails(
      taskName: taskNameController.text,
      description: descriptionController.text,
      dueDate: _selectedDate.toString(),
      isCompleted: isCompleted,
    );

    Navigator.pop(context, task); // Pop the current screen and pass the task details back to HomeScreen
  }

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
                controller: taskNameController,
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
              child: TextFormField(
                controller: descriptionController,
                decoration: InputDecoration(border: InputBorder.none),
              ),
            ),
            Text(
              "Due Date",
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => _selectDate(context),
                    child: Text(
                      'Select Date: ${_selectedDate.toString().split(' ')[0]}',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10.0),
            Text(
              "Completion Status",
              style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10.0),
            Row(
              children: [
                IconButton(
                  icon: Icon(
                    isCompleted ? Icons.check_circle : Icons.radio_button_unchecked,
                    color: isCompleted ? Colors.green : Colors.grey,
                    size: 30,
                  ),
                  onPressed: () {
                    setState(() {
                      isCompleted = !isCompleted;
                    });
                  },
                ),
                Text(
                  isCompleted ? 'Completed' : 'Not Completed',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            SizedBox(height: 30.0),
            Center(
              child: ElevatedButton(
                onPressed: () {
                  _showTaskDetails(context); // Show task details when the button is pressed
                },
                child: Text(
                  "Add",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
