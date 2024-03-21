import 'package:flutter/cupertino.dart';

abstract class ResponsiveStatefulScreen extends StatefulWidget {
  const ResponsiveStatefulScreen({super.key});
  Widget buildPortrait(BuildContext context);
  Widget buildLandscape(BuildContext context);
  @override
  State<ResponsiveStatefulScreen> createState() =>
      _ResponsiveStatefulScreenState();
}

class _ResponsiveStatefulScreenState extends State<ResponsiveStatefulScreen> {
  Orientation? lastOrientation;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _resetStateIfNeeded();
  }

  @override
  void didUpdateWidget(covariant ResponsiveStatefulScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    _resetStateIfNeeded();
  }

  void _resetStateIfNeeded() {
    final currentOrientation = MediaQuery.of(context).orientation;
    if (lastOrientation != null && lastOrientation != currentOrientation) {
      setState(() {});
    }
    lastOrientation = currentOrientation;
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return orientation == Orientation.landscape
        ? widget.buildLandscape(context)
        : widget.buildPortrait(context);
  }
}
