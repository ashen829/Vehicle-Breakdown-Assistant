import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final user = FirebaseAuth.instance.currentUser;
  final _emailController = TextEditingController();

  @override
  void dispose(){
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try{
      await FirebaseAuth.instance
        .sendPasswordResetEmail(email: _emailController.text.trim());
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            content: Text('Password reset link sent! check Your email'),
          );
        });
    }on FirebaseAuthException catch (e){
      print(e);
      showDialog(
        context: context, 
        builder: (context){
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            child: Text('Enter your email and we will send you a password reset link :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),),
          ),
          SizedBox(height:15),
          Padding(
              padding:const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 15, 54, 17)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: '${user?.email ?? "No user"}',
                  fillColor: const Color.fromARGB(255, 240, 239, 239),
                  filled: true,
                ),
              ),
              ),
              SizedBox(height: 10,),
          MaterialButton(
            onPressed: (){passwordReset();},
          child: Text('Send Link',
          style: TextStyle(
            color: Colors.white,
          ),),
          color: Color.fromARGB(255, 15, 54, 17),
          ) 
        ],
      ),
      
      
      /*Center(
        child: Text('Signed in as: ${user?.email ?? "No user"}'),
      ),*/
    );
  }
}
