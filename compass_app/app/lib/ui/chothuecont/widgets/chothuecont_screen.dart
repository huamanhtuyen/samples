// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/chothuecont_viewmodel.dart';
import '../../core/ui/error_indicator.dart';
import 'package:go_router/go_router.dart';

class ChoThueContScreen extends StatefulWidget {
  const ChoThueContScreen({super.key});

  @override
  State<ChoThueContScreen> createState() => _ChoThueContScreenState();
}

class _ChoThueContScreenState extends State<ChoThueContScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cho Thue Cont Screen')),
      body: Consumer<ChoThueContViewModel>(
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
          if (viewModel.choThueConts.isEmpty) {
            return Center(child: Text('No data available'));
          }
          return ListView.builder(
            itemCount: viewModel.choThueConts.length,
            itemBuilder: (context, index) {
              final choThueCont = viewModel.choThueConts[index];
              return ListTile(
                title: Text(choThueCont.mota ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${choThueCont.id}'),
                    Text('Ten Cong Ty: ${choThueCont.tencty}'),
                    Text('SDT1: ${choThueCont.sdt1}'),
                    Text('SDT2: ${choThueCont.sdt2}'),
                    Text('SDT3: ${choThueCont.sdt3}'),
                    Text('Ma Tinh: ${choThueCont.matinh}'),
                    Text(
                      'Ten Tinh (Tieng Viet): ${choThueCont.tentinhTiengviet}',
                    ),
                    Text(
                      'Ten Tinh (Tieng Anh): ${choThueCont.tentinhTienganh}',
                    ),
                    Text(
                      'Ten Tinh (Tieng Trung): ${choThueCont.tentinhTiengtrung}',
                    ),
                    Text(
                      'Ten Tinh (Tieng Thai): ${choThueCont.tentinhTiengthai}',
                    ),
                    Text('Ma Quan: ${choThueCont.maquan}'),
                    Text(
                      'Ten Quan (Tieng Viet): ${choThueCont.tenquanTiengviet}',
                    ),
                    Text(
                      'Ten Quan (Tieng Anh): ${choThueCont.tenquanTienganh}',
                    ),
                    Text(
                      'Ten Quan (Tieng Trung): ${choThueCont.tenquanTiengtrung}',
                    ),
                    Text(
                      'Ten Quan (Tieng Thai): ${choThueCont.tenquanTiengthai}',
                    ),
                    Text('Anh1: ${choThueCont.anh1}'),
                    Text('Anh2: ${choThueCont.anh2}'),
                    Text('Anh3: ${choThueCont.anh3}'),
                    Text('Anh4: ${choThueCont.anh4}'),
                    Text('Anh5: ${choThueCont.anh5}'),
                    Text('Anh6: ${choThueCont.anh6}'),
                    Text('Anh7: ${choThueCont.anh7}'),
                    Text('Anh8: ${choThueCont.anh8}'),
                    Text('Anh9: ${choThueCont.anh9}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        final result = await context.push(
                          '/chothuecont/edit',
                          extra: choThueCont,
                        );
                        if (result == true) {
                          if (mounted) {
                            context.read<ChoThueContViewModel>().load.execute();
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
                                'Are you sure you want to delete this cho thue cont?',
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
                          viewModel.deleteChoThueCont.execute(
                            choThueCont.id ?? 0,
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
          final result = await context.push('/chothuecont/add');
          if (result == true) {
            if (mounted) {
              context.read<ChoThueContViewModel>().load.execute();
            }
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
