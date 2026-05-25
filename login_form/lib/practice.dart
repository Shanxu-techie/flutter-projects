// Write a complete login screen called LoginPage as a StatefulWidget that has:
//
// Email and password TextFormFields with validators
// A GlobalKey<FormState> for validation
// A FilledButton that validates the form on press and shows a SnackBar with "Login Successful" if valid
// Password field has obscureText: true
//
// Write the complete class — StatefulWidget + State.

import "package:flutter/material.dart";

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  TextFormField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: "Email"),
                    maxLines: 1,
                    validator: (value) {
                      final emailRegex = RegExp(
                        r"^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$",
                      );
                      if (value == null || value.trim().isEmpty) {
                        return "Email can not be empty.";
                      } else if (!emailRegex.hasMatch(value.trim())) {
                        return "Please enter a valid email.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12,),
                  TextFormField(
                    controller: passwordController,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: InputDecoration(labelText: "Password"),
                    validator: (value) {
                      if (value == null || value.trim().isEmpty) {
                        return "Password can not be empty.";
                      }
                      if (value.length < 6) {
                        return "Password must be 6 characters.";
                      }
                      return null;
                    },
                  ),
                  SizedBox(height: 12,),
                  FilledButton(
                    child: Text("Submit"),
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // var email = emailController.text.trim();
                        // var password = passwordController.text.trim();
                        // if (email == "abc@gmail.com" && password == "1234567") {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text("Login Successful")),
                          );
                        // }
                      } else{
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Login Unsuccessful")),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
