import 'package:a54/Home.dart';
import 'package:a54/LoadingPage.dart';
import 'package:a54/LoginPage.dart';
import 'package:a54/Payment.dart';
import 'package:a54/Transfer.dart';
import 'package:a54/contact.dart';
import 'package:a54/local.dart';
import 'package:a54/transactions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const a54());
}

class a54 extends StatelessWidget {
  const a54({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'A54',
      initialRoute: '/LoadingPage',
      routes: {
        '/': (context) => LoginPage(),
        '/home': (context) => Home(),
        '/transactions': (context) => TransactionPage(),
        '/payment': (context) => Payment(),
        '/transfer': (context) => TransferPage(),
        '/LoadingPage': (context) => LoadingPage(),
        '/contact': (context) => ContactsPage(),
        '/local': (context) => local()
      },
    );
  }
}
