import 'package:flutter/material.dart';
import 'package:todo_app/data/database.dart';
import 'package:todo_app/screens/home_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  TextEditingController _textEditingController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Container(
          // color: Theme.of(context).accentColor,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(icon: Icon(Icons.account_box)),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    border: Border.all(),
                    borderRadius: BorderRadius.circular(18),
                  ),


                    child: TextButton(
                        style: TextButton.styleFrom(
                          padding: const EdgeInsets.all(16.0),

                          textStyle: const TextStyle(fontSize: 16),
                        ),
                    onPressed: () {

                      Database.userID=_textEditingController.text;
                      Navigator.push(context, MaterialPageRoute(builder: (_) => HomeScreen(),
                      ),
                      );
                    },
                    child: Text("Login",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                      ),

                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}