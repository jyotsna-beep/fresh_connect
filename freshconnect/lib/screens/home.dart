// import 'package:flutter/material.dart';
// import 'package:fresh_connect_sih/screens/community_screens/communitys1.dart';
// import 'package:fresh_connect_sih/screens/consumer_screens/consumers1.dart';
// import 'package:fresh_connect_sih/screens/farmer_screens/farmers1.dart';
// import 'package:fresh_connect_sih/screens/vendor_screens/vendors1.dart';

// class Home extends StatefulWidget {
//   const Home({super.key});

//   @override
//   State<Home> createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Getting Started',style:TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.white)),
//         backgroundColor: const Color.fromARGB(255, 26, 62, 27),
//       ),
//       body: 
//       Column(
//         children: [
//          SizedBox(height: 180,),
//          ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Farmers1()),
//               );
//             },
//           style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 26, 62, 27), // Fixed: Use backgroundColor
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Make button bigger
//               textStyle: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           child:Row(
//             children: [
//               Icon(Icons.agriculture,color: Colors.white,),
//               SizedBox(width:50),
//               Text('Farmer',style: TextStyle(fontSize: 24,color: Colors.white),),
              
//             ],
            
//           )
//           ),
//           SizedBox(height: 20,),
//          ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Communitys1()),
//               );
//             },
//           style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 26, 62, 27), // Fixed: Use backgroundColor
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Make button bigger
//               textStyle: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           child:Row(
//             children: [
//               Icon(Icons.people,color: Colors.white,),
//               SizedBox(width:50),
//               Text('Community',style: TextStyle(fontSize: 24,color: Colors.white),),
              
//             ],
            
//           )
//           ),
//           SizedBox(height: 20,),
//          ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Vendors1()),
//               );
//             },
//           style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 26, 62, 27), // Fixed: Use backgroundColor
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Make button bigger
//               textStyle: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           child:Row(
//             children: [
//               Icon(Icons.store,color: Colors.white,),
//               SizedBox(width:50),
//               Text('Vendor',style: TextStyle(fontSize: 24,color: Colors.white),),
              
//             ],
            
//           )
//           ),
//           SizedBox(height: 20,),
//          ElevatedButton(
//             onPressed: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(builder: (context) => Consumers1()),
//               );
//             },
//           style: ElevatedButton.styleFrom(
//               backgroundColor: const Color.fromARGB(255, 26, 62, 27), // Fixed: Use backgroundColor
//               padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15), // Make button bigger
//               textStyle: const TextStyle(
//                 fontSize: 20,
//                 fontWeight: FontWeight.bold,
//               ),
//             ),
//           child:Row(
//             children: [
//               Icon(Icons.person,color: Colors.white,),
//               SizedBox(width:50),
//               Text('Consumer',style: TextStyle(fontSize: 24,color: Colors.white),),
              
//             ],
            
//           )
//           ),
      
//           Image.asset('assets/images/namelogo.png',width: 400,height: 220,),
//         ],
//       ),
//     );
//   }
// }
// Home.dart
import 'package:flutter/material.dart';
import 'package:freshconnect/screens/user_signin/login.dart';  // Import Login page

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Select Your Role',
          style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Color.fromARGB(255, 26, 62, 27),
      ),
      body: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 180),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage(role: 'Farmer')),  // Pass 'Farmer' role
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 62, 27),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: Row(
              children: const [
                Icon(Icons.agriculture, color: Colors.white),
                SizedBox(width: 50),
                Text('Farmer', style: TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage(role: 'Community')),  // Pass 'Community' role
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 62, 27),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: Row(
              children: const [
                Icon(Icons.people, color: Colors.white),
                SizedBox(width: 50),
                Text('Community', style: TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage(role: 'Vendor')),  // Pass 'Vendor' role
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 62, 27),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: Row(
              children: const [
                Icon(Icons.store, color: Colors.white),
                SizedBox(width: 50),
                Text('Vendor', style: TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage(role: 'Consumer')),  // Pass 'Consumer' role
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 62, 27),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: Row(
              children: const [
                Icon(Icons.person, color: Colors.white),
                SizedBox(width: 50),
                Text('Consumer', style: TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LoginPage(role: 'Plantcontrol')),  // Pass 'Consumer' role
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 26, 62, 27),
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              textStyle: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            child: Row(
              children: const [
                Icon(Icons.person, color: Colors.white),
                SizedBox(width: 50),
                Text('Plant Control System', style: TextStyle(fontSize: 24, color: Colors.white)),
              ],
            ),
          ),
          SizedBox(height: 0 ,),
          //Image.asset('assets/images/namelogo.png',width: 400,height: 220,),
        ],
      ),
    );
  }
}