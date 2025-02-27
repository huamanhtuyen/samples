// ignore_for_file: directives_ordering
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../domain/models/chothuekho/chothuekho_model.dart';
import '../view_models/chothuekho_viewmodel.dart';
import 'chothuekho_form_screen.dart';

class ChoThueKhoDetailScreen extends StatelessWidget {
  final ChoThueKho choThueKho;

  const ChoThueKhoDetailScreen({super.key, required this.choThueKho});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(choThueKho.tencty ?? 'Chi tiết kho cho thuê'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => ChoThueKhoFormScreen(choThueKho: choThueKho),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<ChoThueKhoViewModel>(
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildImageGallery(),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (choThueKho.tencty != null &&
                          choThueKho.tencty!.isNotEmpty)
                        Text(
                          choThueKho.tencty!,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      const SizedBox(height: 16),
                      _buildDetailItem(
                        context,
                        'Địa chỉ',
                        '${choThueKho.diachichitiet ?? ""}, ${choThueKho.tenquanTiengviet ?? ""}, ${choThueKho.tentinhTiengviet ?? ""}',
                        icon: Icons.location_on,
                      ),
                      _buildContactInfo(context),
                      const SizedBox(height: 16),
                      if (choThueKho.mota != null &&
                          choThueKho.mota!.isNotEmpty) ...[
                        const Divider(),
                        const SizedBox(height: 8),
                        Text(
                          'Mô tả',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          choThueKho.mota!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildImageGallery() {
    final images = []; //List<String>

    if (choThueKho.anh1 != null && choThueKho.anh1!.isNotEmpty) {
      images.add(choThueKho.anh1!);
    }
    if (choThueKho.anh2 != null && choThueKho.anh2!.isNotEmpty) {
      images.add(choThueKho.anh2!);
    }
    if (choThueKho.anh3 != null && choThueKho.anh3!.isNotEmpty) {
      images.add(choThueKho.anh3!);
    }
    if (choThueKho.anh4 != null && choThueKho.anh4!.isNotEmpty) {
      images.add(choThueKho.anh4!);
    }
    if (choThueKho.anh5 != null && choThueKho.anh5!.isNotEmpty) {
      images.add(choThueKho.anh5!);
    }
    if (choThueKho.anh6 != null && choThueKho.anh6!.isNotEmpty) {
      images.add(choThueKho.anh6!);
    }
    if (choThueKho.anh7 != null && choThueKho.anh7!.isNotEmpty) {
      images.add(choThueKho.anh7!);
    }
    if (choThueKho.anh8 != null && choThueKho.anh8!.isNotEmpty) {
      images.add(choThueKho.anh8!);
    }
    if (choThueKho.anh9 != null && choThueKho.anh9!.isNotEmpty) {
      images.add(choThueKho.anh9!);
    }

    if (images.isEmpty) {
      return const SizedBox(
        height: 200,
        child: Center(
          child: Icon(Icons.image_not_supported, size: 64, color: Colors.grey),
        ),
      );
    }

    return SizedBox(
      height: 300,
      child: PageView.builder(
        itemCount: images.length,
        itemBuilder: (context, index) {
          return CachedNetworkImage(
            imageUrl: images[index],
            fit: BoxFit.cover,
            placeholder:
                (context, url) =>
                    const Center(child: CircularProgressIndicator()),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        },
      ),
    );
  }

  Widget _buildDetailItem(
    BuildContext context,
    String title,
    String value, {
    IconData? icon,
  }) {
    if (value.isEmpty) return const SizedBox.shrink();

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (icon != null) ...[
            Icon(icon, size: 20, color: Colors.blue),
            const SizedBox(width: 8),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 4),
                Text(value),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContactInfo(BuildContext context) {
    List<Widget> contacts = [];

    if (choThueKho.sdt1 != null && choThueKho.sdt1!.isNotEmpty) {
      contacts.add(
        InkWell(
          onTap: () => launchUrl(Uri.parse('tel:${choThueKho.sdt1}')),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8),
                Text(choThueKho.sdt1!),
                const Spacer(),
                const Icon(Icons.call, color: Colors.blue, size: 20),
              ],
            ),
          ),
        ),
      );
    }

    if (choThueKho.sdt2 != null && choThueKho.sdt2!.isNotEmpty) {
      contacts.add(
        InkWell(
          onTap: () => launchUrl(Uri.parse('tel:${choThueKho.sdt2}')),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8),
                Text(choThueKho.sdt2!),
                const Spacer(),
                const Icon(Icons.call, color: Colors.blue, size: 20),
              ],
            ),
          ),
        ),
      );
    }

    if (choThueKho.sdt3 != null && choThueKho.sdt3!.isNotEmpty) {
      contacts.add(
        InkWell(
          onTap: () => launchUrl(Uri.parse('tel:${choThueKho.sdt3}')),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8),
                Text(choThueKho.sdt3!),
                const Spacer(),
                const Icon(Icons.call, color: Colors.blue, size: 20),
              ],
            ),
          ),
        ),
      );
    }

    if (contacts.isEmpty) return const SizedBox.shrink();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        const SizedBox(height: 8),
        Text('Liên hệ', style: Theme.of(context).textTheme.titleMedium),
        const SizedBox(height: 8),
        ...contacts,
      ],
    );
  }
}
