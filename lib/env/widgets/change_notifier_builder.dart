import 'package:flutter/material.dart';

/// A widget that listens to changes in a [ChangeNotifier] and rebuilds its
/// child widgets based on the changes.
class ChangeNotifierBuilder<T extends ChangeNotifier?> extends StatelessWidget {
  /// Creates a [ChangeNotifierBuilder] widget.
  ///
  /// The [ChangeNotifierBuilder] listens to changes in the provided [value],
  /// which should be a subclass of [ChangeNotifier]. When changes occur, it calls
  /// `setState` to trigger a rebuild of the widget, allowing you to update the UI
  /// based on the changes in the [ChangeNotifier].
  ///
  /// The [value] is the instance of the [ChangeNotifier] to listen to.
  ///
  /// The [builder] function provides the updated [value] and an optional [child]
  /// widget to include within the rebuilt widget. The [builder] is called whenever
  /// the [value] changes.
  ///
  /// The [child] is an optional widget that you can provide to include within
  /// the rebuilt widget, typically for layout purposes.
  ///
  /// Example:
  ///
  /// ```dart
  /// ChangeNotifierBuilder(
  ///   value: yourChangeNotifierInstance,
  ///   builder: (context, value, child) {
  ///     // Build your UI based on the value of MyChangeNotifier
  ///     return SomeWidget(value: value);
  ///   },
  ///   child: AnotherWidget(),
  /// )
  /// ```
  ///
  /// See also:
  ///
  /// - [ChangeNotifier], which is a base class for objects that provide
  ///   notification when they are modified.
  const ChangeNotifierBuilder({
    Key? key,
    this.value,
    required this.builder,
    this.child = const SizedBox(),
  }) : super(key: key);

  /// The instance of [ChangeNotifier] to listen to for changes.
  final T? value;

  /// The builder function that provides the updated [value] and an optional [child].
  final Widget Function(BuildContext context, T? value, Widget child) builder;

  /// An optional child widget to include within the rebuilt widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (value != null) {
      return ListenableBuilder(
          listenable: value!,
          builder: (context, child) => builder(context, value, child!),
          child: child);
    } else {
      return builder(context, value, child);
    }
  }
}
