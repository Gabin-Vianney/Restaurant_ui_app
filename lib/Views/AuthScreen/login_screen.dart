import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:resturent/Utils/app_colors.dart';

import '../../Routes/routes_name.dart';
import '../../Utils/small_widgets.dart';
import '../../Utils/text_field.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _emailFocusNode = FocusNode();
  final _passwordFocusNode = FocusNode();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

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
                SizedBox(
                  height: screenHeight * 0.25,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(height: screenHeight * 0.08),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            "LOG IN",
                            style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Poppins",
                            ),
                          ),
                        ),
                        Text(
                          "Please Sign In to your existing Account",
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
                  height: screenHeight * 0.8,
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
                            height: 30,
                          ),
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
                            fieldValidator: MultiValidator([
                              RequiredValidator(errorText: "Password required"),
                              MinLengthValidator(8,
                                  errorText:
                                      "Password must be at least 8 characters long"),
                            ]).call,
                            focusNode: _passwordFocusNode,
                            keyboardApperanceType: TextInputType.emailAddress,
                            controllerIs: _passwordController,
                            suffixIconIs: Icons.visibility_off,
                            prefixIconIs: Icons.lock,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, RoutesName.forgetScreen);
                                },
                                child: Text(
                                  "Forget password",
                                  style: TextStyle(
                                    color: AppColors.themeColor,
                                    fontSize: 15,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: screenHeight * 0.025),
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
                          SizedBox(height: screenHeight * 0.03),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Don't have an account ?",
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: Text(
                                  "Sign up",
                                  style: TextStyle(
                                    color: AppColors.themeColor,
                                    fontFamily: "Poppins",
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Center(
                            child: Text(
                              "or",
                              style: TextStyle(
                                  fontSize: 20, color: Colors.black54),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 26,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.apple,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 26,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.twitter,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 26,
                                child: IconButton(
                                    onPressed: () {},
                                    icon: Icon(
                                      FontAwesomeIcons.tiktok,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                              ),
                            ],
                          )
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
