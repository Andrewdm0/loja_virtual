import 'package:flutter/material.dart';
import 'package:loja_virtual/screens/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Entrar'),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => SignupScreen()));
            },
            child: Text(
              'CRIAR CONTA',
              style: TextStyle(
                fontSize: 15.0,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
      body: Form(
        key: _formKey,
        child: ListView(
          padding: EdgeInsets.all(16),
          children: [
            TextFormField(
              validator: (text) {
                if (text!.isEmpty || !text.contains("@"))
                  return "E-mail inválido";
              },
              decoration: InputDecoration(hintText: "E-mail"),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              validator: (text) {
                if (text!.isEmpty || text.length < 6) return "Senha inválida";
              },
              decoration: InputDecoration(hintText: "Senha"),
              obscureText: true,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton(
                onPressed: () {},
                child: Text(
                  'Esqueci minha senha',
                  textAlign: TextAlign.right,
                ),
              ),
            ),
            SizedBox(height: 16),
            SizedBox(
              height: 44,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Theme.of(context).primaryColor),
                onPressed: () {
                  if (_formKey.currentState!.validate()) {}
                },
                child: Text(
                  "Entrar",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
