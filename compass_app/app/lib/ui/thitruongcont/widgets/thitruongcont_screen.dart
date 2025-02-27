// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../chothuecont/view_models/chothuecont_viewmodel.dart';
import '../../canthuecont/view_models/canthuecont_viewmodel.dart';
import 'chothuecont_tab.dart';
import 'canthuecont_tab.dart';

class ThiTruongContScreen extends StatefulWidget {
  const ThiTruongContScreen({super.key});

  @override
  State<ThiTruongContScreen> createState() => _ThiTruongContScreenState();
}

class _ThiTruongContScreenState extends State<ThiTruongContScreen>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);

    // Tải dữ liệu cho cả hai tab khi màn hình được khởi tạo
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<ChoThueContViewModel>().load.execute();
      context.read<CanThueContViewModel>().load.execute();
    });
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
        title: Text('Thị trường cont'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [Tab(text: 'Cho thuê cont'), Tab(text: 'Cần thuê cont')],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: const [ChoThueContTab(), CanThueContTab()],
      ),
    );
  }
}
