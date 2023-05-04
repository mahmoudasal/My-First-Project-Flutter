import 'package:creativa_app/feautres/home/screen/navbar.dart';
import 'package:creativa_app/feautres/home/screen/reg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';

import 'home.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

final _formKey = GlobalKey<FormState>();

TextEditingController emailController = TextEditingController();
TextEditingController passwordController = TextEditingController();

bool _passwordInVisible = true;

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
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
                      Text("Welcome to our online App! ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "Poppins", color: Color(0xff223263))),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Find everything you need and more at our store.',
                        style: TextStyle(fontSize: 12, fontFamily: "Poppins", color: Color(0xff9098B1)),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        width: 360,
                        height: 80,
                        child:
                            // E-mail TextformField
                            TextFormField(
                          controller: emailController,
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              hintText: "Your Email",
                              hintStyle: TextStyle(fontSize: 12, fontFamily: "Poppins", color: Color(0xff9098B1)),
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: BorderSide(color: Color(0xff40BFFF), width: 1.0),
                              ),
                              prefixIcon: Icon(Icons.email_outlined)),
                          validator: (mailCurrentValue) {
                            RegExp regex = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
                            var mailNonNullValue = mailCurrentValue ?? "";
                            if (mailNonNullValue.isEmpty) {
                              return ("Email is required");
                            } else if (mailNonNullValue.length < 7) {
                              return ("Email Must be more than 6 characters");
                            } else if (!regex.hasMatch(mailNonNullValue)) {
                              return ("Password should contain '@' and '.' ");
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
                        height: 10,
                      ),
                      SizedBox(
                        width: 360,
                        height: 80,
                        child:
                            // 2nd , Password TextformField
                            TextFormField(
                          controller: passwordController,
                          obscureText: _passwordInVisible,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(fontSize: 12, fontFamily: "Poppins", color: Color(0xff9098B1)),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            prefixIcon: Icon(Icons.lock_outline),
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
                                borderRadius: BorderRadius.circular(10.0),
                                side: BorderSide(color: Color.fromARGB(255, 171, 153, 205), width: 0.8),
                              ),
                              backgroundColor: Color.fromARGB(255, 171, 153, 205),
                              foregroundColor: Colors.white),
                          onPressed: () {
                            if (_formKey.currentState!.validate()) {
                              Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                  builder: (context) {
                                    return NavigatorScreen();
                                  },
                                ),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: Text(
                              'Forgot Password?',
                              style: TextStyle(color: Color.fromARGB(255, 171, 153, 205), fontSize: 12),
                            ),
                          ),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                        Text("Don't have an account?", style: TextStyle(fontSize: 12, color: Color(0xff9098B1), fontFamily: "Poppins")),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                builder: (context) {
                                  return RegistrationPage();
                                },
                              ),
                            );
                          },
                          child: Text(
                            'Register',
                            style: TextStyle(
                              fontSize: 12,
                              color: Color.fromARGB(255, 171, 153, 205),
                            ),
                          ),
                        )
                      ]),
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
                              SignInButton(
                                Buttons.LinkedIn,
                                mini: true,
                                onPressed: () {},
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
      ),
    );
  }
}
