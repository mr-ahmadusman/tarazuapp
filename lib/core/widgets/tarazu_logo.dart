import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants/app_colors.dart';
import '../constants/app_constants.dart';

class TarazuLogo extends StatelessWidget {
  final double size;
  final bool showText;
  final bool showUrdu;
  final bool isLightMode;

  const TarazuLogo({
    super.key,
    this.size = 100,
    this.showText = true,
    this.showUrdu = true,
    this.isLightMode = false,
  });

  @override
  Widget build(BuildContext context) {
    final textColor = isLightMode
        ? AppColors.lightTextPrimary
        : AppColors.darkTextPrimary;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Scale & Currency Logo Icon
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: const LinearGradient(
              colors: [Color(0xFF272A2D), Color(0xFF1D1F21)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.primaryOrange.withValues(alpha: 0.35),
                blurRadius: size * 0.25,
                spreadRadius: 2,
                offset: const Offset(0, 4),
              ),
              BoxShadow(
                color: AppColors.secondaryBlue.withValues(alpha: 0.2),
                blurRadius: size * 0.35,
                spreadRadius: -2,
                offset: const Offset(0, -2),
              ),
            ],
            border: Border.all(
              color: AppColors.primaryOrange.withValues(alpha: 0.4),
              width: 1.5,
            ),
          ),
          child: CustomPaint(
            size: Size(size, size),
            painter: _TarazuScalePainter(),
          ),
        ),

        if (showText) ...[
          SizedBox(height: size * 0.12),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                AppConstants.appName,
                style: GoogleFonts.manrope(
                  fontSize: size * 0.32,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 0.5,
                  color: textColor,
                ),
              ),
              if (showUrdu) ...[
                const SizedBox(width: 8),
                Text(
                  AppConstants.appNameUrdu,
                  style: GoogleFonts.notoNastaliqUrdu(
                    fontSize: size * 0.28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primaryOrange,
                  ),
                ),
              ],
            ],
          ),
        ],
      ],
    );
  }
}

class _TarazuScalePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final w = size.width;
    final h = size.height;

    // Paints
    final orangePaint = Paint()
      ..color = AppColors.primaryOrange
      ..style = PaintingStyle.fill;

    final bluePaint = Paint()
      ..color = AppColors.secondaryBlue
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.045
      ..strokeCap = StrokeCap.round;

    final strokePaint = Paint()
      ..color = AppColors.primaryOrange
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.05
      ..strokeCap = StrokeCap.round;

    final whiteStroke = Paint()
      ..color = Colors.white.withValues(alpha: 0.9)
      ..style = PaintingStyle.stroke
      ..strokeWidth = w * 0.035
      ..strokeCap = StrokeCap.round;

    // 1. Central Pillar Stand
    final pillarPath = Path()
      ..moveTo(center.dx, center.dy - h * 0.22)
      ..lineTo(center.dx, center.dy + h * 0.22);
    canvas.drawPath(pillarPath, bluePaint);

    // Pillar Base
    final baseRect = RRect.fromRectAndRadius(
      Rect.fromCenter(
        center: Offset(center.dx, center.dy + h * 0.22),
        width: w * 0.32,
        height: h * 0.07,
      ),
      Radius.circular(w * 0.03),
    );
    canvas.drawRRect(baseRect, orangePaint);

    // 2. Horizontal Balance Beam
    final beamPath = Path()
      ..moveTo(center.dx - w * 0.28, center.dy - h * 0.16)
      ..quadraticBezierTo(
        center.dx,
        center.dy - h * 0.20,
        center.dx + w * 0.28,
        center.dy - h * 0.16,
      );
    canvas.drawPath(beamPath, strokePaint);

    // 3. Central Dial Indicator / Currency Badge
    canvas.drawCircle(
      Offset(center.dx, center.dy - h * 0.18),
      w * 0.09,
      orangePaint,
    );
    canvas.drawCircle(
      Offset(center.dx, center.dy - h * 0.18),
      w * 0.09,
      whiteStroke,
    );

    // Small scale needle in central dial
    final needlePath = Path()
      ..moveTo(center.dx, center.dy - h * 0.18)
      ..lineTo(center.dx + w * 0.04, center.dy - h * 0.23);
    canvas.drawPath(
      needlePath,
      Paint()
        ..color = AppColors.charcoal
        ..strokeWidth = w * 0.035
        ..strokeCap = StrokeCap.round,
    );

    // 4. Left Chain & Scale Pan (Holds Weight Block)
    final leftTop = Offset(center.dx - w * 0.26, center.dy - h * 0.16);
    final leftPan = Offset(center.dx - w * 0.26, center.dy + h * 0.06);

    // Left chains
    canvas.drawLine(
      leftTop,
      Offset(leftPan.dx - w * 0.07, leftPan.dy),
      whiteStroke,
    );
    canvas.drawLine(
      leftTop,
      Offset(leftPan.dx + w * 0.07, leftPan.dy),
      whiteStroke,
    );

    // Left Pan Bowl
    final leftBowl = Path()
      ..moveTo(leftPan.dx - w * 0.1, leftPan.dy)
      ..quadraticBezierTo(
        leftPan.dx,
        leftPan.dy + h * 0.09,
        leftPan.dx + w * 0.1,
        leftPan.dy,
      );
    canvas.drawPath(leftBowl, orangePaint);

    // 5. Right Chain & Scale Pan (Holds Currency Coin / Rs symbol)
    final rightTop = Offset(center.dx + w * 0.26, center.dy - h * 0.16);
    final rightPan = Offset(center.dx + w * 0.26, center.dy + h * 0.06);

    // Right chains
    canvas.drawLine(
      rightTop,
      Offset(rightPan.dx - w * 0.07, rightPan.dy),
      whiteStroke,
    );
    canvas.drawLine(
      rightTop,
      Offset(rightPan.dx + w * 0.07, rightPan.dy),
      whiteStroke,
    );

    // Right Pan Bowl
    final rightBowl = Path()
      ..moveTo(rightPan.dx - w * 0.1, rightPan.dy)
      ..quadraticBezierTo(
        rightPan.dx,
        rightPan.dy + h * 0.09,
        rightPan.dx + w * 0.1,
        rightPan.dy,
      );
    canvas.drawPath(rightBowl, orangePaint);

    // Currency Coin on Right Pan
    canvas.drawCircle(
      Offset(rightPan.dx, rightPan.dy - h * 0.04),
      w * 0.06,
      Paint()..color = AppColors.secondaryBlue,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
