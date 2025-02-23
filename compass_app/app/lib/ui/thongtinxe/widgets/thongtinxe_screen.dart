// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../view_models/thongtinxe_viewmodel.dart';
import '../../core/ui/error_indicator.dart';

class ThongTinXeScreen extends StatefulWidget {
  const ThongTinXeScreen({super.key});

  @override
  State<ThongTinXeScreen> createState() => _ThongTinXeScreenState();
}

class _ThongTinXeScreenState extends State<ThongTinXeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Thong Tin Xe Screen')),
      body: Consumer<ThongTinXeViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (viewModel.load.error) {
            return Center(
              child: ErrorIndicator(
                title: 'Failed to load data',
                label: 'Try Again',
                onPressed: viewModel.load.execute,
              ),
            );
          }
          if (viewModel.thongTinXes.isEmpty) {
            return Center(child: Text('No data available'));
          }
          return ListView.builder(
            itemCount: viewModel.thongTinXes.length,
            itemBuilder: (context, index) {
              final thongTinXe = viewModel.thongTinXes[index];
              return ListTile(
                title: Text(thongTinXe.bienso ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${thongTinXe.id}'),
                    Text('Anh1: ${thongTinXe.anh1}'),
                    Text('Anh2: ${thongTinXe.anh2}'),
                    Text('Anh3: ${thongTinXe.anh3}'),
                    Text('Anh4: ${thongTinXe.anh4}'),
                    Text('Anh5: ${thongTinXe.anh5}'),
                    Text('Anh6: ${thongTinXe.anh6}'),
                    Text('Anh7: ${thongTinXe.anh7}'),
                    Text('Anh8: ${thongTinXe.anh8}'),
                    Text('Anh9: ${thongTinXe.anh9}'),
                    Text('Matinh: ${thongTinXe.matinh}'),
                    Text('Tentinh Tieng Anh: ${thongTinXe.tentinh_tienganh}'),
                    Text('Tentinh Tieng Viet: ${thongTinXe.tentinh_tiengviet}'),
                    Text('Tentinh Tieng Thai: ${thongTinXe.tentinh_tiengthai}'),
                    Text('Tentinh Tieng Trung: ${thongTinXe.temtinh_tiengtrung}'),
                    Text('Maquan: ${thongTinXe.maquan}'),
                    Text('Tenquan Tieng Anh: ${thongTinXe.tenquan_tienganh}'),
                    Text('Tenquan Tieng Viet: ${thongTinXe.tenquan_tiengviet}'),
                    Text('Tenquan Tieng Thai: ${thongTinXe.tenquan_tiengthai}'),
                    Text('Tenquan Tieng Trung: ${thongTinXe.tenquan_tiengtrung}'),
                    Text('Diachi Chi Tiet: ${thongTinXe.diachichitiet}'),
                    Text('Bienso: ${thongTinXe.bienso}'),
                    Text('Maloaixe: ${thongTinXe.maloaixe}'),
                    Text('Tenloaixe Tieng Anh: ${thongTinXe.tenloaixe_tienganh}'),
                    Text('Tenloaixe Tieng Viet: ${thongTinXe.tenloaixe_tiengviet}'),
                    Text('Tenloaixe Tieng Trung: ${thongTinXe.tenloaixe_tiengtrung}'),
                    Text('Tenloaixe Tieng Thai: ${thongTinXe.tenloaixe_tiengthai}'),
                    Text('Taitrong Tan: ${thongTinXe.taitrong_tan}'),
                    Text('Taitrong M3: ${thongTinXe.taitrong_m3}'),
                    Text('Kichthuoc Cont: ${thongTinXe.kichthuoccont}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        final result = await context.push(
                          '/thongtinxe/edit',
                          extra: thongTinXe,
                        );
                        if (result == true) {
                          if (mounted) context.read<ThongTinXeViewModel>().load.execute();
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
                              content: Text('Are you sure you want to delete this thong tin xe?'),
                              actions: [
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(false),
                                  child: Text('Cancel'),
                                ),
                                TextButton(
                                  onPressed: () => Navigator.of(context).pop(true),
                                  child: Text('Delete'),
                                ),
                              ],
                            );
                          },
                        );
                        if (confirm == true) {
                          viewModel.deleteThongTinXe.execute(thongTinXe.id ?? 0);
                        }
                      },
                    ),
                  ],
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push('/thongtinxe/add');
          if (result == true) {
            if (mounted) context.read<ThongTinXeViewModel>().load.execute();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
