part of '../home.dart';

@model
class HomeFeaturesModel extends DModel {
  const HomeFeaturesModel({
    required this.source,
    required this.title,
    required this.subtitle,
  });

  @variable
  final String source;

  @variable
  final String title;

  @variable
  final String subtitle;
}
