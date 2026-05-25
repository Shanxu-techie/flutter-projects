import 'package:flutter/material.dart';
import 'package:login_form/dashboard_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var formKey = GlobalKey<FormState>();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  bool isPasswordHidden = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: EdgeInsets.all(24.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      "assets/images/logo.png",
                      width: 100,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                    SizedBox(height: 20),
                    Text("Welcome Back ,", style: TextStyle(fontSize: 22)),
                    SizedBox(height: 6),
                    Text("Sign in to continue"),
                    SizedBox(height: 52),
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter Email";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        labelText: "Email",
                        filled: true,
                        // fillColor: Theme.of(context).colorScheme.primaryContainer,
                        // icon: Icon(Icons.email),
                        prefixIcon: Icon(Icons.email),
                        // prefixIconColor:
                        //multiple types of border
                      ),
                      // maxLength: 30,
                      // enabled: false,
                      maxLines: 1,
                      // maxLength: 5,
                    ),
                    SizedBox(height: 16),
                    TextFormField(
                      controller: passwordController,
                      keyboardType: TextInputType.text,
                      obscureText: isPasswordHidden,
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return "Enter Password";
                        }
                        if (value.length < 6) {
                          return "Password must be more than 5 characters";
                        }
                        return null;
                      },
                      decoration: InputDecoration(
                        // hintText: "Password",
                        labelText: "Password",
                        filled: true,
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            setState(() {
                              isPasswordHidden = !isPasswordHidden;
                            });
                          },
                          icon: Icon(isPasswordHidden ? Icons.visibility : Icons.visibility_off),
                        ),
                      ),
                    ),
                    SizedBox(height: 12),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("Forgot Password?"),
                      ),
                    ),
                    SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: FilledButton(
                        onPressed: () {
                          if (formKey.currentState!.validate()) {
                            // get the values from the text field
                            String email = emailController.text.trim();
                            String password = passwordController.text;

                            if (email == "admin@gmail.com" &&
                                password == "123456") {
                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => DashboardPage(),));
                              // Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => DashboardPage(),)); // to replce the previous page
                            } else {
                              //invalid credentials
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("Invalid email/password"),
                                ),
                              );
                            }
                          }
                        },
                        style: FilledButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        child: Text("Login"),
                      ),
                    ),
                    SizedBox(height: 32),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("New User?"),
                        TextButton(onPressed: () {}, child: Text("Sign up")),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
