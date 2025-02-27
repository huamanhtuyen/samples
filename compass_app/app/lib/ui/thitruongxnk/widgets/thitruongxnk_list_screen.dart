// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/thitruongxnk_viewmodel.dart';
import 'thitruongxnk_card.dart';
import 'package:go_router/go_router.dart';

class ThiTruongXNKListScreen extends StatelessWidget {
  const ThiTruongXNKListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final content = Consumer<ThiTruongXNKViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.load.running) {
          return const Center(child: CircularProgressIndicator());
        }

        final thiTruongXNKs = viewModel.thiTruongXNKs;

        if (thiTruongXNKs.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('No market information available'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: viewModel.load.execute,
                  child: const Text('Reload'),
                ),
              ],
            ),
          );
        }

        return RefreshIndicator(
          onRefresh: () async {
            await viewModel.load.execute();
          },
          child: ListView.builder(
            itemCount: thiTruongXNKs.length,
            itemBuilder: (context, index) {
              final thiTruongXNK = thiTruongXNKs[index];
              return ThiTruongXNKCard(
                thiTruongXNK: thiTruongXNK,
                onDelete: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: const Text(
                            'Are you sure you want to delete this market information?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (thiTruongXNK.id != null) {
                                  viewModel.deleteThiTruongXNK.execute(
                                    thiTruongXNK.id!,
                                  );
                                }
                                Navigator.pop(context);
                              },
                              child: const Text('Delete'),
                              style: TextButton.styleFrom(
                                foregroundColor: Colors.red,
                              ),
                            ),
                          ],
                        ),
                  );
                },
              );
            },
          ),
        );
      },
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Thị Trường XNK')),
      body: content,
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          final result = await context.push('/thitruongxnk/add');
          if (result == true && context.mounted) {
            context.read<ThiTruongXNKViewModel>().load.execute();
          }
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
