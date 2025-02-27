// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/chothuekho_viewmodel.dart';
import 'chothuekho_card.dart';
//import 'chothuekho_form_screen.dart';
import 'package:go_router/go_router.dart';

class ChoThueKhoListScreen extends StatelessWidget {
  final bool excludeScaffold;

  const ChoThueKhoListScreen({super.key, this.excludeScaffold = false});

  @override
  Widget build(BuildContext context) {
    Widget content = Consumer<ChoThueKhoViewModel>(
      builder: (context, viewModel, child) {
        if (viewModel.load.running) {
          return const Center(child: CircularProgressIndicator());
        }

        final choThueKhos = viewModel.choThueKhos;

        if (choThueKhos.isEmpty) {
          return Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text('No warehouses available for rent'),
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
            itemCount: choThueKhos.length,
            itemBuilder: (context, index) {
              final choThueKho = choThueKhos[index];
              return ChoThueKhoCard(
                choThueKho: choThueKho,
                onDelete: () {
                  showDialog(
                    context: context,
                    builder:
                        (context) => AlertDialog(
                          title: const Text('Confirm Delete'),
                          content: const Text(
                            'Are you sure you want to delete this warehouse rental?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: const Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                if (choThueKho.id != null) {
                                  viewModel.deleteChoThueKho.execute(
                                    choThueKho.id!,
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
        final result = await context.push('/thitruongkho/chothuekho/add');
        if (result == true && context.mounted) {
          context.read<ChoThueKhoViewModel>().load.execute();
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
      appBar: AppBar(title: const Text('Cho Thuê Kho')),
      body: content,
      floatingActionButton: floatingButton,
    );
  }
}
