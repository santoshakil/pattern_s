import 'package:flutter/material.dart'
    show
        Align,
        Animation,
        BuildContext,
        CurvedAnimation,
        Curves,
        FadeTransition,
        Offset,
        PageRouteBuilder,
        ScaleTransition,
        SizeTransition,
        SlideTransition,
        Tween,
        Widget;

//Size Route Animation
class SizeRoute extends PageRouteBuilder {
  final Widget page;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 200);
  SizeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Align(
            child: SizeTransition(
              sizeFactor: animation,
              child: child,
            ),
          ),
        );
}

//Slide Right Route Animation
class SlideRightRoute extends PageRouteBuilder {
  final Widget page;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 200);
  SlideRightRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(-1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

//Slide Left Route Animation
class SlideLeftRoute extends PageRouteBuilder {
  final Widget page;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 200);
  SlideLeftRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              SlideTransition(
            position: Tween<Offset>(
              begin: const Offset(1, 0),
              end: Offset.zero,
            ).animate(animation),
            child: child,
          ),
        );
}

//Scale Route Animation
class ScaleRoute extends PageRouteBuilder {
  final Widget page;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 200);
  ScaleRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              ScaleTransition(
            scale: Tween<double>(
              begin: 0.0,
              end: 1.0,
            ).animate(
              CurvedAnimation(
                parent: animation,
                curve: Curves.fastOutSlowIn,
              ),
            ),
            child: child,
          ),
        );
}

//Fade Route Animation
class FadeRoute extends PageRouteBuilder {
  final Widget page;
  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);
  @override
  Duration get reverseTransitionDuration => const Duration(milliseconds: 200);
  FadeRoute({required this.page})
      : super(
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              page,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}
