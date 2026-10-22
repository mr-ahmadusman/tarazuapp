import 'package:flutter/material.dart';

class OnboardingItem {
  final String title;
  final String titleUrdu;
  final String description;
  final String descriptionUrdu;
  final Widget illustrationWidget;

  const OnboardingItem({
    required this.title,
    required this.titleUrdu,
    required this.description,
    required this.descriptionUrdu,
    required this.illustrationWidget,
  });
}
