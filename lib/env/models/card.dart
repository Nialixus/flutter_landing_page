part of '../env.dart';

@model
class CardModel extends DModel {
  const CardModel({
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
