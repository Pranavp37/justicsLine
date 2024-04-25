import 'dart:convert';

import 'package:final_project/widgets/app_constant.dart';
import 'package:final_project/widgets/widget_data.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:http/http.dart' as http;

class WalletSreen extends StatefulWidget {
  const WalletSreen({super.key});

  @override
  State<WalletSreen> createState() => _WalletSreenState();
}

class _WalletSreenState extends State<WalletSreen> {
  Map<String, dynamic>? paymentIntent;
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
                  GestureDetector(
                    onTap: () {
                      // makePayment('100');
                    },
                    child: Container(
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

  // Future<void> makePayment(String amount) async {
  //   try {
  //     paymentIntent = await createPaymentIntent(amount, 'INR');
  //     //Payment Sheet
  //     await Stripe.instance
  //         .initPaymentSheet(
  //             paymentSheetParameters: SetupPaymentSheetParameters(
  //                 paymentIntentClientSecret: paymentIntent!['client_secret'],
  //                 // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
  //                 // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
  //                 style: ThemeMode.dark,
  //                 merchantDisplayName: 'Adnan'))
  //         .then((value) {});

  //     ///now finally display payment sheeet
  //     displayPaymentSheet(amount);
  //   } catch (e, s) {
  //     // ignore: avoid_print
  //     print('exception:$e$s');
  //   }
  // }

  // displayPaymentSheet(String amount) async {
  //   try {
  //     await Stripe.instance.presentPaymentSheet().then((value) async {
  //       // ignore: use_build_context_synchronously
  //       showDialog(
  //           context: context,
  //           builder: (_) => const AlertDialog(
  //                 content: Column(
  //                   mainAxisSize: MainAxisSize.min,
  //                   children: [
  //                     Row(
  //                       children: [
  //                         Icon(
  //                           Icons.check_circle,
  //                           color: Colors.green,
  //                         ),
  //                         Text("Payment Successfull"),
  //                       ],
  //                     ),
  //                   ],
  //                 ),
  //               ));
  //       // await getthesharedpref();
  //       // ignore: use_build_context_synchronously

  //       paymentIntent = null;
  //     }).onError((error, stackTrace) {
  //       // ignore: avoid_print
  //       print('Error is:--->$error $stackTrace');
  //     });
  //   } on StripeException catch (e) {
  //     // ignore: avoid_print
  //     print('Error is:---> $e');
  //     // ignore: use_build_context_synchronously
  //     showDialog(
  //         context: context,
  //         builder: (_) => const AlertDialog(
  //               content: Text("Cancelled "),
  //             ));
  //   } catch (e) {
  //     // ignore: avoid_print
  //     print('$e');
  //   }
  // }

  // createPaymentIntent(String amount, String currency) async {
  //   try {
  //     Map<String, dynamic> body = {
  //       'amount': calculateAmount(amount),
  //       'currency': currency,
  //       'payment_method_types[]': 'card'
  //     };
  //     var response = await http.post(
  //       Uri.parse('https://api.stripe.com/v1/payment_intents'),
  //       headers: {
  //         'Authorization': 'Bearer $secretKey',
  //         'Content-Type': 'application/x-www-form-urlencoded'
  //       },
  //       body: body,
  //     );
  //     // ignore: avoid_print
  //     print('Payment Intent Body->>> ${response.body.toString()}');
  //     return jsonDecode(response.body);
  //   } catch (err) {
  //     // ignore: avoid_print
  //     print('err charging user: ${err.toString()}');
  //   }
  // }

  // calculateAmount(String amount) {
  //   final calculatedAmout = (int.parse(amount)) * 100;

  //   return calculatedAmout.toString();
  // }
}
