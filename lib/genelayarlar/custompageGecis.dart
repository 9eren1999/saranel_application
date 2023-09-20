import 'package:flutter/material.dart';

class CustomPageTransitionBuilder extends PageTransitionsBuilder {
  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (route.settings.name == null || route.settings.name == '/') {
      return child;
    }
    return SlideTransition(
      position: Tween<Offset>(
        begin: const Offset(1.0, 0.0), 
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves
              .fastOutSlowIn, 
        ),
      ),
      child: RotationTransition(
        turns: Tween<double>(
          begin: 0.5, 
          end: 1.0, 
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut, 
          ),
        ),
        child: child,
      ),
    );
  }
}
