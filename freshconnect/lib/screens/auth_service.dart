// import 'dart:developer'; 


// import 'package:firebase_auth/firebase_auth.dart';
// class AuthService {
//   final _auth=FirebaseAuth.instance;
//   Future<User?>createUserWithEmailAndPassword(String email,String password)async{
//     try{
//       final cred = await _auth.createUserWithEmailAndPassword(email: email, password: password);
//     return cred.user;
//     }catch(e){
//       log("Something went wrong!");
//     }
//     return null;
//   }

//     Future<User?>logincreateUserWithEmailAndPassword(String email,String password)async{
//     try{
//       final cred = await _auth.signInWithEmailAndPassword(email: email, password: password);
//     return cred.user;
//     }catch(e){
//       log("Something went wrong!");
//     }
//     return null;
//   }
//   Future<void>signout()async{
//     try{
//       await _auth.signOut();
//     }catch(e){
//       log("Something went wrong!");
//     }
//   }
// }
// import 'package:firebase_auth/firebase_auth.dart';
// import 'dart:developer';

// class AuthService {
//   final FirebaseAuth _auth = FirebaseAuth.instance;

//   // Create user with email and password
//   Future<User?> createUserWithEmailAndPassword(String email, String password) async {
//     try {
//       final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       log('User created: ${userCredential.user?.email}');
//       return userCredential.user;
//     } catch (e) {
//       log('Error during user creation: $e');
//       return null;
//     }
//   }

//   // Sign in with email and password
//   Future<User?> loginWithEmailAndPassword(String email, String password) async {
//     try {
//       final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//       log('User logged in: ${userCredential.user?.email}');
//       return userCredential.user;
//     } catch (e) {
//       log('Error during login: $e');
//       return null;
//     }
//   }

//   // Sign out
//   Future<void> signOut() async {
//     try {
//       await _auth.signOut();
//     } catch (e) {
//       log('Error during sign out: $e');
//     }
//   }
// }
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:developer';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<User?> createUserWithEmailAndPassword(String email, String password, String role) async {
    try {
      final UserCredential userCredential = await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? user = userCredential.user;

      if (user != null) {
        await _firestore.collection('users').doc(user.uid).set({
          'email': email,
          'role': role,
        });
        log('User created: ${user.email}, Role: $role');
      }

      return user;
    } catch (e) {
      log('Error during user creation: $e');
      return null;
    }
  }

  Future<User?> loginWithEmailAndPassword(String email, String password) async {
    try {
      final UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      log('User logged in: ${userCredential.user?.email}');
      return userCredential.user;
    } catch (e) {
      log('Error during login: $e');
      return null;
    }
  }

  Future<String?> getUserRole(String uid) async {
    try {
      final DocumentSnapshot userDoc = await _firestore.collection('users').doc(uid).get();

      if (userDoc.exists) {
        final String role = userDoc['role'];
        log('Retrieved role: $role');
        return role;
      } else {
        log('User document does not exist.');
        return null;
      }
    } catch (e) {
      log('Error retrieving user role: $e');
      return null;
    }
  }

  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      log('Error during sign out: $e');
    }
  }
}