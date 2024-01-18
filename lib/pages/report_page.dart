import 'package:autoaid_test2/auth/auth_page.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:geolocator/geolocator.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  _ReportPageState createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  TextEditingController messageController1 = TextEditingController();
  TextEditingController messageController2 = TextEditingController();
  TextEditingController messageController3 = TextEditingController();
  TextEditingController messageController4 = TextEditingController();
  TextEditingController messageController5 = TextEditingController();
  TextEditingController messageController6 = TextEditingController();
  CommonMethods cMethods = CommonMethods();
  String selectedVehicleType = 'Motor Car'; 

  void sendReport() async {
    String phoneNumber = '+94711380816'; // Replace with the target WhatsApp number
    String message1 = messageController1.text;
    String message2 = messageController2.text;
    String message3 = messageController3.text;
    String message4 = messageController4.text;
    String message5 = messageController5.text;
    String message6 = messageController6.text;

    // Concatenate all three messages into one
    String fullMessage = '               AUTOAID HELP CENTRE           \n\n First Name: $message1\n\n Last Name: $message2\n\n NIC/Driving License: $message3\n\n Vehicle Type: $message4\n\n Vehicle No: $message5 \n\n Current Location: $message6';

    String whatsappUrl = 'https://wa.me/$phoneNumber/?text=${Uri.encodeFull(fullMessage)}';

    try {
      await launch(whatsappUrl);
    } catch (e) {
      print('Error launching WhatsApp: $e');
    }
  }

  void getCurrentLocation() async {
    try {
      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      // Construct the Google Maps URL with the latitude and longitude
      String googleMapUrl = 'https://www.google.com/maps/search/?api=1&query=${position.latitude},${position.longitude}';

      setState(() {
        messageController6.text = googleMapUrl;
      });
    } catch (e) {
      print('Error getting current location: $e');
    }
  }

reportFormValidation() {
  if (messageController1.text.trim().isEmpty) {
    cMethods.displaySnackBar("Please enter First Name", context);
  } else if (messageController2.text.trim().isEmpty) {
    cMethods.displaySnackBar("Please enter Last Name", context);
  } else if (messageController3.text.trim().isEmpty) {
    cMethods.displaySnackBar("Please enter NIC/Driving License", context);
  } else if (messageController5.text.trim().isEmpty) {
    cMethods.displaySnackBar("Please enter Vehicle No", context);
  } else if (messageController6.text.trim().isEmpty) {
    cMethods.displaySnackBar("Please enter Current Location", context);
  } else {
    sendReport();
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            
            children: [
            Padding(
            padding: EdgeInsets.symmetric(horizontal:8.0),
            child: Text('Autoaid Assistant Request',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
                  ),
                ),
              ), 
            SizedBox(height: 15,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,  // Set the border color to grey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0,),
                child: TextField(
                  controller: messageController1,
                  decoration: InputDecoration(labelText: '  First Name:'),
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,  // Set the border color to grey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0,),
                child: TextField(
                  controller: messageController2,
                  decoration: InputDecoration(labelText: '  Last Name:'),
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(height: 10,),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,  // Set the border color to grey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0,),
                child: TextField(
                  controller: messageController3,
                  decoration: InputDecoration(labelText: '  NIC/Driving Licence:'),
                  maxLines: 1,
                ),
              ),
            ),



            SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,  // Set the border color to grey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0,),
                child: DropdownButtonFormField<String>(
                value: selectedVehicleType,
                onChanged: (String? newValue) {
                  setState(() {
                    selectedVehicleType = newValue!;
                  });
                },
                items: ['Motor Car', 'Motor Bike', 'Van', 'Truck']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                decoration: InputDecoration(
                  labelText: 'Vehicle Type:',
                  labelStyle: TextStyle(
                    color: Colors.black, // Set text color to black
                    fontSize: 18, // Set font size to 18
                  ),
                ),
              ),
              ),
            ),
            SizedBox(height: 10,),



              SizedBox(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  color: Colors.grey,  // Set the border color to grey
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0,),
                child: TextField(
                  controller: messageController5,
                  decoration: InputDecoration(labelText: '  Vehicle No:'),
                  maxLines: 1,
                ),
              ),
            ),
            SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                    child: 
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(
                        color: Colors.grey,  // Set the border color to grey
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0,),
                      child: TextField(
                        controller: messageController6,
                        decoration: InputDecoration(labelText: '  Current Location:'),
                        maxLines: 1,
                      ),
                    ),
                  ),
                  ),


                  GestureDetector(
                    onTap: () {
                      getCurrentLocation();
                    },
                    child: Container(
                    height: 50,
                    width: 50,
                    margin: EdgeInsets.only(left: 10),
                    decoration: BoxDecoration(        
                      shape: BoxShape.circle,
                      color: Colors.blue,
                    ),
                    child: Icon(
                      Icons.location_on,
                      color: Colors.white,
                      
                    ),
                                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: reportFormValidation,
                style: ElevatedButton.styleFrom(
                  primary: Colors.black, // Set background color to black
                  onPrimary: Colors.white, // Set text color to white
                ),
                child: Text('Send Report via WhatsApp'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: ReportPage(),
  ));
}