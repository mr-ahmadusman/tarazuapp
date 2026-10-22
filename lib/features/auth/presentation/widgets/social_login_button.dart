import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_constants.dart';

class SocialLoginButton extends StatelessWidget {
  final VoidCallback onPressed;

  const SocialLoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return OutlinedButton(
      onPressed: onPressed,
      style: OutlinedButton.styleFrom(
        foregroundColor: isDark
            ? AppColors.darkTextPrimary
            : AppColors.lightTextPrimary,
        padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        side: BorderSide(
          color: isDark ? AppColors.darkBorder : AppColors.lightBorder,
          width: 1.2,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppConstants.borderRadiusMedium),
        ),
        backgroundColor: isDark
            ? AppColors.darkSurfaceVariant
            : AppColors.lightSurfaceVariant,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Google G Custom Painted Logo
          SizedBox(
            width: 20,
            height: 20,
            child: CustomPaint(painter: _GoogleLogoPainter()),
          ),
          const SizedBox(width: 12),
          Text(
            'Continue with Google (Preview)',
            style: GoogleFonts.manrope(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}

class _GoogleLogoPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;

    final red = Paint()..color = const Color(0xFEEA4335);
    final blue = Paint()..color = const Color(0xFE4285F4);
    final yellow = Paint()..color = const Color(0xFEFBBC05);
    final green = Paint()..color = const Color(0xFE34A853);

    final center = Offset(w / 2, h / 2);
    final radius = w / 2;

    // Red arc (top)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -0.8,
      2.0,
      true,
      red,
    );

    // Yellow arc (left)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      1.2,
      1.8,
      true,
      yellow,
    );

    // Green arc (bottom)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      2.5,
      1.5,
      true,
      green,
    );

    // Blue arc + bar (right)
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      0.2,
      1.2,
      true,
      blue,
    );

    // Center cutout
    canvas.drawCircle(center, radius * 0.55, Paint()..color = Colors.white);

    // Blue horizontal bar
    canvas.drawRect(Rect.fromLTWH(w * 0.45, h * 0.4, w * 0.55, h * 0.22), blue);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
