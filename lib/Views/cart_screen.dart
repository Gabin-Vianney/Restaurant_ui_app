import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:resturent/Utils/app_colors.dart';

import '../Utils/small_widgets.dart';
import '../Utils/text_field.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  List<String> priceOfItems = [
    "Rs. 2000",
    "Rs. 3250",
    "Rs. 1300",
    "Rs. 1345",
  ];

  List<String> imagesOfItems = [
    "assets/images/burger1.png",
    "assets/images/chips1.png",
    "assets/images/burger1.png",
    "assets/images/chips1.png",
  ];

  List<String> namesOfItems = [
    "Burger Bistro with 2 ltr Coka Cola",
    "Hot Chips with half ltr Coke ",
    "Burger Bistro with 2 ltr Coka Cola",
    "Hot Chips with half ltr Coke ",
  ];

  final _addressController = TextEditingController();
  final _addressFocusNode = FocusNode();

  @override
  void dispose() {
    _addressController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;

    final paddingValue = screenWidth * 0.04;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF050a32),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(
                    top: paddingValue, left: paddingValue, right: paddingValue),
                child: SizedBox(
                  height: screenHeight * 0.68,
                  child: Column(
                    children: [
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: Text(
                                "Cart",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 19,
                                    fontWeight: FontWeight.bold),
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
                                        borderRadius:
                                            BorderRadius.circular(25)),
                                    child: Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      color: Colors.black,
                                    )),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20),
                      // Start of the scrollable part for the items
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              _buildCartItem(0),
                              SizedBox(height: 20),
                              _buildCartItem(1),
                              SizedBox(height: 20),
                              _buildCartItem(2),
                              SizedBox(height: 20),
                              _buildCartItem(3),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            // Bottom Container - fixed part
            Container(
              width: double.infinity,
              height: screenHeight * 0.3,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      topLeft: Radius.circular(30))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SmallWidgets.textIs("Delivery Address"),
                  CustomTextField(
                    fieldValidator: MultiValidator([
                      RequiredValidator(errorText: "Email required"),
                      EmailValidator(errorText: "Enter a valid email"),
                    ]).call,
                    hintTextIs: "Chak No 104 jb FSD",
                    keyboardApperanceType: TextInputType.emailAddress,
                    prefixIconIs: Icons.location_on_outlined,
                    controllerIs: _addressController,
                    focusNode: _addressFocusNode,
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 3, vertical: 12),
                    child: Row(
                      children: [
                        Text(
                          "Total Price : ",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "Rs. 6800",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: screenHeight * 0.07, // Dynamic height
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColors.themeColor,
                      ),
                      child: Text(
                        "CONFIRM & PAY",
                        style: TextStyle(
                          fontFamily: "Poppins",
                          letterSpacing: 1,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 19,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  // Helper method to build each cart item
  Widget _buildCartItem(int index) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(right: 15),
          decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.all(Radius.circular(30))),
          child: Image(
            image: AssetImage(imagesOfItems[index]),
            height: 140,
            width: 140,
            fit: BoxFit.cover,
          ),
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                namesOfItems[index],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              SizedBox(height: 6),
              Text(
                priceOfItems[index],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "14\"",
                    style: TextStyle(color: Colors.white54, fontSize: 16),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 16,
                        child: Text(
                          "-",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 12),
                        child: Text(
                          "2",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 15,
                        child: Text(
                          "+",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
