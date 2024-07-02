import 'package:a54/Colors.dart';
import 'package:flutter/material.dart';

class local extends StatefulWidget {
  const local({super.key});

  @override
  State<local> createState() => _localState();
}

class _localState extends State<local> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: daColors.dawhite,
      appBar: AppBar(
        title: Text('point de vente portable'),
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
      extendBodyBehindAppBar: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Image.asset(
          "assets/localisation.png",
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
