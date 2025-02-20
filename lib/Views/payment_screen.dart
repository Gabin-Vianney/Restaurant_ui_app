import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Utils/app_colors.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.all(20),
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
                        "Payment Method",
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
              SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: AppColors.iconsBgColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          FontAwesomeIcons.ccVisa,
                          color: Colors.blueAccent.shade700,
                          size: 40,
                        ),
                      ),
                      Text(
                        "VISA",
                        style: TextStyle(letterSpacing: 1),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Stack(
                        clipBehavior: Clip
                            .none, // Allows the tick icon to overflow the container
                        children: [
                          Container(
                            height: 65,
                            width: 75,
                            margin: EdgeInsets.all(4),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: AppColors.themeColor, width: 2),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            child: Icon(
                              FontAwesomeIcons.paypal,
                              color: Colors.blue,
                              size: 40,
                            ),
                          ),
                          // This is the tick icon in the top-right corner
                          Positioned(
                            top: -6,
                            right: -6,
                            child: Icon(
                              Icons.check_circle,
                              color: AppColors
                                  .themeColor, // Set the color to the theme color
                              size: 30, // Adjust the size of the tick icon
                            ),
                          ),
                        ],
                      ),
                      Text(
                        "PAYPAL",
                        style: TextStyle(letterSpacing: 1),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        margin: EdgeInsets.all(4),
                        decoration: BoxDecoration(
                            color: AppColors.iconsBgColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          FontAwesomeIcons.ccMastercard,
                          color: AppColors.themeColor,
                          size: 40,
                        ),
                      ),
                      Text(
                        "M.CARD",
                        style: TextStyle(letterSpacing: 1),
                      )
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        height: 65,
                        width: 75,
                        margin: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                            color: AppColors.iconsBgColor,
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        child: Icon(
                          FontAwesomeIcons.amazonPay,
                          color: Colors.blue,
                          size: 40,
                        ),
                      ),
                      Text(
                        "A.PAY",
                        style: TextStyle(letterSpacing: 1),
                      )
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                  padding: EdgeInsets.all(20),
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.grey.shade200),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          FontAwesomeIcons.paypal,
                          size: 100,
                          color: Colors.blue,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "No Payment Method Added",
                          style: TextStyle(
                              color: Colors.black,
                              letterSpacing: 1,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "You may add payment method and save it for later use ",
                          maxLines: 2,
                          textAlign: TextAlign
                              .center, // This makes sure the text is centered
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 17,
                          ),
                        )
                      ],
                    ),
                  )),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 70,
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.symmetric(vertical: 20),
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(8)),
                      border:
                          Border.all(color: Colors.grey.shade300, width: 2)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        color: AppColors.themeColor,
                        size: 30,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        "ADD NEW METHOD",
                        style: TextStyle(
                            color: AppColors.themeColor,
                            letterSpacing: 1,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 100,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 65, // Dynamic height
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
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
        ),
      ),
    );
  }
}
