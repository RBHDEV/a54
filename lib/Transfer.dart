import 'package:a54/Colors.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  @override
  _TransferPageState createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _ripController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: daColors.dawhite,
      appBar: AppBar(
        title: Text('Transfer'),
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
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: 40,
              ),
              Center(
                child: Image.asset(
                  "assets/transfer.png",
                  scale: 4,
                ),
              ),
              SizedBox(
                height: 80,
              ),
              TextFormField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'Nom du Recevoir ',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le Nom du Recevoir';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                controller: _ripController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  labelText: 'RIP (Numéro de banque)',
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Veuillez entrer le  (Bank Number)';
                  }
                  return null;
                },
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: _performTransfer,
                child: Text('Transfer'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.white,
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _performTransfer() {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('transféré avec succès !'),
          backgroundColor: Colors.green,
          duration: Duration(seconds: 2),
        ),
      );

      Navigator.pop(context);
    } else {
      // If the form is not valid, show a different snackbar message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Veuillez remplir toutes les informations avant de transférer.'),
          backgroundColor: Colors.red, // Red to indicate an error or reminder
          duration: Duration(seconds: 3),
        ),
      );
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _ripController.dispose();
    super.dispose();
  }
}
