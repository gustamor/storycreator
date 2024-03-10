
import 'package:flutter/cupertino.dart';




abstract class ResponsiveStatelessScreen extends StatelessWidget {
  const ResponsiveStatelessScreen({super.key});

  Widget buildPortrait(BuildContext context);
  Widget buildLandscape(BuildContext context);

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;
    return  orientation == Orientation.landscape
        ? buildLandscape(context)
        : buildPortrait(context);
  }
}
