import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_framework.dart';

class AppResponsiveWrapper extends StatelessWidget {
  const AppResponsiveWrapper({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBreakpoints.builder(
      breakpoints: [
        const Breakpoint(start: 0, end: 600, name: MOBILE),
        const Breakpoint(start: 601, end: 800, name: TABLET),
        const Breakpoint(start: 801, end: 1920, name: DESKTOP),
        const Breakpoint(start: 1921, end: double.infinity, name: '4K'),
      ],
      child: Builder(
        builder: (context) {
          // Get width value based on breakpoints
          double? width =
              ResponsiveValue<double?>(
                context,
                defaultValue: 510.0, // Default value when no conditions are met
                conditionalValues: [
                  const Condition.equals(name: MOBILE, value: 430),
                  const Condition.equals(name: TABLET, value: 800),
                  const Condition.equals(name: DESKTOP, value: 1900),
                  const Condition.equals(name: '4K', value: 2300),
                ],
              ).value;

          // Fallback if for some reason width is null
          width ??= 510.0;

          return ResponsiveScaledBox(width: width, child: child!);
        },
      ),
    );
  }
}
