import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:final_project/screens/pages/details.dart';
import 'package:final_project/service/database.dart';
import 'package:final_project/widgets/widget_data.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool family = false, criminal = false, real = false, divorce = false;
  Stream? lawyerstresm;

  get ontheload async {
    lawyerstresm = await DatabaseMethods().getLawyers('Family Law');
    setState(() {});
  }

  @override
  void initState() {
    ontheload;
    super.initState();
  }

  Widget allIttemsverticaly() {
    return StreamBuilder(
        stream: lawyerstresm,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                        onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  DetailsScreen(detail: ds['Detail'],image: ds['Image'],name: ds['Name'],price: ds['Price']),
                            )),
                        child: Container(
                          margin: const EdgeInsets.only(top: 20.0, bottom: 3.0),
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                // crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ClipRRect(
                                    borderRadius: BorderRadius.circular(20),
                                    child: Image.network(
                                      ds['Image'],
                                      height: 120,
                                      width: 120,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  const SizedBox(
                                    width: 20.0,
                                  ),
                                  Column(
                                    children: [
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          ds['Name'],
                                          style: AppWidget.semiBoldTextstyle(),
                                        ),
                                      ),
                                      const SizedBox(height: 3.0),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          'Tathamapally,Alappuzha',
                                          style: AppWidget.lightTextstyle(),
                                        ),
                                      ),
                                      const SizedBox(height: 5.0),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                2,
                                        child: Text(
                                          // ignore: prefer_interpolation_to_compose_strings
                                          '\$' + ds['Price'],
                                          style: AppWidget.semiBoldTextstyle(),
                                        ),
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ));
                  })
              : const CircularProgressIndicator();
        });
  }

  Widget allIttems() {
    return StreamBuilder(
        stream: lawyerstresm,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>  DetailsScreen(detail: ds['Detail'],image: ds['Image'],name: ds['Name'],price: ds['Price']),
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
                                ClipRRect(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(20)),
                                  child: Image.network(
                                    ds['Image'],
                                    width: 150,
                                    height: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                Text(
                                  ds['Name'],
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
                                  // ignore: prefer_interpolation_to_compose_strings
                                  "\$" + ds['Price'],
                                  style: AppWidget.semiBoldTextstyle(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : const CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      margin: const EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
      child: SingleChildScrollView(
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
            // ignore: sized_box_for_whitespace
            Container(
              height: 270,
              child: allIttems(),
            ),
            allIttemsverticaly(),
          ],
        ),
      ),
    ));
  }

  Widget showitems() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          GestureDetector(
            onTap: () async {
              family = true;
              divorce = false;
              criminal = false;
              real = false;
              lawyerstresm = await DatabaseMethods().getLawyers('Family Law');
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
            onTap: () async {
              family = false;
              divorce = false;
              criminal = true;
              real = false;
              lawyerstresm = await DatabaseMethods().getLawyers('Criminal Law');
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
            onTap: () async {
              family = false;
              divorce = false;
              criminal = false;
              real = true;
              lawyerstresm = await DatabaseMethods().getLawyers('Real Estate');
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
            onTap: () async {
              family = false;
              divorce = true;
              criminal = false;
              real = false;
              lawyerstresm = await DatabaseMethods().getLawyers('Labor Law');
              setState(() {});
            },
            child: Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              width: 130.0,
              decoration: BoxDecoration(
                  color: divorce ? Colors.grey[500] : Colors.grey[200],
                  borderRadius: BorderRadius.circular(20)),
              child: const Text(
                'Labor Law',
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
