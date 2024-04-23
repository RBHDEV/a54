import 'package:flutter/material.dart';
import 'Colors.dart'; // Make sure this import correctly references your colors file

void main() {
  runApp(MaterialApp(
    home: LoginPage(),
  ));
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GlobalKey<FormState> _formKey =
      GlobalKey<FormState>(); // Add a global key for the form
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _phoneNumberController = TextEditingController();
  final TextEditingController _smsController = TextEditingController();
  bool _codeSent = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [daColors.dablack, daColors.dawhite],
          ),
        ),
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Center(
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: Image.asset(
                      "assets/account.png",
                      scale: 4,
                    ),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Bienvenue sur A54',
                    style: TextStyle(
                        wordSpacing: 1,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: daColors.dawhite.withOpacity(0.8)),
                  ),
                  SizedBox(height: 48),
                  _buildTextField(_usernameController, 'Nom d\'utilisateur'),
                  SizedBox(height: 24),
                  _buildTextField(
                      _phoneNumberController, 'Numéro de téléphone'),
                  SizedBox(height: 24),
                  _buildSmsCodeField(),
                  SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                                'Veuillez remplir tous les champs avant de vous connecter.'),
                            backgroundColor: Colors.red,
                          ),
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green.shade500,
                      foregroundColor: daColors.dawhite,
                      padding:
                          EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                      textStyle: TextStyle(fontSize: 16),
                    ),
                    child: Text('Connecter'),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String label) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        labelText: label,
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'S' 'il vous plait entrez votre $label';
        }
        return null;
      },
    );
  }

  Widget _buildSmsCodeField() {
    return TextFormField(
      controller: _smsController,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: 'SMS Code',
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
        suffixIcon: TextButton(
          onPressed: _codeSent
              ? null
              : () {
                  setState(() {
                    _codeSent = true;
                    _smsController.text = ''; // Optionally clear SMS code field
                  });
                  // Implement the logic to send SMS code here
                },
          child: Text(
            _codeSent ? 'Code envoyé' : 'Obtenir le code',
            style: TextStyle(color: _codeSent ? Colors.grey : Colors.blue),
          ),
        ),
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Veuillez entrer votre code SMS';
        }
        return null;
      },
    );
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _phoneNumberController.dispose();
    _smsController.dispose();
    super.dispose();
  }
}
