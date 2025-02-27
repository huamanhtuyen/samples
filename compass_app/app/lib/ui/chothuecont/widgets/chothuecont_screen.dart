import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/chothuecont_viewmodel.dart';
import '../../core/ui/error_indicator.dart';
import 'package:go_router/go_router.dart';

class ChoThueContScreen extends StatefulWidget {
  final bool excludeScaffold;
  //this.excludeScaffold xác định việc trả về giàn giáo Scaffold hoặc không
  ////(tức là ko có appbar, dùng để nhúng vào trong các tab)
  //khi sử dụng cho các tab ở màn hình thị trường cont thì sẽ set excludeScaffold = true
  const ChoThueContScreen({super.key, this.excludeScaffold = false});

  @override
  State<ChoThueContScreen> createState() => _ChoThueContScreenState();
}

class _ChoThueContScreenState extends State<ChoThueContScreen> {
  @override
  Widget build(BuildContext context) {
    final content = Consumer<ChoThueContViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.load.running) {
          return const Center(child: CircularProgressIndicator());
        }
        if (viewModel.load.error) {
          return Center(
            child: ErrorIndicator(
              title: 'Không thể tải dữ liệu',
              label: 'Thử lại',
              onPressed: viewModel.load.execute,
            ),
          );
        }
        if (viewModel.choThueConts.isEmpty) {
          return Center(child: Text('Không có dữ liệu'));
        }
        return Stack(
          children: [
            ListView.builder(
              itemCount: viewModel.choThueConts.length,
              itemBuilder: (context, index) {
                final choThueCont = viewModel.choThueConts[index];
                return Card(
                  margin: const EdgeInsets.all(8.0),
                  child: ListTile(
                    title: Text(choThueCont.mota ?? ''),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Công ty: ${choThueCont.tencty ?? ''}'),
                        Text('SĐT: ${choThueCont.sdt1 ?? ''}'),
                        Text(
                          'Địa điểm: ${choThueCont.tentinhTiengviet ?? ''}, ${choThueCont.tenquanTiengviet ?? ''}',
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
                              '/thitruongcont/chothuecont/edit',
                              extra: choThueCont,
                            );
                            if (result == true && context.mounted) {
                              context
                                  .read<ChoThueContViewModel>()
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
                                    'Bạn có chắc muốn xóa thông tin cho thuê cont này?',
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
                              viewModel.deleteChoThueCont.execute(
                                choThueCont.id ?? 0,
                              );
                            }
                          },
                        ),
                      ],
                    ),
                    // ...existing code...
                  ),
                );
              },
            ),
            Positioned(
              right: 16,
              bottom: 16,
              child: FloatingActionButton(
                heroTag: 'btn_add_chothuecont',
                onPressed: () async {
                  final result = await context.push(
                    '/thitruongcont/chothuecont/add',
                  );
                  if (result == true && context.mounted) {
                    context.read<ChoThueContViewModel>().load.execute();
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
      appBar: AppBar(title: Text('Cho thuê cont')),
      body: content,
    );
  }
}
