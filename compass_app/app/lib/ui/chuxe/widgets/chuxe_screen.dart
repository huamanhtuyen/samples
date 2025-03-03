// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routing/routes.dart';
import '../view_models/chuxe_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../ui/core/localization/applocalization.dart';

class ChuXeScreen extends StatefulWidget {
  const ChuXeScreen({super.key, required this.viewModel});

  final ChuXeViewModel viewModel; // Biến viewModel

  @override
  State<ChuXeScreen> createState() => _ExampleStaggeredAnimationsState();
}

class _ExampleStaggeredAnimationsState extends State<ChuXeScreen>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(
            context,
          ).scaffoldBackgroundColor, // Use theme background color
      appBar: _buildAppBar(context), // Pass context to _buildAppBar
      body: Stack(children: [_buildContent()]), // Xây dựng nội dung và drawer
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.arrow_back),
        onPressed: () => context.pop(),
      ),
      title: SvgPicture.asset(
        'assets/logo.svg',
        height: 30, // Adjust the height as needed
        fit: BoxFit.contain,
      ),
      backgroundColor:
          Theme.of(
            context,
          ).appBarTheme.backgroundColor, // Use theme app bar color
      elevation: 0.0,
      automaticallyImplyLeading: false,
    );
  }

  //build phần content
  Widget _buildContent() {
    final localizations = AppLocalization.of(context);
    final cacChucNang = [
      {
        'title': localizations.chuxePostVehicle,
        'description': localizations.chuxePostVehicleDesc,
        'route': '${Routes.thongTinXe}/add',
      },
      {
        'title': localizations.chuxeReturnCargo,
        'description': localizations.chuxeReturnCargoDesc,
        'route': Routes.baoCanHang,
      },
      {
        'title': localizations.chuxeFindCargo,
        'description': localizations.chuxeFindCargoDesc,
        'route': Routes.hocSinh,
      },
      {
        'title': localizations.chuxeEmptyVehicle,
        'description': localizations.chuxeEmptyVehicleDesc,
        'route': Routes.hocSinh,
      },
      {
        'title': localizations.chuxeTrackVehicle,
        'description': localizations.chuxeTrackVehicleDesc,
        'route': Routes.hocSinh,
      },
      {
        'title': localizations.chuxeBusinessInfo,
        'description': localizations.chuxeBusinessInfoDesc,
        'route': Routes.hocSinh,
      },
    ];

    return Container(
      color: Colors.white, // Đặt màu nền cho Container
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 200),
        itemCount: cacChucNang.length,
        itemBuilder: (context, index) {
          final chucNang = cacChucNang[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 0, // Remove shadow
            color: Theme.of(context).colorScheme.onPrimary, //khá đẹp
            child: ListTile(
              leading: Icon(
                Icons.apps,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                chucNang['title']!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                chucNang['description']!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                // Điều hướng tới các trang tương ứng
                context.go(chucNang['route']!);
              },
            ),
          );
        },
      ),
    );
  } //end _buildContent
}
