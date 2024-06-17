import 'package:flutter/material.dart';
import 'package:takeyourmood/AddingClothing.dart';
import 'package:takeyourmood/Wardrobe.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TAKEURMOOD'),),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: ListView (
          children:< Widget>[
            Center(
              child: ElevatedButton(
                  onPressed: (){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddingClothing()));
                  },
                  child:const Text("Adding Clothes"),
              ),
            ),
            ElevatedButton(
                onPressed:(){
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => Wardrobe()));
                },
                child: Text("Your Online Wardrobe"),

    ),
          ],
        ),
      ),
      
    );

  }
}
