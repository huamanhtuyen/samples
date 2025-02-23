// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:go_router/go_router.dart';
import '../view_models/baocanhang_viewmodel.dart';
import '../../core/ui/error_indicator.dart';

class BaoCanHangScreen extends StatefulWidget {
  const BaoCanHangScreen({super.key});

  @override
  State<BaoCanHangScreen> createState() => _BaoCanHangScreenState();
}

class _BaoCanHangScreenState extends State<BaoCanHangScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Bao Can Hang Screen')),
      body: Consumer<BaoCanHangViewModel>(
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
          if (viewModel.baoCanHangs.isEmpty) {
            return Center(child: Text('No data available'));
          }
          return ListView.builder(
            itemCount: viewModel.baoCanHangs.length,
            itemBuilder: (context, index) {
              final baoCanHang = viewModel.baoCanHangs[index];
              return ListTile(
                title: Text(baoCanHang.biensoxe ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${baoCanHang.id}'),
                    Text('Email: ${baoCanHang.email}'),
                    Text('Bienso: ${baoCanHang.biensoxe}'),
                    Text('Chieu ve tu Ma Tinh: ${baoCanHang.chieuvetu_matinh}'),
                    Text('Chieu ve tu Ten Tinh Tieng Anh: ${baoCanHang.chieuvetu_tentinh_tienganh}'),
                    Text('Chieu ve tu Ten Tinh Tieng Viet: ${baoCanHang.chieuvetu_tentinh_tiengviet}'),
                    Text('Chieu ve tu Ten Tinh Tieng Thai: ${baoCanHang.chieuvetu_tentinh_tiengthai}'),
                    Text('Chieu ve tu Ten Tinh Tieng Trung: ${baoCanHang.chieuvetu_temtinh_tiengtrung}'),
                    Text('Ve den Ma Tinh: ${baoCanHang.veden_matinh}'),
                    Text('Ve den Ten Tinh Tieng Anh: ${baoCanHang.veden_tentinh_tienganh}'),
                    Text('Ve den Ten Tinh Tieng Viet: ${baoCanHang.veden_tentinh_tiengviet}'),
                    Text('Ve den Ten Tinh Tieng Thai: ${baoCanHang.veden_tentinh_tiengthai}'),
                    Text('Ve den Ten Tinh Tieng Trung: ${baoCanHang.veden_temtinh_tiengtrung}'),
                    Text('Gia nhan: ${baoCanHang.gianhan}'),
                    Text('Gia nhan DVT: ${baoCanHang.gianhandvt}'),
                    Text('Ngay doi toi da: ${baoCanHang.ngaydoitoida}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        final result = await context.push(
                          '/baocanhang/edit',
                          extra: baoCanHang,
                        );
                        if (result == true) {
                          if (mounted) context.read<BaoCanHangViewModel>().load.execute();
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
                              content: Text('Are you sure you want to delete this bao can hang?'),
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
                          viewModel.deleteBaoCanHang.execute(baoCanHang.id ?? 0);
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
          final result = await context.push('/baocanhang/add');
          if (result == true) {
            if (mounted) context.read<BaoCanHangViewModel>().load.execute();
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
