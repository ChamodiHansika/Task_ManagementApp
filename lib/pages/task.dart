import 'package:flutter/material.dart';

class taskDetails extends StatefulWidget {
  final String taskName;
  final String description;
  final String dueDate;
  final bool isCompleted;

  const taskDetails({
    Key? key,
    required this.taskName,
    required this.description,
    required this.dueDate,
    required this.isCompleted,
  }) : super(key: key);


  @override
  State<taskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<taskDetails> {
  late TextEditingController _taskNameController;
  late TextEditingController _descriptionController;
  late TextEditingController _dueDateController;

  @override
  void initState() {
    super.initState();
    _taskNameController = TextEditingController(text: widget.taskName);
    _descriptionController = TextEditingController(text: widget.description);
    _dueDateController = TextEditingController(text: widget.dueDate);
  }

  @override
  void dispose() {
    _taskNameController.dispose();
    _descriptionController.dispose();
    _dueDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _taskNameController,
              decoration: InputDecoration(labelText: 'Task Name'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _descriptionController,
              decoration: InputDecoration(labelText: 'Description'),
            ),
            SizedBox(height: 20.0),
            TextFormField(
              controller: _dueDateController,
              decoration: InputDecoration(labelText: 'Due Date'),
            ),
            SizedBox(height: 20.0),
            Checkbox(
              value: widget.isCompleted,
              onChanged: (value) {
                // Handle completion state change
              },
            ),
            SizedBox(height: 20.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Handle edit action
                  },
                  child: Text('Edit'),
                ),
                ElevatedButton(
                  onPressed: () {
                    // Handle delete action
                  },
                  child: Text('Delete'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
