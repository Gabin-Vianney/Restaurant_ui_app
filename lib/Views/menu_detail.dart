import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resturent/Utils/app_colors.dart';

class MenuDetail extends StatelessWidget {
  const MenuDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.screenBgColor,
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Text(
                        "Detail",
                        style: TextStyle(
                            fontSize: 21, fontWeight: FontWeight.bold),
                      ),
                      leading: InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            height: 50,
                            width: 50,
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                color: AppColors.iconsBgColor,
                                borderRadius: BorderRadius.circular(25)),
                            child: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              color: Colors.black,
                            )),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 40),
              Stack(
                clipBehavior: Clip.none, // Allow content to overflow
                children: [
                  Container(
                    height: 170,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.themeColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  // Burger Image with 80% inside and 20% outside the container
                  Positioned(
                    top: -65, // Moves the image 20% out of the container
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 240,
                      width: double.infinity,
                      alignment: Alignment.center,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/images/burger1.png",
                          fit:
                              BoxFit.cover, // Ensure the image covers the space
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 15, left: 3, bottom: 20),
                padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                width: 200,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(40)),
                    color: Colors.white,
                    border: Border.all(color: Colors.grey)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: AppColors.themeColor,
                    ),
                    Text(
                      "Uttora Coffe House",
                      style: TextStyle(fontSize: 16),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Text(
                  "Pizza Calzone European",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 21),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Text(
                  "Do you want to create a pizza-themed UI design then I am Haider Ali. ",
                  style: TextStyle(fontSize: 16, color: Colors.black54),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
                child: Row(
                  children: [
                    Icon(
                      FontAwesomeIcons.solidStar,
                      color: AppColors.themeColor,
                      size: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 6),
                      child: Text(
                        "4.7",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                    SizedBox(width: 30),
                    Icon(
                      FontAwesomeIcons.personBiking,
                      color: AppColors.themeColor,
                      size: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Free",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(width: 30),
                    Icon(
                      FontAwesomeIcons.clock,
                      color: AppColors.themeColor,
                      size: 16,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "20 min",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      "Pizza Size : ",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Text("\"8\"", style: TextStyle(fontSize: 18)),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.themeColor,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Text("\"10\"",
                          style: TextStyle(
                              fontSize: 18,
                              color: Colors.white,
                              fontWeight: FontWeight.bold)),
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      padding: EdgeInsets.all(2),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.all(Radius.circular(25))),
                      child: Text("\"12\"", style: TextStyle(fontSize: 18)),
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
