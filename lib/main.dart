import 'package:flutter/material.dart';
import 'package:takeyourmood/ForgotpassVal.dart';
import 'package:takeyourmood/LoginPage.dart';
import 'package:takeyourmood/SignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  State<MyApp> createState() => _MyApp();
}

class _MyApp extends State<MyApp> {
  static const String rtitle = 'TAKEURMOOD';

  Widget build(BuildContext context) {
    return MaterialApp(
      title: rtitle,
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: Scaffold(
        appBar: AppBar(title: const Text(rtitle)),
        body: const MyHomePage(title: rtitle),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  TextEditingController emailContoller = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final auth = FirebaseAuth.instance;
  bool showProgress = false;
  bool _isvisible = true;
  late String email, password;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: <Widget>[
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Take Ur Mood',
              style: TextStyle(
                  color: Colors.pinkAccent,
                  fontWeight: FontWeight.w500,
                  fontSize: 30),
            ),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Sign In',
              style: TextStyle(
                  color: Colors.black54,
                  fontWeight: FontWeight.w500,
                  fontSize: 15),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onChanged: (value) {
                email = value;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Email',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: TextField(
              obscureText: _isvisible,
              textAlign: TextAlign.start,
              onChanged: (value) {
                password = value;
              },
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _isvisible = !_isvisible;
                    });
                  },
                  icon: _isvisible
                      ? Icon(
                          Icons.visibility,
                          color: Colors.black,
                        )
                      : Icon(
                          Icons.visibility_off,
                          color: Colors.grey,
                        ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                labelText: 'Password',
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => ForgotpassVal()));
            },
            child: const Text(
              'Forgot Password ?',
            ),
          ),
          Container(
            height: 50,
            padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.pinkAccent),
                child: const Text(
                  'Sign In',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
                onPressed: () async {
                  setState(() {
                    showProgress = true;
                  });
                  try {
                    final newUser = await auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    print(newUser.toString());
                    if (newUser != null) {
                      Fluttertoast.showToast(
                          msg: 'Login Successfully',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.CENTER,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.pinkAccent,
                          textColor: Colors.white,
                          fontSize: 15.0);
                      setState(() {
                        showProgress = false;
                      });
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    }
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'user-not-found' &&
                        e.code == 'wrong-password') {
                      Fluttertoast.showToast(
                          msg: "Email or password is invalid.",
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 5,
                          backgroundColor: Colors.black,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                  }
                }),
          ),
          Row(
            children: <Widget>[
              const Text('Does not have an account ?'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.white),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SignUp()));
                },
                child: const Text(
                  'Sign up',
                  style: TextStyle(fontSize: 10, color: Colors.pinkAccent),
                ),
              ),
            ],
            mainAxisAlignment: MainAxisAlignment.center,
          ),
        ],
      ),
    );
  }
}
