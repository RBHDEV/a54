import 'package:a54/Colors.dart';
import 'package:flutter/material.dart';

class ContactsPage extends StatelessWidget {
  void _showSnackBar(Color color, BuildContext context, String message) {
    final snackBar = SnackBar(
      backgroundColor: color,
      content: Text(message),
      duration: Duration(seconds: 3), // Personnalisez la durée si nécessaire
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  TextEditingController _messageController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: daColors.dawhite,
      appBar: AppBar(
        title: Text('Contact'),
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
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: TextField(
                controller: _messageController,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Entrez votre message...',
                  border: OutlineInputBorder(borderSide: BorderSide.none),
                ),
              ),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                if (_messageController.text.isEmpty) {
                  _showSnackBar(Colors.grey.shade700, context,
                      'Veuillez remplir votre message');
                } else {
                  _showSnackBar(
                      Colors.deepPurple.shade700, context, 'Message envoyé !');
                  Navigator.pop(context);
                }
              },
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}
