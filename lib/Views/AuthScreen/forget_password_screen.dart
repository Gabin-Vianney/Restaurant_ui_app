import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:resturent/Utils/app_colors.dart';

import '../../Routes/routes_name.dart';
import '../../Utils/small_widgets.dart';
import '../../Utils/text_field.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();
  final _forgetPasswordController = TextEditingController();
  final _forgetPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _forgetPasswordController.dispose();
    super.dispose();
  }

  // Define the password validator using MultiValidator.
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8,
        errorText: 'Password must be at least 8 characters long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'Password must have at least one special character'),
  ]);

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
                  image: AssetImage(
                    "assets/images/london.png",
                  ),
                  fit: BoxFit.cover)),
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
                            borderRadius: BorderRadius.circular(20)),
                        child: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          color: Colors.black,
                        )),
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
                            "Forgot Password",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                        Text(
                          "Please Sign in to existing account ",
                          style: TextStyle(
                            color: Colors.white,
                            fontFamily: "Poppins",
                          ),
                        ),
                        SizedBox(height: screenHeight * 0.03),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: screenHeight * 0.9,
                  decoration: BoxDecoration(
                      color: AppColors.screenBgColor,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.all(paddingValue),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20,
                          ),

                          SmallWidgets.textIs("Email Address"),
                          CustomTextField(
                            controllerIs: _forgetPasswordController,
                            fieldValidator: MultiValidator([
                              RequiredValidator(errorText: "Recovery Email"),
                              EmailValidator(errorText: "Enter a valid email"),
                            ]).call,
                            hintTextIs: "example@gmail.com",
                            keyboardApperanceType: TextInputType.emailAddress,
                            prefixIconIs: Icons.alternate_email,
                            focusNode: _forgetPasswordFocusNode,
                          ),

                          SizedBox(height: screenHeight * 0.04),
                          // Button
                          InkWell(
                            onTap: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacementNamed(
                                    context, RoutesName.homeScreen);
                              }
                            },
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
                                "SEND CODE",
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
