import 'package:final_project/screens/pages/bottomnav.dart';
import 'package:final_project/screens/resgister/useregister.dart';
import 'package:final_project/widgets/widget_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserLogin extends StatefulWidget {
  const UserLogin({super.key});

  @override
  State<UserLogin> createState() => _UserLoginState();
}

class _UserLoginState extends State<UserLogin> {
  String email = "", password = "";
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  login(context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const BottomNav()));
    } on FirebaseException catch (e) {
      if (e.code == "user-not-found") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            "User not found ",
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.amber,
        ));
      } else if (e.code == "wrong-password") {
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text(
            'Wrong password provided by user',
            style: TextStyle(fontSize: 20),
          ),
          backgroundColor: Colors.amber,
        ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      // ignore: avoid_unnecessary_containers
      child: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [Color(0xFFff5c30), Color(0xFFe74b1a)])),
            ),
            Container(
              margin:
                  EdgeInsets.only(top: MediaQuery.of(context).size.height / 3),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40))),
              child: const Text(''),
            ),
            Container(
              // alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 15.0, left: 20.0, right: 20.0),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/mainlogo.png",
                    width: MediaQuery.of(context).size.width / 2,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    height: 14.0,
                  ),
                  Material(
                    elevation: 8.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                        padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                        height: MediaQuery.of(context).size.height / 2,
                        width: MediaQuery.of(context).size.width,
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          color: Colors.white,
                        ),
                        child: Form(
                          key: _formkey,
                          child: Column(
                            children: [
                              const SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Login',
                                style: AppWidget.headLineTextstyle(),
                              ),
                              const SizedBox(
                                height: 30,
                              ),
                              TextFormField(
                                controller: emailController,
                                validator: (value) {
                                  bool validEmail =
                                      emailValidatorRegExp.hasMatch(value!);
                                  if (value.isEmpty) {
                                    return "enter your email";
                                  } else if (!validEmail) {
                                    return "enter valid email";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: 'E-mail',
                                    hintStyle: AppWidget.semiBoldTextstyle(),
                                    prefixIcon:
                                        const Icon(Icons.email_outlined)),
                              ),
                              const SizedBox(
                                height: 40.0,
                              ),
                              TextFormField(
                                controller: passController,
                                obscureText: true,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "please enter your password";
                                  } else if (passController.text.length < 6) {
                                    return "password aleast 6";
                                  } else {
                                    return null;
                                  }
                                },
                                decoration: InputDecoration(
                                    hintText: 'Password',
                                    hintStyle: AppWidget.semiBoldTextstyle(),
                                    prefixIcon:
                                        const Icon(Icons.password_outlined)),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              Container(
                                alignment: Alignment.topRight,
                                child: Text(
                                  'Forget password ?',
                                  style: AppWidget.semiBoldTextstyle(),
                                ),
                              ),
                              const SizedBox(
                                height: 30.0,
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (_formkey.currentState!.validate()) {
                                    setState(() {});
                                    email = emailController.text;
                                    password = passController.text;
                                    login(context);
                                  }
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //       builder: (context) => const BottomNav(),
                                  //     ));
                                },
                                child: Material(
                                  elevation: 5.0,
                                  borderRadius: BorderRadius.circular(20),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 8.0),
                                    width: 200,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffff5722),
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(20))),
                                    child: const Center(
                                      child: Text(
                                        'LOGIN',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18.0,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const UserSignUp(),
                        )),
                    child: Text(
                      "Don't have an account ? Sign up",
                      style: AppWidget.semiBoldTextstyle(),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    ));
  }
}
