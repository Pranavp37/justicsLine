import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:final_project/screens/pages/home.dart';
import 'package:final_project/screens/pages/notifica.dart';
import 'package:final_project/screens/pages/profile.dart';
import 'package:final_project/screens/pages/wallet.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int currentTabPage = 0;
  late List<Widget> pages;
  late HomePage home;
  late WalletSreen wallet;
  late NotifiScreen notifi;
  late ProfileScreen profile;

  @override
  void initState() {
    home = const HomePage();
    wallet = const WalletSreen();
    notifi = const NotifiScreen();
    profile = const ProfileScreen();
    pages = [home, wallet, notifi, profile];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CurvedNavigationBar(
        color: Colors.black,
        animationDuration: const Duration(milliseconds: 500),
        backgroundColor: Colors.white,
        height: 65,
        onTap: (int index) {
          setState(() {
            currentTabPage = index;
          });
        },
        items: const [
          Icon(
            Icons.home_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.wallet_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.notifications_outlined,
            color: Colors.white,
          ),
          Icon(
            Icons.person_outline,
            color: Colors.white,
          ),
        ],
      ),
      body: pages[currentTabPage],
    );
  }
}
