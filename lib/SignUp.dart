import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SignUp extends StatefulWidget{
  State<SignUp> createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  final _auth= FirebaseAuth.instance;
  bool _isVisible= true;


  late String email, password;
  bool showProgress= false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text( 'Create Your Account',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Registration Page",
            style:TextStyle(fontWeight: FontWeight.w800, fontSize: 20.0) ,),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.start,
              onChanged: (value){
                email=value;
              },
              decoration: InputDecoration(
                hintText: 'Enter your Email',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.black)
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.black)
                ),
                contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            TextField(
              onChanged: (value){
                password=value;
              },
              obscureText: _isVisible,
                decoration: InputDecoration(
                  labelText: 'Password',
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _isVisible= !_isVisible;
                      });
                    },
                    icon: _isVisible
                    ? Icon(
                      Icons.visibility,
                      color: Colors.black,
                    )
                        : Icon(
                      Icons.visibility,
                      color: Colors.black,
                    )
                  ),
                  border: OutlineInputBorder(
                    // passwordu yerleştiridğimiz kutunun şekli

                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.black)),
                  hintText: "Password",
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                ),
            ),
            ElevatedButton(
                onPressed: () async {
                  setState(() {
                    showProgress=true;
                  });
                  try{
                    final newUser=await _auth.createUserWithEmailAndPassword(
                        email: email, password: password);
                    if(newUser != null) {
                      Navigator.pop(context);
                    }
                    setState(() {
                      showProgress=false;
                    });
                  }
                  catch(e) {}
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}