// ignore_for_file: directives_ordering

// Import các thư viện cần thiết từ Flutter và Provider
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// Import các repository và model cần thiết
import '../../core/ui/error_indicator.dart';
import '../view_models/hocsinh_viewmodel.dart';
//import 'add_hocsinh_screen.dart'; // Import the new screen for adding a student
import 'package:go_router/go_router.dart';

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
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: Icon(Icons.edit),
                        onPressed: () async {
                          final result = await context.push(
                            '/hocsinh/edit',
                            extra: hocSinh,
                          );
                          if (result == true) {
                            if (mounted)
                              context.read<HocSinhViewModel>().load.execute();
                          }
                        },
                      ),
                      IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () async {
                          final confirm = await showDialog<bool>(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Text('Confirm Delete'),
                                content: Text(
                                  'Are you sure you want to delete this student?',
                                ),
                                actions: [
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(false),
                                    child: Text('Cancel'),
                                  ),
                                  TextButton(
                                    onPressed:
                                        () => Navigator.of(context).pop(true),
                                    child: Text('Delete'),
                                  ),
                                ],
                              );
                            },
                          );
                          if (confirm == true) {
                            viewModel.deleteHocSinh.execute(hocSinh.id ?? 0);
                          }
                        },
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push('/hocsinh/add');
          if (result == true) {
            if (mounted) context.read<HocSinhViewModel>().load.execute();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
