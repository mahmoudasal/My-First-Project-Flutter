import 'package:creativa_app/feautres/home/screen/home.dart';
import 'package:flutter/material.dart';

class Regesteration extends StatefulWidget {
  Regesteration({super.key});

  @override
  State<Regesteration> createState() => _RegesterationState();
}

class _RegesterationState extends State<Regesteration> {
  final _formKeyReg = GlobalKey<FormState>();

  TextEditingController emailRegController = TextEditingController();

  TextEditingController phoneRegController = TextEditingController();

  TextEditingController passwordRegController = TextEditingController();

  TextEditingController passwordRegConfirmController = TextEditingController();

  bool _passwordInVisible = true;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKeyReg,
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
                        height: 80,
                        child:
                            // E-mail TextformField
                            TextFormField(
                          controller: emailRegController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Color.fromARGB(255, 171, 153, 205), width: 2.0),
                              ),
                              labelText: "Enter Your Email",
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Color.fromARGB(255, 171, 153, 205), width: 2.0),
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
                          controller: phoneRegController,
                          decoration: InputDecoration(
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Color.fromARGB(255, 171, 153, 205), width: 2.0),
                              ),
                              labelText: "Enter Your Phone Number",
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20.0),
                                borderSide: BorderSide(color: Color.fromARGB(255, 171, 153, 205), width: 2.0),
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
                          controller: passwordRegController,
                          obscureText: _passwordInVisible,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Color.fromARGB(255, 171, 153, 205), width: 2.0),
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
                        width: 360,
                        height: 80,
                        child:
                            // 2nd , Password TextformField
                            TextFormField(
                          controller: passwordRegConfirmController,
                          obscureText: _passwordInVisible,
                          decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20.0),
                              borderSide: BorderSide(color: Color.fromARGB(255, 171, 153, 205), width: 2.0),
                            ),
                            labelText: "ConfirmPassword",
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
                            var passNonNullValue = PassCurrentValue ?? "";
                            if (passNonNullValue.isEmpty) {
                              return ("Password is required");
                            }
                            if (passwordRegConfirmController.text != passwordRegController.text) {
                              return 'password not match';
                            }
                            if (passwordRegConfirmController.text.length < 6) {
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
                                borderRadius: BorderRadius.circular(3.0),
                                side: BorderSide(color: Color.fromARGB(255, 171, 153, 205), width: 1.8),
                              ),
                              backgroundColor: Color.fromARGB(255, 255, 255, 255),
                              foregroundColor: Colors.black87),
                          onPressed: () {
                            if (_formKeyReg.currentState!.validate()) {
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
      ),
    );
  }
}
