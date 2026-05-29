
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:gig_go_assesment/Screen/home_screen.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() =>
      _LoginpageState();
}

class _LoginpageState
    extends State<Loginpage> {

  // Global Key
  final globalkey =
      GlobalKey<FormState>();

  // Controllers
  TextEditingController _email =
      TextEditingController();

  TextEditingController _password =
      TextEditingController();

  @override
  void dispose() {

    _email.dispose();
    _password.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    // Responsive Sizes
    double sw =
        MediaQuery.of(context).size.width;

    double sh =
        MediaQuery.of(context).size.height;

    return Scaffold(

      backgroundColor: Colors.white,

      appBar: AppBar(
        title: Text(
          'Login',

          style: TextStyle(
            fontSize: sw * 0.055,
            fontWeight: FontWeight.bold,
          ),
        ),

        centerTitle: true,
      ),

      body: SafeArea(

        child: SingleChildScrollView(

          child: Form(

            key: globalkey,

            child: Padding(

              padding: EdgeInsets.symmetric(
                horizontal: sw * 0.08,
              ),

              child: Column(

                mainAxisAlignment:
                    MainAxisAlignment.center,

                children: [

                  SizedBox(height: sh * 0.12),

                  /// LOGIN TITLE
                  Text(
                    "Welcome Back",

                    style: TextStyle(
                      fontSize: sw * 0.08,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: sh * 0.01),

                  Text(
                    "Login to continue",

                    style: TextStyle(
                      fontSize: sw * 0.04,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: sh * 0.06),

                  /// EMAIL FIELD
                  TextFormField(

                    controller: _email,

                    keyboardType:
                        TextInputType.emailAddress,

                    decoration: InputDecoration(

                      labelText:
                          'Enter your email',

                      labelStyle: TextStyle(
                        fontSize: sw * 0.04,
                      ),

                      filled: true,
                      fillColor:
                          Colors.grey.shade200,

                      contentPadding:
                          EdgeInsets.symmetric(
                        vertical: sh * 0.022,
                        horizontal:
                            sw * 0.04,
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                15),
                      ),

                      enabledBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                15),

                        borderSide:
                            const BorderSide(
                          color: Colors.grey,
                        ),
                      ),

                      focusedBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                15),

                        borderSide:
                            const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),
                    ),

                    validator: (email) {

                      if (email == null ||
                          email.isEmpty) {

                        return 'Enter your email';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: sh * 0.03),

                  /// PASSWORD FIELD
                  TextFormField(

                    controller: _password,

                    obscureText: true,

                    decoration: InputDecoration(

                      labelText:
                          'Enter your password',

                      labelStyle: TextStyle(
                        fontSize: sw * 0.04,
                      ),

                      filled: true,

                      fillColor:
                          Colors.grey.shade200,

                      contentPadding:
                          EdgeInsets.symmetric(
                        vertical: sh * 0.022,
                        horizontal:
                            sw * 0.04,
                      ),

                      border: OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                15),
                      ),

                      enabledBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                15),

                        borderSide:
                            const BorderSide(
                          color: Colors.grey,
                        ),
                      ),

                      focusedBorder:
                          OutlineInputBorder(
                        borderRadius:
                            BorderRadius.circular(
                                15),

                        borderSide:
                            const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),
                      ),

                      suffixIcon: Icon(
                        Icons.visibility_off,
                        size: sw * 0.06,
                      ),
                    ),

                    validator: (password) {

                      if (password == null ||
                          password.isEmpty) {

                        return 'Enter your password';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: sh * 0.045),

                  /// LOGIN BUTTON
                  SizedBox(

                    height: sh * 0.07,
                    width: double.infinity,

                    child: ElevatedButton(

                      style:
                          ElevatedButton.styleFrom(
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  15),
                        ),
                      ),

                      onPressed: () async {

                        if (globalkey
                            .currentState!
                            .validate()) {

                          var email =
                              _email.text.trim();

                          var password =
                              _password.text.trim();

                          try {

                            final User?
                                firebaseUser =

                                (await FirebaseAuth
                                        .instance
                                        .signInWithEmailAndPassword(
                                  email: email,
                                  password:
                                      password,
                                ))
                                    .user;

                            if (firebaseUser !=
                                null) {

                              Get.offAll(
                                () =>
                                    const HomeScreen(),
                              );
                            }

                          } on FirebaseAuthException catch (e) {

                            ScaffoldMessenger.of(
                                    context)
                                .showSnackBar(

                              SnackBar(
                                content: Text(
                                  e.message
                                      .toString(),
                                ),
                              ),
                            );
                          }
                        }
                      },

                      child: Text(
                        'Log-in',

                        style: TextStyle(
                          fontSize:
                              sw * 0.045,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: sh * 0.035),

                  /// FORGOT PASSWORD
                  GestureDetector(

                    onTap: () {},

                    child: Text(
                      'Forgot Password?',

                      style: TextStyle(
                        fontSize:
                            sw * 0.04,

                        color: Colors.blue,
                      ),
                    ),
                  ),

                  SizedBox(height: sh * 0.05),

                  /// SIGNUP BUTTON
                  SizedBox(

                    height: sh * 0.07,
                    width: double.infinity,

                    child: OutlinedButton(

                      style:
                          OutlinedButton.styleFrom(
                        shape:
                            RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(
                                  15),
                        ),
                      ),

                      onPressed: () {

                        Navigator.pushNamed(
                          context,
                          '/signup',
                        );
                      },

                      child: Text(
                        'Sign-up',

                        style: TextStyle(
                          fontSize:
                              sw * 0.045,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: sh * 0.04),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

