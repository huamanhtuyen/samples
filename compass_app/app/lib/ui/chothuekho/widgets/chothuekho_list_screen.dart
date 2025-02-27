// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/chothuekho_viewmodel.dart';
import 'chothuekho_card.dart';
import 'chothuekho_form_screen.dart';

class ChoThueKhoListScreen extends StatelessWidget {
  const ChoThueKhoListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Cho Thuê Kho')),
      body: Consumer<ChoThueKhoViewModel>(
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
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const ChoThueKhoFormScreen(),
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
