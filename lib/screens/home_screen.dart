import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/screens/add_new_screen.dart';
import 'package:todo_app/screens/edit_screen.dart';

import 'package:todo_app/model/todo.dart';
import 'package:todo_app/provider/todos.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fireapp"),
        centerTitle: true,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white.withOpacity(0.7),
        selectedItemColor: Colors.white,
        currentIndex: selectedIndex,
        onTap: (index) => setState(() {
          selectedIndex = index;
        }),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.fact_check_outlined),
            label: 'Todos',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.done, size: 28),
            label: 'Completed',
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Database.readItems(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("opps! error");
          } else if (snapshot.hasData || snapshot.data != null) {
            return ListView.separated(
                itemBuilder: (context, index) {
                  String topic = snapshot.data!.docs[index].get("topic");
                  String title = snapshot.data!.docs[index].get("title");
                  String docId = snapshot.data!.docs[index].id;
                  String description = snapshot.data!.docs[index].get("description");
                  return Card(
                    child: ListTile(
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => EditScreen(topic: topic,title: title, description: description, docId: docId,),),),
                      onLongPress:() => Database.deleteItem(docId: snapshot.data!.docs[index].id),
                      trailing: Text(topic),
                      title: Text(title),
                      subtitle: Text(description),
                    ),
                  );

                },
                separatorBuilder: (context, index) => SizedBox(height: 15,),
                itemCount: snapshot.data!.docs.length);
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => AddNewScreen(),),),
        child: Icon(Icons.add),
      ),
    );
  }
}