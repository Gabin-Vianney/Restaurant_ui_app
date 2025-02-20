import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:resturent/Utils/app_colors.dart';

import '../../Routes/routes_name.dart';
import '../../Utils/small_widgets.dart';
import '../../Utils/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _nameController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _nameFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();
  final _confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
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
                    child:  Container(
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
                            "SIGN UP",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                        Text(
                          "Please Sign up to get Started ",
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
                          SmallWidgets.textIs("Name"),
                          CustomTextField(
                            controllerIs: _nameController,
                            fieldValidator: MultiValidator([
                              RequiredValidator(errorText: "Name required"),
                            ]).call,
                            focusNode: _nameFocusNode,
                            nextFocusNode: _emailFocusNode,
                            hintTextIs: "Haider Ali",
                            keyboardApperanceType: TextInputType.emailAddress,
                            prefixIconIs: Icons.person,
                          ),
                          const SizedBox(height: 15),
                          SmallWidgets.textIs("Email Address"),
                          CustomTextField(
                            controllerIs: _emailController,
                            fieldValidator: MultiValidator([
                              RequiredValidator(errorText: "Email required"),
                              EmailValidator(errorText: "Enter a valid email"),
                            ]).call,
                            focusNode: _emailFocusNode,
                            nextFocusNode: _passwordFocusNode,
                            hintTextIs: "example@gmail.com",
                            keyboardApperanceType: TextInputType.emailAddress,
                            prefixIconIs: Icons.alternate_email,
                          ),
                          const SizedBox(height: 15),
                          SmallWidgets.textIs("Password"),
                          CustomTextField(
                            fieldValidator: passwordValidator.call,
                            focusNode: _passwordFocusNode,
                            nextFocusNode: _confirmPasswordFocusNode,
                            keyboardApperanceType: TextInputType.emailAddress,
                            controllerIs: _passwordController,
                            suffixIconIs: Icons.visibility_off,
                            prefixIconIs: Icons.lock,
                          ),
                          const SizedBox(height: 15),
                          SmallWidgets.textIs("Confirm Password"),
                          CustomTextField(
                            fieldValidator: (val) => MatchValidator(
                                    errorText: 'Passwords do not match')
                                .validateMatch(_passwordController.text,
                                    _confirmPasswordController.text),
                            focusNode:
                                _confirmPasswordFocusNode, // Use a separate FocusNode if needed
                            keyboardApperanceType: TextInputType.emailAddress,
                            controllerIs:
                                _confirmPasswordController, // Ensure you have a separate controller for confirm password
                            suffixIconIs: Icons.visibility_off,
                            prefixIconIs: Icons.lock,
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
                                "LOG IN",
                                style: TextStyle(
                                  fontFamily: "Poppins",
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 19,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: screenHeight * 0.01),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Already have an account ?",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Log In",
                                  style: TextStyle(
                                    color: AppColors.themeColor,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ],
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
