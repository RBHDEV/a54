import 'package:flutter/material.dart';
import 'package:a54/Colors.dart'; // Make sure this import is correct and DaColors is accessible

class TransactionPage extends StatefulWidget {
  @override
  _TransactionPageState createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  bool _isBalanceVisible = false;
  String _balance = '****';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: daColors.dawhite,
      appBar: AppBar(
        title: Text('Transactions'),
        centerTitle: true,
        backgroundColor: Colors.grey.shade900,
        foregroundColor: daColors.dawhite,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30))),
        toolbarHeight: 75,
        titleTextStyle: TextStyle(fontSize: 25),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Center(
              child: Image.asset(
                "assets/balance.png",
                scale: 4,
              ),
            ),
            SizedBox(
              height: 80,
            ),
            Column(
              children: [
                Text(
                  'Current Balance:',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  _isBalanceVisible ? '\5,250 DA' : _balance,
                  style: TextStyle(fontSize: 24, color: Colors.blue.shade900),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      _isBalanceVisible = !_isBalanceVisible;
                      _balance = _isBalanceVisible ? '\$5,250' : '****';
                    });
                  },
                  child:
                      Text(_isBalanceVisible ? 'Hide Balance' : 'View Balance'),
                ),
              ],
            ),
            SizedBox(height: 30),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/payment');
              },
              icon: Icon(Icons.payment),
              label: Text('Payment'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                minimumSize: Size(180, 50),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.pushNamed(context, '/transfer');
              },
              icon: Icon(Icons.transfer_within_a_station),
              label: Text('Transfer'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade900,
                foregroundColor: Colors.white,
                surfaceTintColor: Colors.white,
                minimumSize: Size(180, 50),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
