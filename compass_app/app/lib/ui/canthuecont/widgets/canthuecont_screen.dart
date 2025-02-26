// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/canthuecont_viewmodel.dart';
import '../../core/ui/error_indicator.dart';
import 'package:go_router/go_router.dart';

class CanThueContScreen extends StatefulWidget {
  const CanThueContScreen({super.key});

  @override
  State<CanThueContScreen> createState() => _CanThueContScreenState();
}

class _CanThueContScreenState extends State<CanThueContScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cần thuê cont')),
      body: Consumer<CanThueContViewModel>(
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
          if (viewModel.CanThueConts.isEmpty) {
            return Center(child: Text('No data available'));
          }
          return ListView.builder(
            itemCount: viewModel.CanThueConts.length,
            itemBuilder: (context, index) {
              final canThueCont = viewModel.CanThueConts[index];
              return ListTile(
                title: Text(canThueCont.mota ?? ''),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('ID: ${canThueCont.id}'),
                    Text('Ten Cong Ty: ${canThueCont.tencty}'),
                    Text('SDT1: ${canThueCont.sdt1}'),
                    Text('SDT2: ${canThueCont.sdt2}'),
                    Text('SDT3: ${canThueCont.sdt3}'),
                    Text('Ma Tinh: ${canThueCont.matinh}'),
                    Text(
                      'Ten Tinh (Tieng Viet): ${canThueCont.tentinhTiengviet}',
                    ),
                    Text(
                      'Ten Tinh (Tieng Anh): ${canThueCont.tentinhTienganh}',
                    ),
                    Text(
                      'Ten Tinh (Tieng Trung): ${canThueCont.tentinhTiengtrung}',
                    ),
                    Text(
                      'Ten Tinh (Tieng Thai): ${canThueCont.tentinhTiengthai}',
                    ),
                    Text('Ma Quan: ${canThueCont.maquan}'),
                    Text(
                      'Ten Quan (Tieng Viet): ${canThueCont.tenquanTiengviet}',
                    ),
                    Text(
                      'Ten Quan (Tieng Anh): ${canThueCont.tenquanTienganh}',
                    ),
                    Text(
                      'Ten Quan (Tieng Trung): ${canThueCont.tenquanTiengtrung}',
                    ),
                    Text(
                      'Ten Quan (Tieng Thai): ${canThueCont.tenquanTiengthai}',
                    ),
                    Text('Anh1: ${canThueCont.anh1}'),
                    Text('Anh2: ${canThueCont.anh2}'),
                    Text('Anh3: ${canThueCont.anh3}'),
                    Text('Anh4: ${canThueCont.anh4}'),
                    Text('Anh5: ${canThueCont.anh5}'),
                    Text('Anh6: ${canThueCont.anh6}'),
                    Text('Anh7: ${canThueCont.anh7}'),
                    Text('Anh8: ${canThueCont.anh8}'),
                    Text('Anh9: ${canThueCont.anh9}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () async {
                        final result = await context.push(
                          '/CanThueCont/edit',
                          extra: canThueCont,
                        );
                        if (result == true) {
                          if (mounted) {
                            context.read<CanThueContViewModel>().load.execute();
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
                          viewModel.deleteCanThueCont.execute(
                            canThueCont.id ?? 0,
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
          final result = await context.push('/canthuecont/add');
          if (result == true) {
            if (mounted) {
              context.read<CanThueContViewModel>().load.execute();
            }
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
