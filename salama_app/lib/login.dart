import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white, // Set background color to white
        body: Container(
          margin: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(context),
              _inputField(context),
              _forgotPassword(context),
              _signup(context),
            ],
          ),
        ),
      ),
    );
  }

  _header(context) {
    return const Column(
      children: [
        Text(
          "Salama",
          style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black), 
        ),
        Text("Enter your credential to login", style: TextStyle(color: Colors.deepOrange)), // Set text color deeporange
      ],
    );
  }

  _inputField(context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        TextField(
          style: TextStyle(color: Colors.black), // Set text color to black
          decoration: InputDecoration(
              hintText: "Username or Email Address",
              hintStyle: TextStyle(color: Colors.deepOrange), 
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none
              ),
              fillColor: Colors.white.withOpacity(0.3), // Add a touch of white with opacity
              filled: true,
              prefixIcon: const Icon(Icons.person, color: Colors.deepOrange)), 
        ),
        const SizedBox(height: 10),
        TextField(
          style: TextStyle(color: Colors.black), 
          decoration: InputDecoration(
            hintText: "Password",
            hintStyle: TextStyle(color: Colors.deepOrange), 
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none),
            fillColor: Colors.white.withOpacity(0.3), // Add a touch of white with opacity
            filled: true,
            prefixIcon: const Icon(Icons.password, color: Colors.deepOrange),
          ),
          obscureText: true,
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () { 
            Navigator.pushReplacementNamed(context, '/home');
          },
          style: ElevatedButton.styleFrom(
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(vertical: 16),
            backgroundColor: Colors.deepOrange,
          ),
          child: const Text(
            "Login",
            style: TextStyle(fontSize: 20, color: Colors.black),
          ),
        )
      ],
    );
  }

  _forgotPassword(context) {
    return TextButton(
      onPressed: () {},
      child: const Text("Forgot password?",
        style: TextStyle(color: Colors.deepOrange),
      ),
    );
  }

  _signup(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text("Dont have an account? ", style: TextStyle(color: Colors.black)), // Set text color to white
        TextButton(
            onPressed: () {
              Navigator.pushReplacementNamed(context, '/signup');
            },
            child: const Text("Sign Up", style: TextStyle(color: Colors.deepOrange),)
        )
      ],
    );
  }
}
