part of '../env.dart';

class Navigation {
  const Navigation({required this.id, required this.name});
  final String id;
  final String name;

  static const Navigation starter = Navigation(
    id: 'get-started',
    name: 'Home',
  );

  static const Navigation features = Navigation(
    id: 'features',
    name: 'Features',
  );

  static const Navigation pricing = Navigation(
    id: 'pricing',
    name: 'Pricing',
  );

  static const Navigation faq = Navigation(
    id: 'faq',
    name: 'FAQ',
  );
}
