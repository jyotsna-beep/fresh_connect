// import 'package:flutter/material.dart';
// import 'package:fresh_connect_sih/screens/home.dart';
// import 'signup.dart';

// class LoginPage extends StatefulWidget {
//   const LoginPage({Key? key}) : super(key: key);

//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   final TextEditingController emailController = TextEditingController();
//   final TextEditingController passwordController = TextEditingController();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Login',
//           style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//         ),
//         backgroundColor: Color.fromARGB(255, 26, 62, 27),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(20.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const Text(
//               'Login To Get Started!',
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
//             const SizedBox(height: 30),
//             ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Color.fromARGB(255, 26, 62, 27),
//                 padding: const EdgeInsets.symmetric(vertical: 15),
//               ),
//               onPressed: () {
//                 // Navigate to a placeholder page after successful login
//                 Navigator.push(context, MaterialPageRoute(builder: (context) => const Home()));
//               },
//               child: const Text(
//                 'Login',
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,color: Colors.white),
//               ),
//             ),
//             const SizedBox(height: 20),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 const Text("Don't have an account? "),
//                 GestureDetector(
//                   onTap: () {
//                     // Navigate to signup page
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => const SignupPage()));
//                   },
//                   child: const Text(
//                     'Sign up here',
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
import 'package:flutter/material.dart';
import 'package:freshconnect/screens/auth_service.dart';
import 'package:freshconnect/screens/community_screens/communitys1.dart';
import 'package:freshconnect/screens/consumer_screens/consumers1.dart';
import 'package:freshconnect/screens/farmer_screens/farmers1.dart';
import 'package:freshconnect/screens/plantcontrol_screens/electricityvalves.dart';
import 'package:freshconnect/screens/user_signin/signup.dart';
import 'package:freshconnect/screens/vendor_screens/vendors1.dart';


class LoginPage extends StatefulWidget {
  final String role;

  const LoginPage({Key? key, required this.role}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final AuthService _auth = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? _errorMessage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Login',
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        backgroundColor: const Color.fromARGB(255, 26, 62, 27),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text(
              'Login To Get Started!',
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
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 26, 62, 27),
                padding: const EdgeInsets.symmetric(vertical: 15),
              ),
              onPressed: _login,
              child: const Text(
                'Login',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Don't have an account? "),
                GestureDetector(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => const SignupPage()),
                    );
                  },
                  child: const Text(
                    'Sign up here',
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
    );
  }

  Future<void> _login() async {
    try {
      final user = await _auth.loginWithEmailAndPassword(
        emailController.text.trim(),
        passwordController.text.trim(),
      );

      if (user != null) {
        final String? role = await _auth.getUserRole(user.uid);

        if (role == widget.role) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => _getDashboardByRole(role)),
          );
        } else {
          setState(() {
            _errorMessage = "Role mismatch! Please check your credentials.";
          });
        }
      } else {
        setState(() {
          _errorMessage = "Login failed. Please check your credentials.";
        });
      }
    } catch (e) {
      setState(() {
        _errorMessage = "An error occurred: $e";
      });
    }
  }

  Widget _getDashboardByRole(String? role) {
    switch (role) {
      case 'Farmer':
        return const Farmers1();
      case 'Consumer':
        return const Consumers1();
      case 'Community Member':
        return const Communitys1();
      case 'Vendor':
        return const Vendors1();
      case 'Plant Control':
        return  SlurryProcessApp();
      default:
        return const LoginPage(role: 'Farmer');
    }
  }
}