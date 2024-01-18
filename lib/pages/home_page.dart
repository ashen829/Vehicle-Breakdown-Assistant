
import 'package:autoaid_test2/components/carousel_slider.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:url_launcher/url_launcher.dart';




class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  final user = FirebaseAuth.instance.currentUser!;

  static Future <void> openMap (String location) async{
    String googleUrl = 'https://www.google.com/maps/search/$location';
    final Uri _url = Uri.parse(googleUrl);
    try{
      await launchUrl(_url);
    }catch(e){
      print(e);
    }
  }

  @override

  Widget build(BuildContext context) { 

    return Scaffold(
      
      backgroundColor: Colors.grey[300],
      floatingActionButton : FloatingActionButton(
          backgroundColor: Colors.black,
          foregroundColor: Colors.white,
        onPressed: () {},

        child: Icon(Icons.call),
      ),
      
      body:SingleChildScrollView(


        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [ 
              CarouselPage(),
              SizedBox(height: 15,),                      
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [                  
                  //Container 1
                    GestureDetector(
                      onTap: () {
                        openMap ('Auto repair shop near me');
                      },
                      child: Container(
                        height: 170,
                        width: 182,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade500,
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                        // Image
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  alignment: Alignment.topLeft,
                                  image: AssetImage('assets/images/img7.png'), // Replace with your image path
                                  fit: BoxFit.cover,
                                  
                                ),
                              ),
                            ),
                            SizedBox(height: 10), // Add spacing between image and text
                              
                            // Title
                            Text(
                              'Auto Repair Shop',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                            SizedBox(height: 5), // Add spacing between title and text
                              
                            // Text
                            Text(
                              'Provides general repairs and maintenance services for vehicles',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[900],
                              ),
                              maxLines: 3, // Limit the number of lines for text
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center, // Add ellipsis (...) if text exceeds the specified number of lines
                            ),
                          ],
                        ),
                      ),
                    ),
        
                  //container 2
                    GestureDetector(
                      onTap: (){openMap ('Car care center near me');},
                      child: Container(
                        height: 170,
                        width: 182,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade500,
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                        // Image
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  alignment: Alignment.topLeft,
                                  image: AssetImage('assets/images/img8.jpg'), // Replace with your image path
                                  fit: BoxFit.cover,
                                  
                                ),
                              ),
                            ),
                            SizedBox(height: 10), // Add spacing between image and text
                              
                            // Title
                            Text(
                              'Car Care Center',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                            SizedBox(height: 5), // Add spacing between title and text
                              
                            // Text
                            Text(
                              'Provides comprehensive car care services, including maintenance, detailing, and repairs.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[900],
                              ),
                              maxLines: 3, // Limit the number of lines for text
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center, // Add ellipsis (...) if text exceeds the specified number of lines
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
        
              const SizedBox(height: 10,),
        
               Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
        
                  //container 3
                    GestureDetector(
                      
                      onTap: (){openMap ('Tire Service center near me');},
                      child: Container(
                        height: 170,
                        width: 182,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade500,
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                        // Image
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  alignment: Alignment.topLeft,
                                  image: AssetImage('assets/images/img9.png'), // Replace with your image path
                                  fit: BoxFit.cover,
                                  
                                ),
                              ),
                            ),
                            SizedBox(height: 10), // Add spacing between image and text
                              
                            // Title
                            Text(
                              'Tire Service Center',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                            SizedBox(height: 5), // Add spacing between title and text
                              
                            // Text
                            Text(
                              'Specializes in tire-related services, such as tire rotations, replacements, and repairs.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[900],
                              ),
                              maxLines: 3, // Limit the number of lines for text
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center, // Add ellipsis (...) if text exceeds the specified number of lines
                            ),
                          ],
                        ),
                      ),
                    ),
              
                  //container 4
                    GestureDetector(
                      onTap: (){openMap ('Towing service near me');},
                      child: Container(
                        height: 170,
                        width: 182,
                        decoration: BoxDecoration(
                          color: Colors.grey[400],
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.grey.shade500,
                          )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            
                        // Image
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  alignment: Alignment.topLeft,
                                  image: AssetImage('assets/images/img10.png'), // Replace with your image path
                                  fit: BoxFit.cover,
                                  
                                ),
                              ),
                            ),
                            SizedBox(height: 10), // Add spacing between image and text
                              
                            // Title
                            Text(
                              'Towing Services',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                            ),
                            SizedBox(height: 5), // Add spacing between title and text
                              
                            // Text
                            Text(
                              'Tap here to discover nearby towing services locations.',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[900],
                              ),
                              maxLines: 3, // Limit the number of lines for text
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.center, // Add ellipsis (...) if text exceeds the specified number of lines
                            ),
                          ],
                        ),
                      ),
                    ),
                ],
              ),
        
              const SizedBox(height: 10,),
              
              Container(
                height: 250,
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Color.fromARGB(122, 46, 141, 17),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(
                    color: Color.fromARGB(0, 57, 143, 33),
                    width: 5
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Are you in a trouble? CALL US',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(height: 8),
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
                  SizedBox(width: 5,),
                  Icon(Icons.car_crash_sharp,
                  size: 36,
                  )

                    ],
                   ),
                    SizedBox(height: 12),
                    Text(
                      'We are dedicated to offering reliable support when your vehicle faces unexpected troubles.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[900],
                      ),
                    ),
                    SizedBox(height: 12),

                    ElevatedButton(
                      onPressed: () {
                        launch('tel:+94758403761');
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.black, // Set background color to black
                        onPrimary: Colors.white, // Set text and icon color to white
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: (){
                              launch('tel:+94758403761');
                            },
                            child: Icon(
                              Icons.call,
                              color: Colors.white, // Set icon color to white
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            "Call",
                            style: TextStyle(
                              color: Colors.white, // Set text color to white
                            ),
                          ),
                        ],
                      ),
                    )


                  ],
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

