part of '../env.dart';

class NavigationModel extends DModel {
  const NavigationModel({
    required this.id,
    required this.name,
    required this.activeIcon,
    required this.inactiveIcon,
  });

  final String id, name, activeIcon, inactiveIcon;

  static const NavigationModel starter = NavigationModel(
    id: 'get-started',
    name: 'Home',
    activeIcon: 'assets/image/icon_active_home.svg',
    inactiveIcon: 'assets/image/icon_inactive_home.svg',
  );

  static const NavigationModel features = NavigationModel(
    id: 'features',
    name: 'Features',
    activeIcon: 'assets/image/icon_active_features.svg',
    inactiveIcon: 'assets/image/icon_inactive_features.svg',
  );

  static const NavigationModel pricing = NavigationModel(
    id: 'pricing',
    name: 'Pricing',
    activeIcon: 'assets/image/icon_active_pricing.svg',
    inactiveIcon: 'assets/image/icon_inactive_pricing.svg',
  );

  static const NavigationModel faq = NavigationModel(
    id: 'faq',
    name: 'FAQ',
    activeIcon: 'assets/image/icon_active_faq.svg',
    inactiveIcon: 'assets/image/icon_inactive_faq.svg',
  );
}
