import 'package:flutter/widgets.dart';

class ValueProvider<T extends Object> extends InheritedWidget {
  const ValueProvider({
    super.key,
    required this.value,
    required Widget child,
  }) : super(child: child);

  final T value;

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => false;

  static T of<T extends Object>(BuildContext context) {
    final widget =
        context.dependOnInheritedWidgetOfExactType<ValueProvider<T>>();
    if (widget == null) {
      throw FlutterError("No ValueProvider<$T> found in context");
    }
    return widget.value;
  }
}
