
import 'package:url_launcher/url_launcher.dart';
import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';


class SearchPage extends StatefulWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  State<SearchPage> createState() => _SearchPageState();
}



class _SearchPageState extends State<SearchPage> {
  TextEditingController textController = TextEditingController();

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
          
      body:SingleChildScrollView(
        child: Column(
          children: [

                AnimSearchBar(             
                  width: 400,
                  textController: textController,
                  onSuffixTap: () {
                    setState(() {
                      textController.clear();
                    });
                  },
                  onSubmitted: (value){
                    openMap(textController.text.trim());
                  },
                
                ), 
           Padding(
            padding: EdgeInsets.symmetric(horizontal:8.0),
            child: Text('Here are the emergency numbers that you should call in Sri Lanka :',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
            ),
          ),              

                const SizedBox(height: 10,),
                Container(
          height: 50,
          width: 380,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                    color: Colors.grey,
                  ),   
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Police Emergency and National Help Desk',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
              onTap: (){
                launch('tel:119');
               },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 10),
                  decoration: BoxDecoration(        
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    
                  ),
                ),
              ),
            ],
          ),
                ),
                const SizedBox(height: 15,),
                Container(
          height: 50,
          width: 380,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                    color: Colors.grey,
                  ),   
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Government Information Center',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
              onTap: (){
                 launch('tel:+94758403761');
                },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 10), // Adjust the margin as needed
                  decoration: BoxDecoration(        
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(                 
                    Icons.call,
                    color: Colors.white,
                    
                  ),
                ),
              ),
            ],
          ),
        ),
                const SizedBox(height: 15,),
                Container(
          height: 50,
          width: 380,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                    color: Colors.grey,
                  ),   
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Suwa Seriya Ambulance',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              GestureDetector(
              onTap: (){
                launch('tel:+94758403761');
              },
                child: Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.only(left: 10), // Adjust the margin as needed
                  decoration: BoxDecoration(        
                    shape: BoxShape.circle,
                    color: Colors.blue,
                  ),
                  child: Icon(
                    Icons.call,
                    color: Colors.white,
                    
                  ),
                ),
              ),
            ],
          ),
        ),
                const SizedBox(height: 15,),
                Container(
          height: 50,
          width: 380,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                    color: Colors.grey,
                  ),   
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Ambulance / Fire & rescue',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(left: 10), // Adjust the margin as needed
                decoration: BoxDecoration(        
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  
                ),
              ),
            ],
          ),
        ),
                const SizedBox(height: 15,),
                Container(
          height: 50,
          width: 380,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                    color: Colors.grey,
                  ),   
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Tourism Ministry',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(left: 10), // Adjust the margin as needed
                decoration: BoxDecoration(        
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  
                ),
              ),
            ],
          ),
        ),
                const SizedBox(height: 15,),
                Container(
          height: 50,
          width: 380,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                    color: Colors.grey,
                  ),   
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'Southern Highway Emergency',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(left: 10), // Adjust the margin as needed
                decoration: BoxDecoration(        
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  
                ),
              ),
        
              
            ],
          ),
        ),
                const SizedBox(height: 15,),
                Container(
          height: 50,
          width: 380,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                    color: Colors.grey,
                  ),   
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'National Water Supply & Drainage Board',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(left: 10), // Adjust the margin as needed
                decoration: BoxDecoration(        
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  
                ),
              ),
        
              
            ],
          ),
        ),
                const SizedBox(height: 15,),
                Container(
          height: 50,
          width: 380,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                    color: Colors.grey,
                  ),   
            color: Colors.white,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  'National Authority on Tobacco & Alcohol',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              Container(
                height: 40,
                width: 40,
                margin: EdgeInsets.only(left: 10), // Adjust the margin as needed
                decoration: BoxDecoration(        
                  shape: BoxShape.circle,
                  color: Colors.blue,
                ),
                child: Icon(
                  Icons.call,
                  color: Colors.white,
                  
                ),
              ),
        
              
            ],
          ),
        ),
          ],
        ),
      ),
    );
  }
}
