import 'package:final_project/widgets/widget_data.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class DetailsScreen extends StatefulWidget {
  String image, name, detail, price;
  DetailsScreen(
      {super.key,
      required this.detail,
      required this.image,
      required this.name,
      required this.price});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  int a = 1, total = 0;
  @override
  void initState() {
    total = int.parse(widget.price);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 15.0,
            ),
            Image.network(
              widget.image,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 3,
              fit: BoxFit.fill,
            ),
            const SizedBox(
              height: 15.0,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Text(
                      widget.name,
                      style: AppWidget.headLineTextstyle(),
                    ),
                    Text(
                      'Thathamapally,Alappuzha',
                      style: AppWidget.lightTextstyle(),
                    ),
                  ],
                ),
                const Spacer(),
                GestureDetector(
                  onTap: () {
                    if (a >= 2) {
                      total = total - int.parse(widget.price);
                      --a;
                    }

                    setState(() {});
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                Text(
                  a.toString(),
                  style: AppWidget.semiBoldTextstyle(),
                ),
                const SizedBox(
                  width: 20.0,
                ),
                GestureDetector(
                  onTap: () {
                    if (a <= 29) {
                      total = total + int.parse(widget.price);
                      ++a;
                    }

                    setState(() {});
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.all(Radius.circular(8))),
                    child: const Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 25.0,
            ),
            Text(
              widget.detail,
              style: AppWidget.lightBoldTextstyle(),
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Total Price',
                        style: AppWidget.secondBoldTextStyle(),
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        '\$' + total.toString(),
                        style: AppWidget.secondBoldTextStyle(),
                      ),
                    ],
                  ),
                  Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      alignment: Alignment.center,
                      height: 55.0,
                      width: 170.0,
                      decoration: BoxDecoration(
                          // border: Border.all(width: 1, color: Colors.black),
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.green),
                      child: const Padding(
                        padding: EdgeInsets.all(12.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.call,
                              color: Colors.white,
                              size: 35,
                            ),
                            SizedBox(
                              width: 8.0,
                            ),
                            Text(
                              'Call Now',
                              style: TextStyle(
                                fontSize: 20.0,
                                fontFamily: 'Poppins',
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
