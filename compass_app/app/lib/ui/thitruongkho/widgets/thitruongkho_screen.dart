// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import '../../chothuekho/widgets/chothuekho_list_screen.dart';
import '../../canthuekho/widgets/canthuekho_list_screen.dart';

class ThiTruongKhoScreen extends StatefulWidget {
  const ThiTruongKhoScreen({super.key});

  @override
  State<ThiTruongKhoScreen> createState() => _ThiTruongKhoScreenState();
}

class _ThiTruongKhoScreenState extends State<ThiTruongKhoScreen>
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
        title: const Text('Thị trường kho bãi'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Cho Thuê Kho'), Tab(text: 'Cần Thuê Kho')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [
          ChoThueKhoListScreen(excludeScaffold: true),
          CanThueKhoListScreen(excludeScaffold: true),
        ],
      ),
    );
  }
}
