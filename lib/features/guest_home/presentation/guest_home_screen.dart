import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routing/app_router.dart';
import '../../../core/theme/theme_provider.dart';
import '../../../core/widgets/custom_button.dart';
import '../../../core/widgets/glass_card.dart';
import '../../../core/widgets/tarazu_logo.dart';

class GuestHomeScreen extends StatelessWidget {
  const GuestHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        title: Row(
          children: [
            const TarazuLogo(size: 32, showText: false, showUrdu: false),
            const SizedBox(width: 8),
            Text(
              AppConstants.appName,
              style: GoogleFonts.manrope(fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 6),
            Text(
              AppConstants.appNameUrdu,
              style: GoogleFonts.notoNastaliqUrdu(
                fontSize: 14,
                color: AppColors.primaryOrange,
              ),
            ),
          ],
        ),
        actions: [
          // Theme Switcher Button
          IconButton(
            icon: Icon(
              isDark ? LucideIcons.sun : LucideIcons.moon,
              color: AppColors.primaryOrange,
            ),
            tooltip: 'Toggle Theme (Light/Dark)',
            onPressed: () {
              themeNotifier.toggleTheme();
            },
          ),
          const SizedBox(width: 8),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.all(AppConstants.paddingLarge),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Guest Welcome Banner
              GlassCard(
                borderColor: AppColors.primaryOrange,
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(12),
                      decoration: const BoxDecoration(
                        color: AppColors.primaryOrange,
                        shape: BoxShape.circle,
                      ),
                      child: const Icon(
                        LucideIcons.userCheck,
                        color: Colors.white,
                        size: 24,
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Tarazu Guest Mode Active',
                            style: GoogleFonts.manrope(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDark
                                  ? AppColors.darkTextPrimary
                                  : AppColors.lightTextPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Phase 1 foundation complete. Explore theme modes and navigation.',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              color: isDark
                                  ? AppColors.darkTextSecondary
                                  : AppColors.lightTextSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ).animate().fadeIn(duration: 400.ms),

              const SizedBox(height: 24),

              Text(
                'Phase 2 Preview Capabilities',
                style: GoogleFonts.manrope(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),

              const SizedBox(height: 16),

              // Capability Card 1
              _FeaturePreviewCard(
                icon: LucideIcons.scale,
                iconColor: AppColors.primaryOrange,
                title: 'Weight-to-Price Calculator',
                titleUrdu: 'وزن سے قیمت کا حساب',
                subtitle:
                    'Enter item rate and weight to get instant bill totals.',
              ).animate().fadeIn(delay: 100.ms, duration: 400.ms),

              const SizedBox(height: 12),

              // Capability Card 2
              _FeaturePreviewCard(
                icon: LucideIcons.wallet,
                iconColor: AppColors.secondaryBlue,
                title: 'Budget-to-Weight Calculator',
                titleUrdu: 'بجٹ سے وزن کا حساب',
                subtitle:
                    'Calculate exact weight required for customer cash budget.',
              ).animate().fadeIn(delay: 200.ms, duration: 400.ms),

              const SizedBox(height: 12),

              // Capability Card 3
              _FeaturePreviewCard(
                icon: LucideIcons.shoppingBag,
                iconColor: AppColors.primaryOrange,
                title: 'Custom Product Catalogue',
                titleUrdu: 'پروڈکٹ لسٹ مینجمنٹ',
                subtitle:
                    'Store product list, prices per kg, and custom categories.',
              ).animate().fadeIn(delay: 300.ms, duration: 400.ms),

              const SizedBox(height: 32),

              // Navigation Actions
              CustomButton(
                text: 'Back to Login',
                icon: LucideIcons.logIn,
                onPressed: () => context.go(AppRoutes.login),
              ),

              const SizedBox(height: 12),

              CustomButton(
                text: 'Replay Onboarding',
                variant: ButtonVariant.outlined,
                icon: LucideIcons.rotateCcw,
                onPressed: () => context.go(AppRoutes.onboarding),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}

class _FeaturePreviewCard extends StatelessWidget {
  final IconData icon;
  final Color iconColor;
  final String title;
  final String titleUrdu;
  final String subtitle;

  const _FeaturePreviewCard({
    required this.icon,
    required this.iconColor,
    required this.title,
    required this.titleUrdu,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GlassCard(
      padding: const EdgeInsets.all(16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: iconColor.withValues(alpha: 0.15),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: iconColor, size: 22),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.manrope(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      titleUrdu,
                      style: GoogleFonts.notoNastaliqUrdu(
                        fontSize: 12,
                        color: AppColors.primaryOrange,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: GoogleFonts.manrope(
                    fontSize: 12,
                    color: isDark
                        ? AppColors.darkTextSecondary
                        : AppColors.lightTextSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: AppColors.primaryOrange.withValues(alpha: 0.12),
              borderRadius: BorderRadius.circular(6),
            ),
            child: Text(
              'Phase 2',
              style: GoogleFonts.manrope(
                fontSize: 10,
                fontWeight: FontWeight.bold,
                color: AppColors.primaryOrange,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
