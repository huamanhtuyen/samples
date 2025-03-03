// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routing/routes.dart';
import '../view_models/chuxe_viewmodel.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
    final cacChucNang = [];
    cacChucNang.add({
      'title': 'Đăng thông tin xe',
      'description': 'Đăng thông tin xe',
      'route': '${Routes.thongTinXe}/add',
    });
    cacChucNang.add({
      'title': 'Báo cần hàng chiều về',
      'description': 'Thông báo xe cần hàng chiều về tới tất cả các chủ hàng',
      'route': Routes.baoCanHang,
    });
    cacChucNang.add({
      'title': 'Tìm hàng cần chở',
      'description': 'Xem danh sách hàng hóa cần chở trong thị trường',
      'route': Routes.hocSinh,
    });
    cacChucNang.add({
      'title': 'Thông báo xe trống',
      'description': 'Thông báo xe trống đang cần hàng tới tất cả chủ hàng',
      'route': Routes.hocSinh,
    });
    cacChucNang.add({
      'title': 'Theo dõi vị trí xe',
      'description': 'Theo dõi vị trí tất cả các xe của đơn vị mình',
      'route': Routes.hocSinh,
    });
    cacChucNang.add({
      'title': 'Thông tin doanh nghiệp',
      'description':
          'Cập nhật chi tiết thông tin doanh nghiệp (để in hợp đồng vận tải)',
      'route': Routes.hocSinh,
    });

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
