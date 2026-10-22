import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/onboarding_item.dart';

class OnboardingSlideWidget extends StatelessWidget {
  final OnboardingItem item;

  const OnboardingSlideWidget({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.symmetric(
        horizontal: AppConstants.paddingLarge,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 12),

          // Illustration Widget Container
          item.illustrationWidget,

          const SizedBox(height: 28),

          // English Title
          Text(
            item.title,
            style: GoogleFonts.manrope(
              fontSize: 24,
              fontWeight: FontWeight.w800,
              color: isDark
                  ? AppColors.darkTextPrimary
                  : AppColors.lightTextPrimary,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 8),

          // Urdu Title
          Text(
            item.titleUrdu,
            style: GoogleFonts.notoNastaliqUrdu(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: AppColors.primaryOrange,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),

          // English Description
          Text(
            item.description,
            style: GoogleFonts.manrope(
              fontSize: 14,
              height: 1.5,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 10),

          // Urdu Description
          Text(
            item.descriptionUrdu,
            style: GoogleFonts.notoNastaliqUrdu(
              fontSize: 13,
              height: 1.6,
              color: isDark
                  ? AppColors.darkTextSecondary.withValues(alpha: 0.9)
                  : AppColors.lightTextSecondary.withValues(alpha: 0.9),
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 16),
        ],
      ),
    );
  }
}
