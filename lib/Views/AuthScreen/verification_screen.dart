import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:resturent/Utils/app_colors.dart';

class VerificationCodeScreen extends StatefulWidget {
  const VerificationCodeScreen({super.key});

  @override
  State<VerificationCodeScreen> createState() => _VerificationCodeScreenState();
}

class _VerificationCodeScreenState extends State<VerificationCodeScreen> {
  String currentText = "";

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHeight = MediaQuery.of(context).size.height;
    final paddingValue = screenWidth * 0.05;

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/london.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: SafeArea(
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 30, left: 20),
                      padding: EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: AppColors.iconsBgColor,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: screenHeight * 0.15,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "Verification",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                        Container(
                          width: 300,
                          alignment: Alignment.center,
                          child: Center(
                            child: Text(
                              "We have sent the email to your email example@gmail.com",
                              textAlign:
                                  TextAlign.center, // Ensures text is centered
                              maxLines: 2,
                              style: TextStyle(
                                color: Colors.white,
                                overflow: TextOverflow.clip,
                                fontFamily: "Poppins",
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.9,
                  padding: EdgeInsets.only(top: 30),
                  decoration: BoxDecoration(
                    color: AppColors.screenBgColor,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Code",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                    onPressed: () {},
                                    child: Text(
                                      "Resend",
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black,
                                          decoration: TextDecoration.underline),
                                    )),
                                Text(
                                  "in 50 Second",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.all(paddingValue),
                        child: PinCodeTextField(
                          length: 4,
                          obscureText: false,
                          animationType: AnimationType.fade,
                          pinTheme: PinTheme(
                            shape: PinCodeFieldShape.box,
                            borderRadius: BorderRadius.circular(
                                6), // Soft rounded corners
                            fieldHeight: 55,
                            fieldWidth: 65,
                            inactiveFillColor: Colors.grey[
                                300], // Background color for inactive fields
                            activeFillColor: AppColors
                                .themeColor, // Background color for active fields
                            selectedFillColor: AppColors
                                .themeColor, // Slightly darker when selected
                            inactiveColor:
                                Colors.transparent, // Removes border color
                            activeColor:
                                Colors.transparent, // Removes border color
                            selectedColor:
                                Colors.transparent, // Removes border color
                            errorBorderColor: Colors.red,
                          ),
                          animationDuration: Duration(milliseconds: 300),
                          enableActiveFill:
                              true, // Enables the filled background
                          onCompleted: (v) {},
                          onChanged: (value) {
                            setState(() {
                              currentText = value;
                            });
                          },
                          beforeTextPaste: (text) {
                            return true;
                          },
                          appContext: context, // Required for the widget
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          margin: EdgeInsets.symmetric(horizontal: 17),
                          height: screenHeight * 0.075, // Dynamic height
                          width: double.infinity,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(7),
                            color: AppColors.themeColor,
                          ),
                          child: Text(
                            "VERIFY NOW",
                            style: TextStyle(
                              fontFamily: "Poppins",
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
