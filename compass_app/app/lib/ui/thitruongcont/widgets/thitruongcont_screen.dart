// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import '../../chothuecont/widgets/chothuecont_screen.dart';
import '../../canthuecont/widgets/canthuecont_screen.dart';

class ThiTruongContScreen extends StatefulWidget {
  const ThiTruongContScreen({super.key});

  @override
  State<ThiTruongContScreen> createState() => _ThiTruongContScreenState();
}

class _ThiTruongContScreenState extends State<ThiTruongContScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thị trường container'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Cho Thuê Container'),
            Tab(text: 'Cần Thuê Container'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChoThueContScreen(excludeScaffold: true),
          CanThueContScreen(excludeScaffold: true),
        ],
      ),
    );
  }
}
