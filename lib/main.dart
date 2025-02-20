import 'package:flutter/material.dart';
import 'Routes/routes.dart';
import 'Routes/routes_name.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          fontFamily: "CustomFont",
        ),
        initialRoute: RoutesName.paymentScreen,
        onGenerateRoute: Routes.generatedRoutes);
  }
}
