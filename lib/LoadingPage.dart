import 'package:flutter/material.dart';
import 'package:a54/Colors.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  Future<void> showAnimationAndPush() async {
    await Future.delayed(
        const Duration(seconds: 5)); // Attente courte pour montrer l'animation

    Navigator.pushReplacementNamed(context, '/');
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      showAnimationAndPush(); // Appel de cette méthode avec un délai pour interagir en toute sécurité avec Provider
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: daColors.dawhite,
      body: Center(
          child: Image.asset(
        "assets/firstlaunch.png",
        fit: BoxFit.cover,
      )),
    );
  }
}
