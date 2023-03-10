// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import 'home.dart';

class Login extends StatefulWidget {
  Login({super.key}) {}

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();

  bool _passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SafeArea(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Scaffold(
            backgroundColor: Color.fromARGB(255, 243, 243, 243),
            body: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      child: Image.asset('images/Free_Sample_By_Wix.jpg'),
                      height: 120,
                      width: 300,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text("Welcome to our online App! ", style: TextStyle(fontWeight: FontWeight.bold, fontFamily: 'TiltNeon', fontSize: 20)),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Find everything you need and more at our store.',
                      style: TextStyle(fontFamily: 'TiltNeon', fontSize: 18),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      width: 360,
                      height: 90,
                      child:
                          // E-mail TextformField
                          Center(
                        child: TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Colors.black87, width: 2.0),
                              ),
                              labelText: "Enter Your Email",
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Colors.black87, width: 2.0),
                              ),
                              prefixIcon: Icon(Icons.email)),
                          validator: (value) {
                            if (value == null || value.isEmpty || !value.contains('@') || !value.contains('.')) {
                              return 'Enter a Valid Email Address';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(
                            fontFamily: "Poppins",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: 360,
                      height: 80,
                      child:
                          // 2nd , Password TextformField
                          TextFormField(
                        obscureText: _passwordInVisible,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(color: Colors.black87, width: 2.0),
                          ),
                          labelText: "Enter Password",
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(),
                          ),
                          prefixIcon: Icon(Icons.key_outlined),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _passwordInVisible = !_passwordInVisible;
                              });
                            },
                            child: Icon(_passwordInVisible ? Icons.visibility_off : Icons.visibility),
                          ),
                        ),
                        validator: (PassCurrentValue) {
                          RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
                          var passNonNullValue = PassCurrentValue ?? "";
                          if (passNonNullValue.isEmpty) {
                            return ("Password is required");
                          } else if (passNonNullValue.length < 6) {
                            return ("Password Must be more than 5 characters");
                          } else if (!regex.hasMatch(passNonNullValue)) {
                            return ("Password should contain upper,lower,digit and Special character");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      height: 40,
                      width: 350,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(3.0),
                              side: BorderSide(color: Colors.black87, width: 1.5),
                            ),
                            backgroundColor: Color.fromARGB(255, 255, 255, 255),
                            foregroundColor: Colors.black87),
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (context, animation, _) {
                                    return Home();
                                  },
                                  opaque: false),
                            );
                          }
                        },
                        child: Text(
                          'Login',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 18,
                        ),
                        TextButton(onPressed: () {}, child: Text('Forgot password ? '))
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'OR',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    MaterialButton(
                      onPressed: () {},
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'images/R (1).png',
                              width: 50,
                              height: 50,
                            ),
                            Image.asset(
                              'images/R.jpg',
                              width: 90,
                              height: 90,
                            ),
                            Image.asset(
                              'images/R (2).png',
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                    )
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
