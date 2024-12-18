import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';


final name = TextEditingController();

final email = TextEditingController();
final password = TextEditingController();

final formKey = GlobalKey<FormState>();

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
  bool validateEmail(String email) {
    return EmailValidator.validate(email);
  }

  // Password validation
  bool _isSecurePassword = true;
  String _passwordError = '';

  Widget togglePassword() {
    return IconButton(
      onPressed: () {
        setState(() {
          _isSecurePassword = !_isSecurePassword;
        });
      },
      icon: _isSecurePassword ? Icon(Icons.visibility) : Icon(Icons.visibility_off),
      color: Colors.grey,
    );
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
                ),
              ),
            ),
            SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Form(
                key: formKey,
                child: TextField(
                  controller: email,
                  keyboardType: TextInputType.multiline,
                  style: TextStyle(
                    fontSize: 18,
                  ),
                  decoration: InputDecoration(
                    hintText: "Enter Email",
                    prefixIcon: Icon(Icons.mail),
                    border: OutlineInputBorder(),
                    errorText: _passwordError.isEmpty ? null : _passwordError,
                  ),
                ),
              ),
            ),
            SizedBox(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                obscureText: _isSecurePassword,
                controller: password,
                decoration: InputDecoration(
                  hintText: 'Enter your Password',
                  suffixIcon: togglePassword(),
                  prefixIcon: Icon(Icons.lock),
                  border: OutlineInputBorder(),
                  errorText: _passwordError.isEmpty ? null : _passwordError,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _passwordError = '';

                  // Validate email and password
                  if (validateEmail(email.text)) {
                    if (password.text.length < 6 || password.text.length > 16) {
                      _passwordError = 'Password must be 6-16 characters long.';
                    } else {
                      // Handle valid email and password (e.g., sign up)
                      print('Email and password are valid.');
                    }
                  } else {
                    _passwordError = 'Invalid email address.';
                  }
                });
              },
              child: Text('Sign Up'),
            ),
            Text(name.text),
            Text(email.text),
          ],
        ),
      ),
    );
  }
}