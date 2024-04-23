import 'package:final_project/screens/resgister/userlogin.dart';
import 'package:final_project/widgets/widget_data.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
  String email = "", password = "", name = "";
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  final _formkey = GlobalKey<FormState>();

  register(context) async {
    // ignore: unnecessary_null_comparison
    if (password != null) {
      try {
        // ignore: unused_local_variable
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            backgroundColor: Colors.green,
            content: Text(
              "Registered Successfully",
              style: TextStyle(fontSize: 20.0),
            )));
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const UserLogin(),
            ));
      } on FirebaseAuthException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              backgroundColor: Colors.amber,
              content: Text(
                "password provided is too weak",
                style: TextStyle(fontSize: 20.0),
              )));
        } else if (e.code == "email-already-in-use") {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
              content: Text(
            'Account alreadt exists',
            style: TextStyle(fontSize: 20),
          )));
        }
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
                        child: SingleChildScrollView(
                          child: Form(
                            key: _formkey,
                            child: Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                Text(
                                  'Sign up',
                                  style: AppWidget.headLineTextstyle(),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "enter your name";
                                    } else if (nameController.text.length < 3) {
                                      return "name aleast 3";
                                    }
                                    return null;
                                  },
                                  controller: nameController,
                                  decoration: InputDecoration(
                                      hintText: 'Name',
                                      hintStyle: AppWidget.semiBoldTextstyle(),
                                      prefixIcon: const Icon(Icons.person)),
                                ),
                                const SizedBox(
                                  height: 40.0,
                                ),
                                TextFormField(
                                  validator: (value) {
                                    bool validEmail =
                                        emailValidatorRegExp.hasMatch(value!);
                                    if (value.isEmpty) {
                                      return "enter your email";
                                    } else if (!validEmail) {
                                      return "enter valid email";
                                    }
                                    return null;
                                  },
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: 'E-mail',
                                      hintStyle: AppWidget.semiBoldTextstyle(),
                                      prefixIcon:
                                          const Icon(Icons.email_outlined)),
                                ),
                                const SizedBox(
                                  height: 15.0,
                                ),
                                TextFormField(
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
                                  controller: passController,
                                  decoration: InputDecoration(
                                      hintText: 'Password',
                                      hintStyle: AppWidget.semiBoldTextstyle(),
                                      prefixIcon:
                                          const Icon(Icons.password_outlined)),
                                ),
                                const SizedBox(
                                  height: 50.0,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    if (_formkey.currentState!.validate()) {
                                      setState(() {});
                                      name = nameController.text;
                                      email = emailController.text;
                                      password = passController.text;
                                    }
                                    register(context);
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
                                          'SIGN UP',
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
                          builder: (context) => const UserLogin(),
                        )),
                    child: Text(
                      "Already have an account ? Login",
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
