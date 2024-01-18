import 'package:autoaid_test2/auth/auth_page.dart';
import 'package:autoaid_test2/components/loading_dialog.dart';
import 'package:autoaid_test2/pages/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';



class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

final _emailController = TextEditingController();
final _passwordController = TextEditingController();
final _confirmPasswordContoller = TextEditingController();
CommonMethods cMethods = CommonMethods();


 checkIfNetworkIsAvailable(){
    cMethods.checkConnectivity(context);
    passwordConfirmed();
    signUpFormValidation();
    

  }

  signUpFormValidation(){
    if(!_emailController.text.contains("@"))
    {
      cMethods.displaySnackBar("Please enter valid email", context);     
    }
    else if (_passwordController.text.trim().length<5)
    {
      cMethods.displaySnackBar("Your password must be atleast 6 or more characters", context);     
    }
    else if (passwordConfirmed() == false){
      cMethods.displaySnackBar("Your passwords don't match", context);
    }
    else
    {
      registerNewUser();
    }
  }

registerNewUser() async 
{
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) => LoadingDialog(messageText: "Registering Your Account..."),
  );
  

  try {
    final UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
    );

    final User? userFirebase = userCredential.user;

    if (userFirebase != null) {
      DatabaseReference usersRef = FirebaseDatabase.instance.ref().child("users").child(userFirebase.uid);
      Map userDataMap = 
      {
        "email": _emailController.text.trim(),
        "password": _passwordController.text.trim(),
        "id": userFirebase.uid,
        "blockStatus": "no",
      };

      // Update this line to use set with `onComplete` callback
      await usersRef.set(userDataMap).then((_) {
        Navigator.pop(context); // Close the loading dialog
        
        Navigator.push(context, MaterialPageRoute(builder: (c) => const LoginPage()));
        cMethods.displaySnackBar("Registration successful!, Please log in with your email and password", context);
      });
    }
  } catch (error) {
    Navigator.pop(context); // Close the loading dialog
    cMethods.displaySnackBar(error.toString(), context);
  }
}



bool passwordConfirmed(){
  if(_passwordController.text.trim() ==
  _confirmPasswordContoller.text.trim()){
    return true;
  }else{
    return false;
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,          
            children: [

          const SizedBox(height: 50,),

          Icon(Icons.account_circle,
          size: 60,),
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
            const SizedBox(height: 10,),
           
              const Text(
              "Register below with your details",
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
                    borderSide: BorderSide(color: const Color.fromARGB(255, 15, 54, 17)),
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
                      borderSide: BorderSide(color: const Color.fromARGB(255, 15, 54, 17)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Enter your password',
                    fillColor:const Color.fromARGB(255, 240, 239, 239),
                    filled: true,
                  ),
                ),
              
              ), 
const SizedBox(height: 15,),
//confirm password text field

            Padding(
              padding:const EdgeInsets.symmetric(horizontal: 25.0),
                child: TextField(
                  obscureText: true,
                  controller: _confirmPasswordContoller,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: const Color.fromARGB(255, 15, 54, 17)),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    hintText: 'Confirm your password',
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
                    'Sign Up',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
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
              const Text('Already registered?',
              style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
              ),
              
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (c) => const LoginPage()));
                } ,
                child:const Text(
                            ' Log In',
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