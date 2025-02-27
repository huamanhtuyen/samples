// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/canthuecont_viewmodel.dart';
import '../../core/ui/error_indicator.dart';
import 'package:go_router/go_router.dart';

class CanThueContScreen extends StatefulWidget {
  final bool excludeScaffold;
  //this.excludeScaffold xác định việc trả về giàn giáo Scaffold hoặc không
  ////(tức là ko có appbar, dùng để nhúng vào trong các tab)
  //khi sử dụng cho các tab ở màn hình thị trường cont thì sẽ set excludeScaffold = true
  const CanThueContScreen({super.key, this.excludeScaffold = false});

  @override
  State<CanThueContScreen> createState() => _CanThueContScreenState();
}

class _CanThueContScreenState extends State<CanThueContScreen> {
  @override
  Widget build(BuildContext context) {
    final content = Consumer<CanThueContViewModel>(
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
        return Stack(
          children: [
            ListView.builder(
              itemCount: viewModel.CanThueConts.length,
              itemBuilder: (context, index) {
                final canThueCont = viewModel.CanThueConts[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(canThueCont.mota ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Công ty: ${canThueCont.tencty ?? ''}'),
                        Text('SĐT: ${canThueCont.sdt1 ?? ''}'),
                        Text(
                          'Địa điểm: ${canThueCont.tentinhTiengviet ?? ''}, ${canThueCont.tenquanTiengviet ?? ''}',
                        ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: Icon(Icons.edit),
                          onPressed: () async {
                            final result = await context.push(
                              '/thitruongcont/canthuecont/edit',
                              extra: canThueCont,
                            );
                            if (result == true && context.mounted) {
                              context
                                  .read<CanThueContViewModel>()
                                  .load
                                  .execute();
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
                                  title: Text('Xác nhận xóa'),
                                  content: Text(
                                    'Bạn có chắc muốn xóa thông tin cần thuê cont này?',
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed:
                                          () =>
                                              Navigator.of(context).pop(false),
                                      child: Text('Hủy'),
                                    ),
                                    TextButton(
                                      onPressed:
                                          () => Navigator.of(context).pop(true),
                                      child: Text('Xóa'),
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
                  ),
                );
              },
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton(
                heroTag: 'btn_add_canthuecont',
                onPressed: () async {
                  final result = await context.push(
                    '/thitruongcont/canthuecont/add',
                  );
                  if (result == true && context.mounted) {
                    context.read<CanThueContViewModel>().load.execute();
                  }
                },
                child: Icon(Icons.add),
              ),
            ),
          ],
        );
      },
    );

    if (widget.excludeScaffold) {
      return content;
    }

    return Scaffold(
      appBar: AppBar(title: Text('Cần thuê cont')),
      body: content,
    );
  }
}
