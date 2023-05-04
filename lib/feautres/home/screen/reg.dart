import 'package:flutter/material.dart';

import 'HomeReg.dart';
import 'home.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

final _formKey = GlobalKey<FormState>();

TextEditingController emailController = TextEditingController();
TextEditingController phoneController = TextEditingController();
TextEditingController passwordController = TextEditingController();
TextEditingController passwordConfirmController = TextEditingController();
bool _passwordInVisible = true;

class _RegistrationPageState extends State<RegistrationPage> {
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
                    Text("Let's Get Started", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, fontFamily: "Poppins", color: Color(0xff223263))),
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
                            prefixIcon: Icon(Icons.email)),
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
                      width: 360,
                      height: 80,
                      child:
                          // E-mail TextformField
                          TextFormField(
                        controller: phoneController,
                        decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color.fromARGB(255, 255, 255, 255),
                              ),
                            ),
                            hintText: "Phone Number",
                            hintStyle: TextStyle(fontSize: 12, fontFamily: "Poppins", color: Color(0xff9098B1)),
                            fillColor: Colors.white,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              borderSide: BorderSide(color: Color(0xff40BFFF), width: 1.0),
                            ),
                            prefixIcon: Icon(Icons.phone)),
                        validator: (phoneCurrentValue) {
                          RegExp regex = RegExp(r'/^\(?(\d{3})\)?[- ]?(\d{3})[- ]?(\d{4})$/');
                          var phoneNonNullValue = phoneCurrentValue ?? "";
                          if (phoneNonNullValue.isEmpty) {
                            return ("phone number is required");
                          } else if (phoneNonNullValue.length < 7) {
                            return ("Phone Number Must be more than 6 characters");
                          } else if (regex.hasMatch(phoneNonNullValue)) {
                            return (" Enter Vaild phone number ");
                          }
                          return null;
                        },
                        keyboardType: TextInputType.phone,
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
                            borderSide: BorderSide(color: Color(0xff40BFFF), width: 1.0),
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
                      width: 360,
                      height: 80,
                      child:
                          // 2nd , Password TextformField
                          TextFormField(
                        controller: passwordConfirmController,
                        obscureText: _passwordInVisible,
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                          hintText: "Confirm password",
                          hintStyle: TextStyle(fontSize: 12, fontFamily: "Poppins", color: Color(0xff9098B1)),
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                            borderSide: BorderSide(color: Color(0xff40BFFF), width: 1.0),
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
                          var passNonNullValue = PassCurrentValue ?? "";
                          if (passNonNullValue.isEmpty) {
                            return ("Password is required");
                          }
                          if (passwordConfirmController.text != passwordController.text) {
                            return 'password not match';
                          }
                          if (passwordConfirmController.text.length < 6) {
                            return ("Password Must be more than 5 characters");
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
                            Navigator.of(context).push(
                              PageRouteBuilder(
                                  pageBuilder: (context, animation, _) {
                                    return LoginPage();
                                  },
                                  opaque: false),
                            );
                          }
                        },
                        child: Text(
                          'Register',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
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
