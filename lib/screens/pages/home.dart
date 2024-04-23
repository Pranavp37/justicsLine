import 'package:final_project/screens/pages/details.dart';
import 'package:final_project/widgets/widget_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool family = false, criminal = false, real = false, divorce = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              const Text(
                'Justice',
                style: TextStyle(
                    color: Color(0XFF01579B),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(
                width: 8.0,
              ),
              const Text(
                'Line',
                style: TextStyle(
                    color: Color(0xffff5722),
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins'),
              ),
              const SizedBox(
                width: 170.0,
              ),
              Container(
                alignment: Alignment.center,
                child: const Icon(
                  Icons.notifications_active_outlined,
                  size: 30.0,
                ),
              )
            ],
          ),
          const SizedBox(
            height: 30.0,
          ),
          Text(
            'Find a lawyer',
            style: AppWidget.mainHeadings(),
          ),
          const SizedBox(
            height: 20.0,
          ),
          showitems(),
          const SizedBox(
            height: 25.0,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const DetailsScreen(),
                      )),
                  child: Container(
                    margin: const EdgeInsets.all(7.0),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        decoration: const BoxDecoration(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Column(
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset(
                              "assets/images/salih.jpg",
                              width: 150,
                              height: 150,
                              fit: BoxFit.cover,
                            ),
                            Text(
                              "Muhammed Salih",
                              style: AppWidget.semiBoldTextstyle(),
                            ),
                            Text(
                              "Thathamapally,Alappuzha",
                              style: AppWidget.lightTextstyle(),
                            ),
                            const SizedBox(
                              height: 5.0,
                            ),
                            Text(
                              "\$20/min",
                              style: AppWidget.semiBoldTextstyle(),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Container(
                  margin: const EdgeInsets.all(4),
                  child: Material(
                    elevation: 5.0,
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(20))),
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            "assets/images/raphy.jpg",
                            width: 150,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          Text(
                            "Raphy Raj",
                            style: AppWidget.semiBoldTextstyle(),
                          ),
                          Text(
                            "Mavelikkara,Alapuzha",
                            style: AppWidget.lightTextstyle(),
                          ),
                          const SizedBox(
                            height: 5.0,
                          ),
                          Text(
                            "\$19/min",
                            style: AppWidget.semiBoldTextstyle(),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 30.0,
          ),
          Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(20),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/salih.jpg",
                    height: 120,
                    width: 120,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(
                    width: 20.0,
                  ),
                  Column(
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          'Muhsmmed Salih',
                          style: AppWidget.semiBoldTextstyle(),
                        ),
                      ),
                      const SizedBox(height: 3.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          'Tathamapally,Alappuzha',
                          style: AppWidget.lightTextstyle(),
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          '\$20/min',
                          style: AppWidget.semiBoldTextstyle(),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }

  Widget showitems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              family = true;
              divorce = false;
              criminal = false;
              real = false;
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: 130.0,
              decoration: BoxDecoration(
                  color: family ? Colors.grey[500] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Family Law',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              family = false;
              divorce = false;
              criminal = true;
              real = false;
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: 130.0,
              decoration: BoxDecoration(
                  color: criminal ? Colors.grey[500] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Criminal Law',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              family = false;
              divorce = false;
              criminal = false;
              real = true;
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: 130.0,
              decoration: BoxDecoration(
                  color: real ? Colors.grey[500] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Real Estate',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            width: 10.0,
          ),
          GestureDetector(
            onTap: () {
              family = false;
              divorce = true;
              criminal = false;
              real = false;
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: 130.0,
              decoration: BoxDecoration(
                  color: divorce ? Colors.grey[500] : Colors.grey[00],
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Divorce Law',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
