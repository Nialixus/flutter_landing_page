part of '../env.dart';

class NavigationModel {
  const NavigationModel({required this.id, required this.name});
  final String id;
  final String name;

  static const NavigationModel starter = NavigationModel(
    id: 'get-started',
    name: 'Home',
  );

  static const NavigationModel features = NavigationModel(
    id: 'features',
    name: 'Features',
  );

  static const NavigationModel pricing = NavigationModel(
    id: 'pricing',
    name: 'Pricing',
  );

  static const NavigationModel faq = NavigationModel(
    id: 'faq',
    name: 'FAQ',
  );
}
