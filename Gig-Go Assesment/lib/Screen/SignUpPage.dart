import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
import 'package:gig_go_assesment/Service/SignUpService.dart';

class Signuppage extends StatefulWidget {
  const Signuppage({super.key});

  @override
  State<Signuppage> createState() =>
      _SignuppageState();
}

class _SignuppageState
    extends State<Signuppage> {

  // Global Key
  final globalkey =
      GlobalKey<FormState>();

  // Controllers
  TextEditingController _name =
      TextEditingController();

  TextEditingController _email =
      TextEditingController();

  TextEditingController _password =
      TextEditingController();

  @override
  void dispose() {

    _name.dispose();
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

      appBar: AppBar(

        title: Text(
          'Sign-Up',

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

                  SizedBox(height: sh * 0.08),

                  /// TITLE
                  Text(
                    "Create Account",

                    style: TextStyle(
                      fontSize: sw * 0.08,
                      fontWeight:
                          FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: sh * 0.01),

                  Text(
                    "Sign up to continue",

                    style: TextStyle(
                      fontSize: sw * 0.04,
                      color: Colors.grey,
                    ),
                  ),

                  SizedBox(height: sh * 0.06),

                  /// NAME FIELD
                  TextFormField(

                    controller: _name,

                    decoration: InputDecoration(

                      labelText:
                          'Enter your name',

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

                      enabledBorder:
                          OutlineInputBorder(

                        borderSide:
                            const BorderSide(
                          color: Colors.grey,
                        ),

                        borderRadius:
                            BorderRadius.circular(
                                15),
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

                    validator: (name) {

                      if (name == null ||
                          name.isEmpty) {

                        return
                            'Enter your name';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: sh * 0.03),

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

                      fillColor:
                          Colors.grey.shade200,

                      filled: true,

                      contentPadding:
                          EdgeInsets.symmetric(
                        vertical: sh * 0.022,
                        horizontal:
                            sw * 0.04,
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

                        borderSide:
                            const BorderSide(
                          color: Colors.blue,
                          width: 2,
                        ),

                        borderRadius:
                            BorderRadius.circular(
                                15),
                      ),
                    ),

                    validator: (email) {

                      if (email == null ||
                          email.isEmpty) {

                        return
                            'Enter your email';
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

                        return
                            'Enter your password';
                      }

                      return null;
                    },
                  ),

                  SizedBox(height: sh * 0.05),

                  /// SIGNUP BUTTON
                  SizedBox(

                    height: sh * 0.07,
                    width: double.infinity,

                    child: ElevatedButton(

                      style:
                          ElevatedButton.styleFrom(

                        backgroundColor:
                            Colors.lightBlue[300],

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

                          var name =
                              _name.text.trim();

                          var email =
                              _email.text.trim();

                          var password =
                              _password.text.trim();

                          try {

                            await FirebaseAuth
                                .instance
                                .createUserWithEmailAndPassword(

                              email: email,
                              password: password,
                            );

                            await signupuser(
                              context,
                              name,
                              email,
                            );

                            print(
                              'Account created successfully',
                            );

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

                        'Sign-Up',

                        style: TextStyle(
                          color: Colors.white,
                          fontSize:
                              sw * 0.045,
                        ),
                      ),
                    ),
                  ),

                  SizedBox(height: sh * 0.03),

                  /// LOGIN TEXT
                  GestureDetector(

                    onTap: () {

                      Navigator.pushNamed(
                        context,
                        '/login',
                      );
                    },

                    child: Text(

                      'Already have an account? Login',

                      style: TextStyle(
                        fontSize:
                            sw * 0.04,

                        color: Colors.blue,
                        fontWeight:
                            FontWeight.w500,
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

