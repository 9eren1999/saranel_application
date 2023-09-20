import 'package:flutter/material.dart';

class CustomPageRoute<T> extends MaterialPageRoute<T> {
  CustomPageRoute({required WidgetBuilder builder, RouteSettings? settings})
      : super(builder: builder, settings: settings);

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (settings.name == null || settings.name == '/') {
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
