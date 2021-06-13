// // ignore: avoid_web_libraries_in_flutter
// import 'dart:html';


import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';

class AddNewScreen extends StatelessWidget {
  AddNewScreen({Key? key}) : super(key: key);

  TextEditingController _topicController = TextEditingController();
  TextEditingController _titleController = TextEditingController();
  TextEditingController _descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add New Screen'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Add Todo',
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
                  decoration: InputDecoration(hintText: 'please enter title'),
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
                  borderRadius: BorderRadius.circular(20),
                ),
                child: ElevatedButton(
                  onPressed: () {
                    Database.addItem(topic: _topicController.text, title: _titleController.text, description: _descriptionController.text);
                    Navigator.pop(context);
                  },
                  child: Text("Add"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}