// Import các thư viện cần thiết từ Flutter và Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import các repository và model cần thiết
import '../../core/ui/error_indicator.dart';
import '../view_models/hocsinh_viewmodel.dart';

// Định nghĩa một StatefulWidget có tên là HocSinhScreen
class HocSinhScreen extends StatefulWidget {
  // Constructor của HocSinhScreen
  const HocSinhScreen({super.key});

  @override
  State<HocSinhScreen> createState() => _HocSinhScreenState();
} //class

class _HocSinhScreenState extends State<HocSinhScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Hoc Sinh Screen')),
      // Sử dụng Consumer để lắng nghe sự thay đổi từ viewModel
      body: Consumer<HocSinhViewModel>(
        builder: (context, viewModel, child) {
          // Nếu lệnh load đang chạy, hiển thị chỉ báo tiến trình
          if (viewModel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          // Nếu lệnh load gặp lỗi, hiển thị thông báo lỗi
          if (viewModel.load.error) {
            return Center(
              child: ErrorIndicator(
                title: 'Failed to load data',
                label: 'Try Again',
                onPressed: viewModel.load.execute,
              ),
            );
          }
          // Nếu không có dữ liệu, hiển thị thông báo không có dữ liệu
          if (viewModel.hocsinhs.isEmpty) {
            return Center(child: Text('No data available'));
          }
          // Hiển thị danh sách học sinh
          return Expanded(
            child: ListView.builder(
              itemCount: viewModel.hocsinhs.length,
              itemBuilder: (context, index) {
                final hocSinh = viewModel.hocsinhs[index];
                return ListTile(
                  title: Text(hocSinh.hoten),
                  subtitle: Text('ID: ${hocSinh.id}'),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
