import 'package:a54/Colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late List<Map<String, dynamic>> _services;

  @override
  void initState() {
    super.initState();
    _services = [
      {
        'title': 'Transactions',
        'icon': Icons.monetization_on,
        'onTap': () => Navigator.pushNamed(context, '/transactions'),
      },
      {
        'title': 'Trouver un point de vente portable',
        'icon': Icons.store_mall_directory,
        'onTap': () => print('Find a Portable Point of Sale tapped'),
      },
      {
        'title': 'Nous contact',
        'icon': Icons.contact_mail,
        'onTap': () => print('Contact Us tapped'),
      },
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: daColors.dawhite,
        appBar: AppBar(
          title: Text('Services'),
          centerTitle: true,
          backgroundColor: Colors.grey.shade900,
          foregroundColor: daColors.dawhite,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30))),
          toolbarHeight: 75,
          titleTextStyle: TextStyle(fontSize: 25, color: daColors.dawhite),
        ),
        body: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(width: 2, color: daColors.dablack)),
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(
                  Icons.monetization_on,
                  size: 35,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                title: Text(
                  'Transactions',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () => Navigator.pushNamed(context, '/transactions'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(width: 2, color: daColors.dablack)),
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(
                  Icons.store_mall_directory,
                  size: 35,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                title: Text(
                  'Trouver un point de vente portable',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/local');
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 40),
              decoration: BoxDecoration(
                  border: Border.fromBorderSide(
                      BorderSide(width: 2, color: daColors.dablack)),
                  borderRadius: BorderRadius.circular(20)),
              child: ListTile(
                leading: Icon(
                  Icons.contact_mail,
                  size: 35,
                ),
                contentPadding:
                    EdgeInsets.symmetric(horizontal: 40, vertical: 40),
                title: Text(
                  'Nous contact',
                  style: TextStyle(fontSize: 20),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/contact');
                },
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Center(
              child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      minimumSize: Size(200, 60),
                      backgroundColor: Colors.red.shade900,
                      foregroundColor: daColors.dawhite),
                  onPressed: () {
                    Navigator.pushReplacementNamed(context, '/');
                  },
                  child: Text(
                    'Déconnecte',
                    style: TextStyle(fontSize: 18),
                  )),
            )
          ],
        ));
  }
}
