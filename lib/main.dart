import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
//import 'package:login_page/welcome.dart';

final name = TextEditingController();
//final email = TextEditingController();
final password = TextEditingController();
final formKey = GlobalKey<FormState>();
// text editing controller
TextEditingController inputcontroller = TextEditingController();
// to add a empty string
String? ca ="";

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Login(),
    ),
  );
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  get validator => null;

  
  bool? Validate(String email) {
    bool isvalid = EmailValidator.validate(email);
    if (isvalid == true) {
      return true;
    }
    return null;
  }
  //Password
  bool _isSecurePassword = true;
  Widget togglePassword(){
    return IconButton(onPressed: (){
      setState(() {
        _isSecurePassword = !_isSecurePassword;
      });
    }, icon: _isSecurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off), color: Colors.grey,);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('Login'),
        ),
        backgroundColor: Colors.blue,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text('Enter Your Name'),
                  //errorText: password ? null : 'Password must be 5-16 characters',
                ),
              ),
            ),
            SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child:TextField(
                  controller: inputcontroller,
                  keyboardType: TextInputType.multiline,
                  //maxLines: null,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    label: Text("Enter Your Mmail"),
                    //hintText: "Enter Email",
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                    
                  ),
                ),
              ),
            ),
            SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: _isSecurePassword,
                //controller: password,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  suffixIcon: togglePassword(),
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  label: Text('Enter Your Password'),
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  var result =Validate(inputcontroller.text);
                  if (result == true){
                    setState(() {
                      //bgColor = Colors.red;
                      String valid = "ok";
                      ca = 'Email is valid';
                      print(valid);
                    });
                    Text('Email is valid');
                  };
                });
              },
              child: Text('Sign Up'),
            ),
            Text(name.text),
            //Text(email.text),
            Text(ca.toString()),
          ],
        ),
      ),
    );
  }
}
