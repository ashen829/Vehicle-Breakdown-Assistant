import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class CarouselPage extends StatelessWidget {
  const CarouselPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      items: [
        // Add your carousel items here
        Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/images/img18.jpeg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 132, 45, 128),
              borderRadius: BorderRadius.circular(8), // Adjust the radius value as needed
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.amber,
                      size: 40,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Rain or shine, drive with care. Weather conditions demand your awareness',
                      textAlign: TextAlign.center,
                      style: TextStyle(                       
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,                      
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
         Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/images/img17.jpeg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),


          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 37, 19, 81),
              borderRadius: BorderRadius.circular(8), // Adjust the radius value as needed
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.amber,
                      size: 40,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Pedestrian safety is a shared responsibility – watch out for those on foot',
                      textAlign: TextAlign.center,
                      style: TextStyle(                       
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,                      
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

        Container(
            margin: EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8.0),
              image: DecorationImage(
                image: AssetImage('assets/images/img13.jpg'), // Replace with your image asset
                fit: BoxFit.cover,
              ),
            ),
          ),


           
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 19, 69, 32),
              borderRadius: BorderRadius.circular(8), // Adjust the radius value as needed
            ),
            child: Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.warning,
                      color: Colors.amber,
                      size: 40,
                    ),
                    SizedBox(height: 10,),
                    Text(
                      'Don\'t be in a rush to the hospital obey traffic rules',
                      textAlign: TextAlign.center,
                      style: TextStyle(                       
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,                      
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),


        
      ],
      options: CarouselOptions(
        height: 250.0,
        enableInfiniteScroll: true,
        autoPlay: true,
        autoPlayInterval: Duration(seconds: 3),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        pauseAutoPlayOnTouch: true,
        enlargeCenterPage: true,
        onPageChanged: (index, reason) {
          // Handle page change if needed
        },
      ),
    );
  }
}



