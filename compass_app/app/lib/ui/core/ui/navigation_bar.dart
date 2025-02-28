import 'package:flutter/material.dart';
import '../localization/applocalization.dart';

class NavigationBars extends StatefulWidget {
  const NavigationBars({
    super.key,
    this.onSelectItem,
    required this.selectedIndex,
    this.isBadgeExample = false,
  });

  final void Function(int)? onSelectItem;
  final int selectedIndex;

  final bool isBadgeExample;

  @override
  State<NavigationBars> createState() => _NavigationBarsState();
}

class _NavigationBarsState extends State<NavigationBars> {
  late int selectedIndex;

  @override
  void initState() {
    super.initState();
    selectedIndex = widget.selectedIndex;
  }

  @override
  void didUpdateWidget(covariant NavigationBars oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.selectedIndex != oldWidget.selectedIndex) {
      selectedIndex = widget.selectedIndex;
    }
  }

  @override
  Widget build(BuildContext context) {
    final appLoc = AppLocalization.of(context);

    // App NavigationBar should get first focus.
    final Widget navigationBar = Focus(
      autofocus: !(widget.isBadgeExample),
      child: NavigationBar(
        selectedIndex: selectedIndex,
        onDestinationSelected: (index) {
          setState(() {
            selectedIndex = index;
          });
          widget.onSelectItem!(index);
        },
        destinations: [
          NavigationDestination(
            tooltip: '',
            icon: Icon(Icons.home_outlined),
            label: appLoc.navHome,
            selectedIcon: Icon(Icons.home),
          ),
          NavigationDestination(
            tooltip: '',
            icon: Icon(Icons.location_on_outlined),
            label: appLoc.navTrip,
            selectedIcon: Icon(Icons.location_on),
          ),
          NavigationDestination(
            tooltip: '',
            icon: Icon(Icons.history_outlined),
            label: appLoc.navTransaction,
            selectedIcon: Icon(Icons.history),
          ),
        ],
      ),
    );

    return navigationBar;
  }
}
