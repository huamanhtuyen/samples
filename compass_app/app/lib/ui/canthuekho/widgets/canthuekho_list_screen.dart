// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/canthuekho_viewmodel.dart';
import 'canthuekho_card.dart';
import 'package:go_router/go_router.dart';

class CanThueKhoListScreen extends StatelessWidget {
  final bool excludeScaffold;

  const CanThueKhoListScreen({super.key, this.excludeScaffold = false});

  @override
  Widget build(BuildContext context) {
    Widget content = Consumer<CanThueKhoViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.load.running) {
          return const Center(child: CircularProgressIndicator());
        }

        final canThueKhos = viewModel.canThueKhos;

        if (canThueKhos.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('No warehouse rental requests available'),
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
            itemCount: canThueKhos.length,
            itemBuilder: (context, index) {
              final canThueKho = canThueKhos[index];
              return CanThueKhoCard(
                canThueKho: canThueKho,
                onDelete: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: const Text(
                            'Are you sure you want to delete this warehouse rental request?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (canThueKho.id != null) {
                                  viewModel.deleteCanThueKho.execute(
                                    canThueKho.id!,
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

    Widget floatingButton = FloatingActionButton(
      onPressed: () async {
        final result = await context.push('/thitruongkho/canthuekho/add');
        if (result == true && context.mounted) {
          context.read<CanThueKhoViewModel>().load.execute();
        }
      },
      child: const Icon(Icons.add),
    );

    if (excludeScaffold) {
      return Stack(
        children: [
          content,
          Positioned(right: 16, bottom: 16, child: floatingButton),
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Cần Thuê Kho')),
      body: content,
      floatingActionButton: floatingButton,
    );
  }
}
