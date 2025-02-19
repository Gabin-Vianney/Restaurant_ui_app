import 'package:flutter/material.dart';
import 'package:resturent/Routes/routes_name.dart';
import 'package:resturent/Views/menu_detail.dart';
import 'package:resturent/Views/menu_list.dart';
import 'package:resturent/Views/restuerents_detail.dart';
import 'package:resturent/Views/restuerents_list.dart';

import '../Views/home_view.dart';

class Routes {
  static Route<dynamic> generatedRoutes(RouteSettings setting) {
    switch (setting.name) {
      case RoutesName.homeScreen:
        return _createRoute(const HomeView());
      case RoutesName.resListScreen:
        return _createRoute(const RestuerentsList());
      case RoutesName.resDetailScreen:
        return _createRoute(const ResturentsDetail());
      case RoutesName.menuDetailScreen:
        return _createRoute(const MenuDetail());
      case RoutesName.menuListScreen:
        return _createRoute(const MenuList());

      default:
        return _createRoute(
          const Scaffold(
            body: Center(child: Text("Route Not Found")),
          ),
        );
    }
  }

  // Helper function to create a smooth animated route
  static PageRouteBuilder _createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const curve = Curves.easeInOut; // Smooth curve for both entry and exit

        var slideAnimation = Tween<Offset>(
          begin: const Offset(0.0, 1.0), // Slide from bottom to top
          end: Offset.zero,
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));

        var fadeAnimation = Tween<double>(
          begin: 0.0, // Fade from transparent
          end: 1.0, // To fully visible
        ).animate(CurvedAnimation(
          parent: animation,
          curve: curve,
        ));

        return FadeTransition(
          opacity: fadeAnimation,
          child: SlideTransition(
            position: slideAnimation,
            child: child,
          ),
        );
      },
      transitionDuration: const Duration(milliseconds: 700), // Smooth speed
      reverseTransitionDuration:
          const Duration(milliseconds: 700), // Smooth for pop too
    );
  }
}
