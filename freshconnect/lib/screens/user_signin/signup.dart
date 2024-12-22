// import 'package:flutter/material.dart';
// import 'login.dart'; // Import Login page

// class SignupPage extends StatefulWidget {
//   const SignupPage({Key? key}) : super(key: key);

//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Sign Up',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: const Color.fromARGB(255, 26, 62, 27),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Create an Account!',
//               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Color.fromARGB(255, 26, 62, 27)),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 30),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: confirmPasswordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Confirm Password',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 26, 62, 27),
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//               ),
//               onPressed: () {
//                 // Handle sign-up logic
//                 Navigator.pushReplacement(
//                   context,
//                   MaterialPageRoute(builder: (context) => const LoginPage(role: 'Farmer')), // Replace with the appropriate role
//                 );
//               },
             
//               child: const Text(
//                 'Sign Up',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Already have an account? "),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate to login page
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const LoginPage(role: 'Farmer')), // Replace with appropriate role
//                     );
//                   },
//                   child: const Text(
//                     'Login here',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 26, 62, 27),
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// import 'package:flutter/material.dart';
// import 'package:fresh_connect_sih/screens/auth_service.dart';
// import 'dart:developer'; // For logging

// import 'login.dart';

// class SignupPage extends StatefulWidget {
//   const SignupPage({Key? key}) : super(key: key);

//   @override
//   _SignupPageState createState() => _SignupPageState();
// }

// class _SignupPageState extends State<SignupPage> {
//   final  _auth = AuthService();
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();
//   final TextEditingController confirmPasswordController = TextEditingController();
//   String? _errorMessage;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Sign Up',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: const Color.fromARGB(255, 26, 62, 27),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Create an Account!',
//               style: TextStyle(
//                 fontSize: 28,
//                 fontWeight: FontWeight.bold,
//                 color: Color.fromARGB(255, 26, 62, 27),
//               ),
//               textAlign: TextAlign.center,
//             ),
//             const SizedBox(height: 30),
//             if (_errorMessage != null)
//               Text(
//                 _errorMessage!,
//                 style: const TextStyle(color: Colors.red),
//                 textAlign: TextAlign.center,
//               ),
//             const SizedBox(height: 10),
//             TextField(
//               controller: emailController,
//               decoration: const InputDecoration(
//                 labelText: 'Email',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.email),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: passwordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Password',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             const SizedBox(height: 20),
//             TextField(
//               controller: confirmPasswordController,
//               obscureText: true,
//               decoration: const InputDecoration(
//                 labelText: 'Confirm Password',
//                 border: OutlineInputBorder(),
//                 prefixIcon: Icon(Icons.lock),
//               ),
//             ),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color.fromARGB(255, 26, 62, 27),
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//               ),
//               onPressed: () {
//                 if (emailController.text.isEmpty ||
//                     passwordController.text.isEmpty ||
//                     confirmPasswordController.text.isEmpty) {
//                   setState(() {
//                     _errorMessage = "Please fill in all fields.";
//                   });
//                 } else if (passwordController.text != confirmPasswordController.text) {
//                   setState(() {
//                     _errorMessage = "Passwords do not match.";
//                   });
//                 } else {
//                   _signup();
//                 }
//               },
//               child: const Text(
//                 'Sign Up',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Already have an account? "),
//                 GestureDetector(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(builder: (context) => const LoginPage(role: 'Farmer')), // Replace with appropriate role
//                     );
//                   },
//                   child: const Text(
//                     'Login here',
//                     style: TextStyle(
//                       color: Color.fromARGB(255, 26, 62, 27),
//                       fontWeight: FontWeight.bold,
//                       decoration: TextDecoration.underline,
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   // Sign-up function with Firebase authentication
//   Future<void> _signup() async {
//     try {
//       final user = await _auth.createUserWithEmailAndPassword(
//         emailController.text.trim(),
//         passwordController.text.trim(),
//       );

//       if (user != null) {
//         log("User created successfully: ${user.email}");
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(builder: (context) => const LoginPage(role: 'Farmer')), // Navigate to login page
//         );
//       }
//     } catch (e) {
//       log("Error during sign-up: $e");
//       setState(() {
//         _errorMessage = "Sign-up failed: $e";
//       });
//     }
//   }
// }
import 'package:flutter/material.dart';
import 'package:freshconnect/screens/auth_service.dart';
import 'login.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  String selectedRole = 'Farmer'; // Default role
  String? _errorMessage;

  final List<String> roles = ['Farmer', 'Consumer', 'Community Member', 'Vendor','Plant Control'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Sign Up',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'Create an Account!',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 26, 62, 27),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              if (_errorMessage != null)
                Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              const SizedBox(height: 10),
              TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: confirmPasswordController,
                obscureText: true,
                decoration: const InputDecoration(
                  labelText: 'Confirm Password',
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock),
                ),
              ),
              const SizedBox(height: 20),
              DropdownButtonFormField<String>(
                value: selectedRole,
                decoration: const InputDecoration(
                  labelText: 'Select Role',
                  border: OutlineInputBorder(),
                ),
                items: roles.map((role) {
                  return DropdownMenuItem(
                    value: role,
                    child: Text(role),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedRole = value!;
                  });
                },
              ),
              const SizedBox(height: 30),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 26, 62, 27),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: _signup,
                child: const Text(
                  'Sign Up',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Already have an account? "),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const LoginPage(role: 'Farmer')),
                      );
                    },
                    child: const Text(
                      'Login here',
                      style: TextStyle(
                        color: Color.fromARGB(255, 26, 62, 27),
                        fontWeight: FontWeight.bold,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _signup() async {
    if (passwordController.text != confirmPasswordController.text) {
      setState(() {
        _errorMessage = "Passwords do not match.";
      });
      return;
    }

    try {
      final user = await _auth.createUserWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
        selectedRole,
      );

      if (user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => LoginPage(role: selectedRole)),
        );
      }
    } catch (e) {
      setState(() {
        _errorMessage = "Sign-up failed: $e";
      });
    }
  }
}