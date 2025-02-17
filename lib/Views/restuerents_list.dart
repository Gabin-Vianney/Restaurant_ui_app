import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Utils/app_colors.dart';

class RestuerentsList extends StatefulWidget {
  const RestuerentsList({super.key});

  @override
  State<RestuerentsList> createState() => _MenuViewState();
}

class _MenuViewState extends State<RestuerentsList> {
  List<String> imagesOfResturentes = [
    "assets/images/1.jpg",
    "assets/images/2.jpg",
    "assets/images/3.jpg",
    "assets/images/4.jpg",
    "assets/images/5.jpg",
    "assets/images/6.jpg",
    "assets/images/7.jpg",
    "assets/images/8.jpg",
  ];
  List<String> namesOfResturentes = [
    "Rose Garden Resturent",
    "Chunk & Chess Resturent",
    "Folk & Knife Resturent",
    "Khayyam Fsd Resturent",
    "Rose Garden Resturent",
    "Chunk & Chess Resturent",
    "Folk & Knife Resturent",
    "Khayyam Fsd Resturent",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.screenBgColor,
        body: SingleChildScrollView(
          // Wrap the entire body in a SingleChildScrollView
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
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
                          "Restaurants",
                          style: TextStyle(
                              color: AppColors.themeColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Halal Lab Office"),
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
                    Container(
                      height: 50,
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(25)),
                      child: FaIcon(
                        FontAwesomeIcons.magnifyingGlass,
                        color: Colors.white,
                        size: 25,
                      ),
                    ),
                    Container(
                      height: 50,
                      margin: EdgeInsets.only(left: 6),
                      width: 50,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: AppColors.iconsBgColor,
                          borderRadius: BorderRadius.circular(25)),
                      child: FaIcon(
                        Icons.filter_list_sharp,
                        color: Colors.black,
                        size: 25,
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                Text(
                  "Popular Restaurants",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: namesOfResturentes.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                12), // Set the border radius
                            child: Image(
                              image: AssetImage(imagesOfResturentes[index]),
                              height: 150,
                              width: double.infinity,
                              fit: BoxFit.cover,
                            ),
                          ),
                          ListTile(
                            contentPadding: EdgeInsets.only(left: 3, bottom: 0),
                            title: Text(
                              namesOfResturentes[index],
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text("Burger - Chicken - Wings - Riche"),
                          ),
                          Row(
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
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20)
                        ],
                      ),
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
