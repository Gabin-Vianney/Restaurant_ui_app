import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:resturent/Utils/app_colors.dart';

class MenuList extends StatefulWidget {
  const MenuList({super.key});

  @override
  State<MenuList> createState() => _MenuListState();
}

class _MenuListState extends State<MenuList> {
  List<String> priceOfItems = [
    "Rs. 2000",
    "Rs. 3250",
    "Rs. 1300",
    "Rs. 1345",
    "Rs. 2000",
    "Rs. 3250",
    "Rs. 1300",
    "Rs. 1345",
  ];

  List<String> imagesOfItems = [
    "assets/images/burger1.png",
    "assets/images/chips1.png",
    "assets/images/chips1.png",
    "assets/images/burger1.png",
    "assets/images/burger1.png",
    "assets/images/chips1.png",
    "assets/images/chips1.png",
    "assets/images/burger1.png",
  ];
  List<String> namesOfResturentes = [
    "Rose Garden",
    "Chunk & Chess",
    "Folk & Knife",
    "Khayyam Fsd",
    "Rose Garden",
    "Chunk & Chess",
    "Folk & Knife",
    "Khayyam Fsd",
  ];
  List<String> namesOfItems = [
    "Burger Bistro",
    "Hot Pizza",
    "Chips Deal",
    "BBC Burger",
    "Burger Bistro",
    "Hot Pizza",
    "Chips Deal",
    "BBC Burger",
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
                          "Menu Card",
                          style: TextStyle(
                              color: AppColors.themeColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text("Halal Lab Office"),
                        leading: InkWell(
                          onTap: (){
                            Navigator.pop(context) ;
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
                  "Popular Burgers",
                  style: TextStyle(
                    fontSize: 22,
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                GridView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  padding: EdgeInsets.all(
                      8), // Adjusted padding for a more compact layout
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 6, // Adjusted horizontal spacing
                    mainAxisSpacing: 35, // Adjusted vertical spacing
                    childAspectRatio:
                        0.85, // Adjusted aspect ratio for a more compact card
                  ),
                  itemCount: imagesOfItems.length,
                  itemBuilder: (context, index) {
                    return Card(
                      elevation: 3, // Reduced elevation for a low effect
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                            Radius.circular(20)), // Slightly smaller radius
                      ),
                      child: Stack(
                        clipBehavior: Clip.none, // Allow content to overflow
                        children: [
                          // Card container for text and button with gradient
                          Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: Container(
                              padding: EdgeInsets.only(
                                  top: 60,
                                  bottom: 8,
                                  left: 12,
                                  right: 12), // Adjusted padding
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  begin: Alignment.center,
                                  end: Alignment.bottomCenter,
                                  colors: [
                                    Colors.white.withOpacity(
                                        0.98), // Upper color (matching body background)
                                    Colors.white, // Bottom part is white
                                  ],
                                ),
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(
                                        0.2), // Light shadow spread
                                    blurRadius:
                                        20, // Spread the shadow more subtly
                                    offset: Offset(0, 2),
                                  ),
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  ListTile(
                                    contentPadding: EdgeInsets.zero,
                                    title: Text(
                                      namesOfItems[index],
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    subtitle: Text(namesOfResturentes[index]),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        priceOfItems[index],
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14),
                                      ),
                                      Container(
                                          height: 36,
                                          width: 36,
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(18)),
                                            color: AppColors.themeColor,
                                          ),
                                          alignment: Alignment.center,
                                          padding: EdgeInsets.all(4),
                                          child: Icon(
                                            Icons.add,
                                            color: Colors.white,
                                            size: 26,
                                          ))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                          // Burger Image with 3D effect
                          Positioned(
                            top:
                                -40, // Move the image slightly outside of the card
                            left: 0,
                            right: 0,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(20),
                              child: Image.asset(
                                imagesOfItems[index],
                                height:
                                    120, // Adjusted height for a good effect
                                width: double.infinity,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
