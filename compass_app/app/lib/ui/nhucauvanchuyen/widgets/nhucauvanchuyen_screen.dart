// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/nhucauvanchuyen_viewmodel.dart';
import '../../core/ui/error_indicator.dart';
import 'package:go_router/go_router.dart';

class NhuCauVanChuyenScreen extends StatefulWidget {
  const NhuCauVanChuyenScreen({super.key});

  @override
  State<NhuCauVanChuyenScreen> createState() => _NhuCauVanChuyenScreenState();
}

class _NhuCauVanChuyenScreenState extends State<NhuCauVanChuyenScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Nhu Cau Van Chuyen Screen')),
      body: Consumer<NhuCauVanChuyenViewModel>(
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
          if (viewModel.nhuCauVanChuyens.isEmpty) {
            return Center(child: Text('No data available'));
          }
          return ListView.builder(
            itemCount: viewModel.nhuCauVanChuyens.length,
            itemBuilder: (context, index) {
              final nhuCauVanChuyen = viewModel.nhuCauVanChuyens[index];
              return ListTile(
                title: Text(nhuCauVanChuyen.mota ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${nhuCauVanChuyen.id}'),
                    Text('Anh1: ${nhuCauVanChuyen.anh1}'),
                    Text('Anh2: ${nhuCauVanChuyen.anh2}'),
                    Text('Anh3: ${nhuCauVanChuyen.anh3}'),
                    Text('Anh4: ${nhuCauVanChuyen.anh4}'),
                    Text('Anh5: ${nhuCauVanChuyen.anh5}'),
                    Text('Anh6: ${nhuCauVanChuyen.anh6}'),
                    Text('Anh7: ${nhuCauVanChuyen.anh7}'),
                    Text('Anh8: ${nhuCauVanChuyen.anh8}'),
                    Text('Anh9: ${nhuCauVanChuyen.anh9}'),
                    Text('Matinhxuatphat: ${nhuCauVanChuyen.matinhxuatphat}'),
                    Text('Matinhdich: ${nhuCauVanChuyen.matinhdich}'),
                    Text('Kichthuoc: ${nhuCauVanChuyen.kichthuoc}'),
                    Text('Trongluong: ${nhuCauVanChuyen.trongluong}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        final result = await context.push(
                          '/nhucauvanchuyen/edit',
                          extra: nhuCauVanChuyen,
                        );
                        if (result == true) {
                          if (mounted) {
                            context
                                .read<NhuCauVanChuyenViewModel>()
                                .load
                                .execute();
                          }
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
                                'Are you sure you want to delete this nhu cau van chuyen?',
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
                          viewModel.deleteNhuCauVanChuyen.execute(
                            nhuCauVanChuyen.id ?? 0,
                          );
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
          final result = await context.push('/nhucauvanchuyen/add');
          if (result == true) {
            if (mounted) {
              context.read<NhuCauVanChuyenViewModel>().load.execute();
            }
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
