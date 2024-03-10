import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hello_aisha1/buttonWidget.dart';
import 'package:hello_aisha1/config.dart';
import 'package:hello_aisha1/home_screen.dart';
import 'package:hello_aisha1/inputTextField.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  signIn(emailAddress, password, context) async {
    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password);
      if (credential.user != null) {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      }
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Aucun utilisateur trouvé pour cet e-mail.'),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(26.0),
          child: ListView(
          
            children: [
              Padding(
                padding: EdgeInsets.all(10),
                child: Image.asset("assets/logo.png", width: 300, height: 300,),
              ),
              SizedBox(height: fullHeight(context) * 0.04),
              InputTextField(
                labelText: "Email",
                controller: emailController,
              ),
              SizedBox(height: fullHeight(context) * 0.04),
              InputTextField(
                labelText: "Password",
                controller: passwordController,
              ),
              SizedBox(height: fullHeight(context) * 0.04),
              ButtonWidget(
                title: 'Se Connect',
                onPressed: () {
                  signIn(
                    emailController.text,
                    passwordController.text,
                    context,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
