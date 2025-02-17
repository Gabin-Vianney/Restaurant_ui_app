import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:resturent/Utils/app_colors.dart';
import 'package:badges/badges.dart' as badges;
import 'package:resturent/Views/menu_list.dart';
import 'package:resturent/Views/restuerents_list.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => HomeViewState();
}

class HomeViewState extends State<HomeView> {
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  TextEditingController searchController = TextEditingController();

  static List<String> categories = [
    "Burgers",
    "Pizza",
    "Chips",
    "Burgers",
    "Pizza",
    "Chips",
  ];
  static List<String> imagesOfCatagories = [
    "assets/images/burger1.png",
    "assets/images/pizza1.png",
    "assets/images/chips1.png",
    "assets/images/burger1.png",
    "assets/images/pizza1.png",
    "assets/images/chips1.png",
  ];

  static List<String> imagesOfResturentes = [
    "assets/images/1.jpg",
    "assets/images/9.jpg",
    "assets/images/8.jpg",
    "assets/images/7.jpg",
  ];
  static List<String> namesOfResturentes = [
    "Rose Garden Restaurants",
    "Chunk & Chess Restaurants",
    "Folk & Knife Restaurants",
    "Khayyam Restaurants",
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.screenBgColor,
        body: SingleChildScrollView(
          // Wrap the entire content to enable global scrolling
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
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
                          "Deliver To",
                          style: TextStyle(
                              color: AppColors.themeColor,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Halal Lab Office"),
                        leading: Container(
                          height: 50,
                          width: 50,
                          padding: EdgeInsets.all(12),
                          decoration: BoxDecoration(
                              color: AppColors.iconsBgColor,
                              borderRadius: BorderRadius.circular(25)),
                          child: Image.asset(
                            "assets/images/menu.png",
                            height: 30,
                            width: 30,
                            fit: BoxFit.cover,
                          ),
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
                      child: badges.Badge(
                        position:
                            badges.BadgePosition.topEnd(top: -14, end: -10),
                        badgeContent: Text(
                          "2",
                          style: TextStyle(color: Colors.white),
                        ),
                        child: FaIcon(
                          FontAwesomeIcons.facebookMessenger,
                          color: Colors.white,
                          size: 25,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Hey Halal, ",
                      style: TextStyle(fontSize: 20),
                    ),
                    Text(
                      "Good Afternoon",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Form(
                  key: globalKey,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    child: TextFormField(
                      controller: searchController,
                      validator: MultiValidator([
                        RequiredValidator(
                            errorText: 'This field cannot be empty'),
                      ]).call,
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.all(20),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                        fillColor: AppColors.mainBgColor,
                        filled: true,
                        hintText: "Search dishes and restaurant",
                        prefixIcon: Icon(Icons.search, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text("All Categories",
                            style: TextStyle(fontSize: 20)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuList(),
                              ));
                        },
                        child: Row(
                          children: [
                            Text("See All", style: TextStyle(fontSize: 18)),
                            Padding(
                              padding: const EdgeInsets.all(4),
                              child: Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 18,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                // Horizontal list for categories
                SizedBox(
                  height: 56,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: imagesOfCatagories.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10, top: 5),
                        child: Container(
                          width: 130,
                          padding: EdgeInsets.all(7),
                          decoration: BoxDecoration(
                            color: Colors.grey.shade100,
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              CircleAvatar(
                                backgroundImage:
                                    AssetImage(imagesOfCatagories[index]),
                              ),
                              Text(
                                categories[index],
                                style: TextStyle(
                                    fontWeight: FontWeight.bold, fontSize: 16),
                              )
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: Text("Open Restaurants",
                            style: TextStyle(fontSize: 20)),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MenuList(),
                              ));
                        },
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => RestuerentsList(),
                                ));
                          },
                          child: Row(
                            children: [
                              Text("See All", style: TextStyle(fontSize: 18)),
                              Padding(
                                padding: const EdgeInsets.all(4),
                                child: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 6),
                // Restaurant list as a non-scrollable ListView integrated with the main scroll view
                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: 4,
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
