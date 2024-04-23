import 'package:final_project/widgets/widget_data.dart';
import 'package:flutter/material.dart';

class WalletSreen extends StatefulWidget {
  const WalletSreen({super.key});

  @override
  State<WalletSreen> createState() => _WalletSreenState();
}

class _WalletSreenState extends State<WalletSreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          margin: const EdgeInsets.only(top: 60.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Material(
                elevation: 1.0,
                child: Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Center(
                    child: Text(
                      'Wallet',
                      style: AppWidget.headLineTextstyle(),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
                width: MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(color: Color(0xFFF2F2F2)),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/wallet.png",
                      height: 60.0,
                      width: 60.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(
                      width: 40.0,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Your Wallet ',
                          style: AppWidget.lightTextstyle(),
                        ),
                        Text(
                          // ignore: prefer_adjacent_string_concatenation
                          '\$' + '100',
                          style: AppWidget.semiBoldTextstyle(),
                        )
                      ],
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Text(
                  'Add Money',
                  style: AppWidget.semiBoldTextstyle(),
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xFFE9E2E2))),
                    child: Text(
                      // ignore: prefer_adjacent_string_concatenation
                      '\$' + '100',
                      style: AppWidget.secondBoldTextStyle(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xFFE9E2E2))),
                    child: Text(
                      // ignore: prefer_adjacent_string_concatenation
                      '\$' + '500',
                      style: AppWidget.secondBoldTextStyle(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xFFE9E2E2))),
                    child: Text(
                      // ignore: prefer_adjacent_string_concatenation
                      '\$' + '1000',
                      style: AppWidget.secondBoldTextStyle(),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xFFE9E2E2))),
                    child: Text(
                      // ignore: prefer_adjacent_string_concatenation
                      '\$' + '2000',
                      style: AppWidget.secondBoldTextStyle(),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40.0,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 20.0),
                padding: const EdgeInsets.symmetric(vertical: 12.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: const Color(0xFF008080),
                    borderRadius: BorderRadius.circular(8)),
                child: const Center(
                  child: Text(
                    'Add Money',
                    style: TextStyle(
                        fontSize: 19.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        fontFamily: 'Poppins'),
                  ),
                ),
              )
            ],
          )),
    );
  }
}
