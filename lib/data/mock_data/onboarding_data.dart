import '../../core/widgets/tarazu_illustrations.dart';
import '../models/onboarding_item.dart';

class OnboardingData {
  OnboardingData._();

  static final List<OnboardingItem> items = [
    const OnboardingItem(
      title: 'Smart Precision Weighing',
      titleUrdu: 'درست اور اسمارٹ وزن',
      description: 'Calculate product prices by weight automatically with zero errors. Essential for grocery stores, market stalls, and vendors.',
      descriptionUrdu: 'وزن کے حساب سے پروڈکٹ کی قیمت فوراً معلوم کریں۔ کریانہ اور فروٹ شاپس کے لیے بہترین۔',
      illustrationWidget: SmartWeighingIllustration(),
    ),
    const OnboardingItem(
      title: 'Instant Budget Calculation',
      titleUrdu: 'بجٹ کے مطابق فوری حساب',
      description: 'Enter customer budget to instantly calculate exact weight required. No mental math or scale adjustments needed.',
      descriptionUrdu: 'گاہک کے بجٹ کے مطابق درکار وزن فوری معلوم کریں۔ بغیر کسی دشواری اور غلطی کے۔',
      illustrationWidget: PriceCalculationIllustration(),
    ),
    const OnboardingItem(
      title: 'Personal Product Catalogue',
      titleUrdu: 'آپ کی اپنی پروڈکٹس لسٹ',
      description: 'Manage your items, default prices per kg, custom categories, and quick selection items for faster shop trade.',
      descriptionUrdu:
          'اپنی شاپ کی تمام پروڈکٹس اور ریٹس محفوظ کریں اور وقت بچائیں۔',
      illustrationWidget: ProductCatalogueIllustration(),
    ),
  ];
}
