import 'package:flutter/material.dart';
import 'package:ostad/presentation/widgets/desktop_ui.dart';
import 'package:ostad/presentation/widgets/mobile_ui.dart';
import 'package:ostad/presentation/widgets/tablet_ui.dart';

import '../widgets/responsive_builder.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      mobile: MobileUi(),
      tablet: TabletUi(),
      desktop: DesktopUi(),
    );
  }
}
