import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lucide_icons_flutter/lucide_icons.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../../../core/widgets/custom_text_field.dart';

class ForgotPasswordSheet extends StatefulWidget {
  const ForgotPasswordSheet({super.key});

  @override
  State<ForgotPasswordSheet> createState() => _ForgotPasswordSheetState();
}

class _ForgotPasswordSheetState extends State<ForgotPasswordSheet> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  bool _isSubmitted = false;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _handleSubmit() {
    if (_formKey.currentState?.validate() ?? false) {
      setState(() {
        _isSubmitted = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(
        bottom:
            MediaQuery.of(context).viewInsets.bottom +
            AppConstants.paddingLarge,
        top: AppConstants.paddingLarge,
        left: AppConstants.paddingLarge,
        right: AppConstants.paddingLarge,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.darkSurface : AppColors.lightSurface,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(AppConstants.borderRadiusXLarge),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Drag Handle
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Title
          Row(
            children: [
              const Icon(
                LucideIcons.keyRound,
                color: AppColors.primaryOrange,
                size: 24,
              ),
              const SizedBox(width: 12),
              Text(
                'Reset Password',
                style: GoogleFonts.manrope(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDark
                      ? AppColors.darkTextPrimary
                      : AppColors.lightTextPrimary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),

          Text(
            'Enter your registered email or phone number to receive a demo reset link.',
            style: GoogleFonts.manrope(
              fontSize: 14,
              color: isDark
                  ? AppColors.darkTextSecondary
                  : AppColors.lightTextSecondary,
            ),
          ),
          const SizedBox(height: 20),

          if (_isSubmitted) ...[
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.primaryOrange.withValues(alpha: 0.12),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: AppColors.primaryOrange),
              ),
              child: Row(
                children: [
                  const Icon(
                    LucideIcons.circleCheck,
                    color: AppColors.primaryOrange,
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Text(
                      'Demo Reset Link Sent! Check your inbox or phone SMS.',
                      style: GoogleFonts.manrope(
                        fontSize: 13,
                        fontWeight: FontWeight.w600,
                        color: isDark
                            ? AppColors.darkTextPrimary
                            : AppColors.lightTextPrimary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: 'Close',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ] else ...[
            Form(
              key: _formKey,
              child: CustomTextField(
                controller: _emailController,
                label: 'Phone or Email Address',
                hint: '03001234567 or user@example.com',
                prefixIcon: LucideIcons.mail,
                validator: (value) {
                  if (value == null || value.trim().isEmpty) {
                    return 'Please enter phone or email address';
                  }
                  return null;
                },
              ),
            ),
            const SizedBox(height: 24),
            CustomButton(text: 'Send Reset Link', onPressed: _handleSubmit),
          ],
        ],
      ),
    );
  }
}
