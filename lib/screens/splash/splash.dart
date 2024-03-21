import 'package:final_project/screens/pages/bottomnav.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    gotoLogin();
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: LottieBuilder.network(
                'https://lottie.host/0d312f2a-f0cb-4009-ac3a-bc9be55abfcc/FqUd34Lyec.json'),
          ),
        ]),
      ),
    );
  }

  Future gotoLogin() async {
    await Future.delayed(const Duration(seconds: 5));
    // ignore: use_build_context_synchronously
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (BuildContext context) => const BottomNav(),
        ));
  }
}
