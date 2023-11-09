import 'package:flutter/material.dart';

class ExpansionTileWrapper extends StatefulWidget {
  const ExpansionTileWrapper(
    this.builder, {
    super.key,
  });
  final ExpansionTile Function(bool isExpanded) builder;

  @override
  State<ExpansionTileWrapper> createState() => _State();
}

class _State extends State<ExpansionTileWrapper> {
  late bool value = widget.builder(false).initiallyExpanded;

  @override
  Widget build(BuildContext context) {
    ExpansionTile child = widget.builder(value);
    return child.copyWith(onExpansionChanged: (value) {
      setState(() => this.value = value);
      child.onExpansionChanged?.call(this.value);
    });
  }
}

extension TileExtension on ExpansionTile {
  ExpansionTile copyWith({
    Key? key,
    Widget? leading,
    Widget? title,
    Widget? subtitle,
    void Function(bool)? onExpansionChanged,
    List<Widget>? children,
    Widget? trailing,
    bool? initiallyExpanded,
    bool? maintainState,
    EdgeInsetsGeometry? tilePadding,
    CrossAxisAlignment? expandedCrossAxisAlignment,
    Alignment? expandedAlignment,
    EdgeInsetsGeometry? childrenPadding,
    Color? backgroundColor,
    Color? collapsedBackgroundColor,
    Color? textColor,
    Color? collapsedTextColor,
    Color? iconColor,
    Color? collapsedIconColor,
    ShapeBorder? shape,
    ShapeBorder? collapsedShape,
    Clip? clipBehavior,
    ListTileControlAffinity? controlAffinity,
    ExpansionTileController? controller,
  }) {
    return ExpansionTile(
      key: key ?? this.key,
      leading: leading ?? this.leading,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      onExpansionChanged: onExpansionChanged ?? this.onExpansionChanged,
      trailing: trailing ?? this.trailing,
      initiallyExpanded: initiallyExpanded ?? this.initiallyExpanded,
      maintainState: maintainState ?? this.maintainState,
      tilePadding: tilePadding ?? this.tilePadding,
      expandedCrossAxisAlignment:
          expandedCrossAxisAlignment ?? this.expandedCrossAxisAlignment,
      expandedAlignment: expandedAlignment ?? this.expandedAlignment,
      childrenPadding: childrenPadding ?? this.childrenPadding,
      backgroundColor: backgroundColor ?? this.backgroundColor,
      collapsedBackgroundColor:
          collapsedBackgroundColor ?? this.collapsedBackgroundColor,
      textColor: textColor ?? this.textColor,
      collapsedTextColor: collapsedTextColor ?? this.collapsedTextColor,
      iconColor: iconColor ?? this.iconColor,
      collapsedIconColor: collapsedIconColor ?? this.collapsedIconColor,
      shape: shape ?? this.shape,
      collapsedShape: collapsedShape ?? this.collapsedShape,
      clipBehavior: clipBehavior ?? this.clipBehavior,
      controlAffinity: controlAffinity ?? this.controlAffinity,
      controller: controller ?? this.controller,
      children: children ?? this.children,
    );
  }
}
