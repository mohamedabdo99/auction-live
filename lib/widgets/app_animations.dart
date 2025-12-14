// lib/utils/animations_helper.dart
import 'package:flutter/material.dart';

class AppAnimations {
  // Fade animation
  static Widget fadeIn(Widget child, {Duration duration = const Duration(milliseconds: 3000)}) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return Opacity(
          opacity: value,
          child: child,
        );
      },
      child: child,
    );
  }

  // Slide animation
  static Widget slideIn(Widget child, {
    Duration duration = const Duration(milliseconds: 4000),
    Offset begin = const Offset(0, 30),
  }) {
    return TweenAnimationBuilder<Offset>(
      tween: Tween(begin: begin, end: Offset.zero),
      duration: duration,
      builder: (context, value, child) {
        return Transform.translate(
          offset: value,
          child: child,
        );
      },
      child: child,
    );
  }

  // Scale animation
  static Widget scaleIn(Widget child, {
    Duration duration = const Duration(milliseconds: 4000),
  }) {
    return TweenAnimationBuilder<double>(
      tween: Tween(begin: 0.8, end: 1.0),
      duration: duration,
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: child,
        );
      },
      child: child,
    );
  }

  // Hover animation
  static Widget hoverEffect(Widget child, {bool enabled = true}) {
    if (!enabled) return child;

    return MouseRegion(
      child: child,
      onEnter: (_) {},
      onExit: (_) {},
    );
  }
}