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
        begin: const Offset(1.0, 0.0), // Sağdan gelen bir kaydırma
        end: Offset.zero,
      ).animate(
        CurvedAnimation(
          parent: animation,
          curve: Curves
              .fastOutSlowIn, // Belirgin bir hızlanma ve yavaşlama efekti için
        ),
      ),
      child: RotationTransition(
        turns: Tween<double>(
          begin: 0.5, // 180 derece dönüş
          end: 1.0, // Tam bir döngü tamamlanıyor
        ).animate(
          CurvedAnimation(
            parent: animation,
            curve: Curves.easeInOut, // Yavaşlayan bir hızla dönüş
          ),
        ),
        child: child,
      ),
    );
  }
}
