// ignore_for_file: avoid_unnecessary_containers, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:zorko/constants.dart';

class FoodIteamView extends StatelessWidget {
  const FoodIteamView({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> foodData =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return SafeArea(
        child: Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Positioned(
                top: -270, // Move the circle up by adjusting this value
                left: -100, // Optional: Adjust left position if needed
                child: Container(
                  width: 600, // Adjust width of the circle if needed
                  height: 600, // Adjust height of the circle if needed
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: LinearGradient(
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [Color(0xFFFFCE92), Color(0xFFED8F03)],
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: 35.0, left: 35.0, right: 35.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Icon(Icons.arrow_back_ios_new_outlined),
                          ),
                        ),
                        Image(
                          image: AssetImage('assets/love.png'),
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Image(
                    image: NetworkImage(backendURL+ foodData['image']),
                    height: 250,
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 5),
          Center(
              child: Text(foodData['name'],
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w500))),
          Center(
              child: Text("N${foodData['price']}",
                  style: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontWeight: FontWeight.w600))),
          Padding(
            padding: EdgeInsets.only(left: 50, right: 50, top: 30, bottom: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Description",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Text(foodData['description'])
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                        height: 40,
                        width: 150,
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius:
                                BorderRadius.circular(100), // Set the border radius
                            color: Color(
                                0xFFEF7931), // Set the background color to EF7931
                          ),
                          child: ElevatedButton(
                            onPressed: () {
                              // Add your onPressed logic here
                            },
                            style: ElevatedButton.styleFrom(
                              foregroundColor: Colors.black,
                              backgroundColor: Colors.transparent,
                              padding:
                                  EdgeInsets.all(8), // Adjust padding as needed
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(
                                    50), // Adjust the border radius as needed
                              ),
                              elevation: 0, // Set text color
                            ),
                            child: Text(
                              'Add to Cart',
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                          ),
                        ),
                      ),
            ],
          )
        ],
      ),
    ));
  }
}
