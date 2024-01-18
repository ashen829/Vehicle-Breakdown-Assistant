
import 'package:autoaid_test2/auth/auth_page.dart';
import 'package:autoaid_test2/components/loading_dialog.dart';
import 'package:autoaid_test2/global/global_var.dart';
import 'package:autoaid_test2/main.dart';
import 'package:autoaid_test2/pages/register_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

TextEditingController _emailController = TextEditingController();
TextEditingController _passwordController = TextEditingController();
CommonMethods cMethods = CommonMethods();

  checkIfNetworkIsAvailable(){
    cMethods.checkConnectivity(context);
    signInFormValidation();
  }

  signInFormValidation(){

    if(!_emailController.text.contains("@"))
    {
      cMethods.displaySnackBar("Please enter valid email", context);     
    }
    else if (_passwordController.text.trim().length<5)
    {
      cMethods.displaySnackBar("Your password must be atleast 6 or more characters", context);     
    }
    else
    {
      signInUser();
    }
  }

signInUser() async
  {
      showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => LoadingDialog(messageText: "Please Wait..."),     
    );
      final User? userFirebase = (
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      ).catchError((errorMsg)
      {
        Navigator.pop(context);
        cMethods.displaySnackBar(errorMsg.toString(), context);
      })
    ).user;

    if(!context.mounted) return;
    Navigator.pop(context);

    if (userFirebase!= null)
    {
      DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users").child(userFirebase.uid);
      usersRef.once().then((snap)
      {
        if(snap.snapshot.value!= null)
        {
          if((snap.snapshot.value as Map)["blockStatus"] == "no")
          {
            userName = (snap.snapshot.value as Map)["email"];
            Navigator.push(context, MaterialPageRoute(builder: (c) => MainPage()));
          }
          else
          {
            FirebaseAuth.instance.signOut();
            cMethods.displaySnackBar("You are blocked,Contact admin: uber@gmail.com", context);
          }

        }
        else
        {
          FirebaseAuth.instance.signOut();
          cMethods.displaySnackBar("Your record do not exist as a user", context);
        }
      });
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
                     
            children: [
        Container(
          height: 350,
          decoration:const BoxDecoration(
            color:  Color.fromARGB(255, 15, 54, 17),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.0),
              bottomRight: Radius.circular(30.0),
            ),
            image: DecorationImage(
              image: AssetImage('assets/images/img6.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
          const SizedBox(height: 20,),

            //Hello again
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "AUTO AID",
                  style:GoogleFonts.bebasNeue(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
              Container(
                
                height: 70,
                width: 70,
                child: Image.asset('assets/images/img5.jpeg', )
                )
              ],
            ),
            const SizedBox(height: 5,),
           
              const Text(
              "Drive with confidence, we've got your back",
              style: TextStyle(             
                fontSize: 15,             
              ),
              ),
              const SizedBox(height: 20,),
            //email text field
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 25.0),
              child: TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color.fromARGB(255, 15, 54, 17)),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  hintText: 'Enter your email',
                  fillColor: const Color.fromARGB(255, 240, 239, 239),
                  filled: true,
                ),
              ),
              ),  
          
            const SizedBox(height: 15,),
            //password text field
            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: true,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Color.fromARGB(255, 15, 54, 17)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your password',
                    fillColor:const Color.fromARGB(255, 240, 239, 239),
                    filled: true,
                  ),
                ),
              
              ), 

          const SizedBox(height: 12,),
            //sign in button

         Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: GestureDetector(
              onTap: (){
                checkIfNetworkIsAvailable();
              },
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 15, 54, 17),
                  borderRadius: BorderRadius.circular(12),
                  ),           
                child: const Center(
                  child: Text(
                    'Sign In',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 15,),

            //not a member sign in here
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Not a member?',
              style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
              ),
              
              GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder:(c)=>const RegisterPage()));
                },
                child:const Text(
                            ' Register Now',
                            style: TextStyle(
                color: Colors.green,
                fontWeight: FontWeight.bold,
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
}