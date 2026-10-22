import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../core/constants/app_colors.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/routing/app_router.dart';
import '../../../core/widgets/tarazu_logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _navigationTimer;

  @override
  void initState() {
    super.initState();
    _startSplashTimer();
  }

  void _startSplashTimer() {
    _navigationTimer = Timer(const Duration(milliseconds: 2400), () {
      if (mounted) {
        context.go(AppRoutes.onboarding);
      }
    });
  }

  void _skipSplash() {
    _navigationTimer?.cancel();
    if (mounted) {
      context.go(AppRoutes.onboarding);
    }
  }

  @override
  void dispose() {
    _navigationTimer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.darkBackground,
      body: GestureDetector(
        onTap: _skipSplash,
        behavior: HitTestBehavior.opaque,
        child: Stack(
          children: [
            // Ambient Radial Background Glow
            Positioned.fill(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.darkBackgroundGlow,
                ),
              ),
            ),

            // Subtle Background Radial Accent Orbs
            Positioned(
              top: -80,
              right: -80,
              child: Container(
                width: 260,
                height: 260,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.primaryOrange.withValues(alpha: 0.12),
                ),
              ),
            ),
            Positioned(
              bottom: -100,
              left: -80,
              child: Container(
                width: 300,
                height: 300,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.secondaryBlue.withValues(alpha: 0.1),
                ),
              ),
            ),

            // Central Branding Content
            SafeArea(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: AppConstants.paddingLarge,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Spacer(),

                      // Animated Tarazu Scale & Currency Logo Reveal
                      const TarazuLogo(
                            size: 130,
                            showText: false,
                            showUrdu: false,
                          )
                          .animate()
                          .scale(
                            duration: 800.ms,
                            curve: Curves.easeOutBack,
                            begin: const Offset(0.5, 0.5),
                            end: const Offset(1.0, 1.0),
                          )
                          .fadeIn(duration: 600.ms),

                      const SizedBox(height: 32),

                      // App Title - Tarazu
                      Text(
                            AppConstants.appName,
                            style: GoogleFonts.manrope(
                              fontSize: 40,
                              fontWeight: FontWeight.w800,
                              color: AppColors.darkTextPrimary,
                              letterSpacing: 1.0,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 300.ms, duration: 600.ms)
                          .slideY(begin: 0.3, end: 0.0, curve: Curves.easeOut),

                      const SizedBox(height: 4),

                      // Urdu Name - ترازو
                      Text(
                            AppConstants.appNameUrdu,
                            style: GoogleFonts.notoNastaliqUrdu(
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primaryOrange,
                            ),
                          )
                          .animate()
                          .fadeIn(delay: 500.ms, duration: 600.ms)
                          .slideY(begin: 0.3, end: 0.0, curve: Curves.easeOut),

                      const SizedBox(height: 12),

                      // Tagline
                      Text(
                        AppConstants.appTagline,
                        style: GoogleFonts.manrope(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: AppColors.darkTextSecondary,
                          letterSpacing: 0.5,
                        ),
                        textAlign: TextAlign.center,
                      ).animate().fadeIn(delay: 700.ms, duration: 600.ms),

                      const Spacer(),

                      // Progress Indicator & Tap to skip prompt
                      Column(
                        children: [
                          const SizedBox(
                            width: 32,
                            height: 32,
                            child: CircularProgressIndicator(
                              strokeWidth: 3,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.primaryOrange,
                              ),
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'Tap anywhere to skip',
                            style: GoogleFonts.manrope(
                              fontSize: 12,
                              color: AppColors.darkTextSecondary.withValues(
                                alpha: 0.7,
                              ),
                            ),
                          ),
                        ],
                      ).animate().fadeIn(delay: 900.ms, duration: 500.ms),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
