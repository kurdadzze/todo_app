
import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';

class EditScreen extends StatefulWidget {
  EditScreen({Key? key, required this.topic, required this.title, required this.description, required this.docId}) : super(key: key);

  final String topic;
  final String title;
  final String description;
  final String docId;

  @override
  _EditScreenState createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  late TextEditingController _topicController;

  late TextEditingController _titleController;

  late TextEditingController _descriptionController;

  @override
  void initState() {
    super.initState();
    _topicController = TextEditingController(text: widget.topic);
    _titleController = TextEditingController(text: widget.title);
    _descriptionController = TextEditingController(text: widget.description);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Edit Todo',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              SizedBox(height: 20,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _topicController,
                  decoration: InputDecoration(hintText: 'please enter topic'),
                ),
              ),
              SizedBox(height: 20,),

              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _titleController,
                  decoration: InputDecoration(hintText: 'please enter task'),
                ),
              ),
              SizedBox(height: 20,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: TextField(
                  controller: _descriptionController,
                  decoration: InputDecoration(hintText: 'please enter description'),
                ),
              ),
              SizedBox(height: 20,),
              Container(width: double.infinity,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Database.updateItem(topic:_topicController.text, title: _titleController.text, description: _descriptionController.text, docId: widget.docId);
                    Navigator.pop(context);
                  },
                  child: Text("Edit"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}