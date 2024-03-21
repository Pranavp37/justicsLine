import 'package:final_project/screens/pages/home.dart';
import 'package:final_project/widgets/widget_data.dart';
import 'package:flutter/material.dart';

class UserSignUp extends StatefulWidget {
  const UserSignUp({super.key});

  @override
  State<UserSignUp> createState() => _UserSignUpState();
}

class _UserSignUpState extends State<UserSignUp> {
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
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Name',
                                  hintStyle: AppWidget.semiBoldTextstyle(),
                                  prefixIcon: const Icon(Icons.person)),
                            ),
                            const SizedBox(
                              height: 40.0,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'E-mail',
                                  hintStyle: AppWidget.semiBoldTextstyle(),
                                  prefixIcon: const Icon(Icons.email_outlined)),
                            ),
                            const SizedBox(
                              height: 30.0,
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidget.semiBoldTextstyle(),
                                  prefixIcon:
                                      const Icon(Icons.password_outlined)),
                            ),
                            const SizedBox(
                              height: 50.0,
                            ),
                            Material(
                              elevation: 5.0,
                              borderRadius: BorderRadius.circular(20),
                              child: Container(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                width: 200,
                                decoration: const BoxDecoration(
                                    color: Color(0xffff5722),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20))),
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
                          ],
                        )),
                  ),
                  const SizedBox(
                    height: 30.0,
                  ),
                  GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const HomePage(),
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
