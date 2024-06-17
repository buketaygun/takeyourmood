import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';



TextEditingController emailController = TextEditingController();
TextEditingController otpController= TextEditingController();
TextEditingController phoneController = TextEditingController();


class ForgotpassVal extends StatefulWidget{
  State<ForgotpassVal> createState() => _ForgotpassVal();
}


class _ForgotpassVal extends State<ForgotpassVal> {

  late String email, password;
  final auth=FirebaseAuth.instance;




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("TAKEURMOOD"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: <Widget>[
            Column(
              children: [
                Padding(
                    padding: EdgeInsets.fromLTRB(20, 20, 20, 10),
                  child: Text("Please enter your e-mail to reset your password",
                    style: TextStyle( fontSize: 20, color: Colors.pinkAccent),
                  ),
                )
              ],
            ),
            Container(
              padding: EdgeInsets.symmetric(vertical: 20,horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                    child: TextField(
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        hintText: ('Please enter your mail'),),
                        onChanged: (value){
                        setState(() {
                          email=value;
                        });
                        }
                      ),
                    ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                          child:Text(
                            'Send Request'
                          ),
                        onPressed: () {
                            auth.sendPasswordResetEmail(email: email);
                            Navigator.of(context).pop();
                        },
                        style: ElevatedButton.styleFrom(backgroundColor: Colors.pinkAccent),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
