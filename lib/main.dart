
import 'package:autoaid_test2/firebase_options.dart';
import 'package:autoaid_test2/pages/home_page.dart';
import 'package:autoaid_test2/pages/login_page.dart';
import 'package:autoaid_test2/pages/profile_page.dart';
import 'package:autoaid_test2/pages/report_page.dart';
import 'package:autoaid_test2/pages/search_page.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator(); // Loading indicator or splash screen
          } else {
            if (snapshot.hasData) {
              // User is logged in, navigate to MainPage
              return const MainPage();
            } else {
              // User is not logged in, navigate to LoginPage
              return const LoginPage();
            }
          }
        },
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 1;
    final screens = [
    SearchPage(),
    HomePage(),
    ReportPage(),
    ProfilePage(),
    
  ];





  @override
  Widget build(BuildContext context) {
    final items = <Widget> [
      const Icon(Icons.search , size: 30,color: Colors.white,),
      const Icon(Icons.home , size: 30,color: Colors.white,),
      const Icon(Icons.message , size: 30,color: Colors.white,),
      const Icon(Icons.person , size: 30,color: Colors.white,),
      
    ];

    return Scaffold(

      appBar:AppBar(
    
      backgroundColor: const Color.fromARGB(255, 15, 54, 17),
      elevation: 0,
      title:Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "AUTO AID",
            style:GoogleFonts.bebasNeue(
           fontSize: 36,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          
            ),
            SizedBox(width: 10,),
            Icon(Icons.car_crash_outlined,
            size: 37,
            color: Colors.white,)
        ],
      ),          
      centerTitle: true,
      leading: IconButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
        Navigator.push(context,
        MaterialPageRoute(builder: (context){
          return LoginPage();
        })
      
        );
      },
      icon: const Icon(
        Icons.arrow_back,
        color: Colors.white,
      ),
        ),
      actions: [
        IconButton(
      onPressed: () {
        FirebaseAuth.instance.signOut();
        Navigator.push(context,
        MaterialPageRoute(builder: (context){
          return LoginPage();
        })
      
        );
      },
          icon: const Icon(
          Icons.logout,
          color: Colors.white,
        ),
          ),
            ],
      ),

      body: screens[index], 
      bottomNavigationBar: CurvedNavigationBar(
      backgroundColor: Colors.grey.shade300,
      color: const Color.fromARGB(255, 15, 54, 17),
      items: items,
      height: 60,
      index: index,
      onTap: (index) => setState(() => this.index = index ),
      ),

    );
  }

}



  



