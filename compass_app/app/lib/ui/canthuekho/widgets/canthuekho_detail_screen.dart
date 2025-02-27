// ignore_for_file: directives_ordering
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../domain/models/canthuekho/canthuekho_model.dart';
import '../view_models/canthuekho_viewmodel.dart';
import 'canthuekho_form_screen.dart';

class CanThueKhoDetailScreen extends StatelessWidget {
  final CanThueKho canThueKho;

  const CanThueKhoDetailScreen({super.key, required this.canThueKho});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(canThueKho.tencty ?? 'Chi tiết cần thuê kho'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => CanThueKhoFormScreen(canThueKho: canThueKho),
                ),
              );
            },
          ),
        ],
      ),
      body: Consumer<CanThueKhoViewModel>(
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
                      if (canThueKho.tencty != null &&
                          canThueKho.tencty!.isNotEmpty)
                        Text(
                          canThueKho.tencty!,
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      const SizedBox(height: 16),
                      // _buildDetailItem(
                      //   context,
                      //   'Địa chỉ',
                      //   '${canThueKho.diachichitiet ?? ""}, ${canThueKho.tenquanTiengviet ?? ""}, ${canThueKho.tentinhTiengviet ?? ""}',
                      //   icon: Icons.location_on,
                      // ),
                      _buildContactInfo(context),
                      const SizedBox(height: 16),
                      if (canThueKho.mota != null &&
                          canThueKho.mota!.isNotEmpty) ...[
                        const Divider(),
                        const SizedBox(height: 8),
                        Text(
                          'Mô tả',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          canThueKho.mota!,
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
    final images = [];

    if (canThueKho.anh1 != null && canThueKho.anh1!.isNotEmpty) {
      images.add(canThueKho.anh1!);
    }
    if (canThueKho.anh2 != null && canThueKho.anh2!.isNotEmpty) {
      images.add(canThueKho.anh2!);
    }
    if (canThueKho.anh3 != null && canThueKho.anh3!.isNotEmpty) {
      images.add(canThueKho.anh3!);
    }
    if (canThueKho.anh4 != null && canThueKho.anh4!.isNotEmpty) {
      images.add(canThueKho.anh4!);
    }
    if (canThueKho.anh5 != null && canThueKho.anh5!.isNotEmpty) {
      images.add(canThueKho.anh5!);
    }
    if (canThueKho.anh6 != null && canThueKho.anh6!.isNotEmpty) {
      images.add(canThueKho.anh6!);
    }
    if (canThueKho.anh7 != null && canThueKho.anh7!.isNotEmpty) {
      images.add(canThueKho.anh7!);
    }
    if (canThueKho.anh8 != null && canThueKho.anh8!.isNotEmpty) {
      images.add(canThueKho.anh8!);
    }
    if (canThueKho.anh9 != null && canThueKho.anh9!.isNotEmpty) {
      images.add(canThueKho.anh9!);
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

  // Widget _buildDetailItem(
  //   BuildContext context,
  //   String title,
  //   String value, {
  //   IconData? icon,
  // }) {
  //   if (value.isEmpty) return const SizedBox.shrink();

  //   return Padding(
  //     padding: const EdgeInsets.only(bottom: 16),
  //     child: Row(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         if (icon != null) ...[
  //           Icon(icon, size: 20, color: Colors.blue),
  //           const SizedBox(width: 8),
  //         ],
  //         Expanded(
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Text(
  //                 title,
  //                 style: const TextStyle(
  //                   fontWeight: FontWeight.bold,
  //                   color: Colors.black54,
  //                 ),
  //               ),
  //               const SizedBox(height: 4),
  //               Text(value),
  //             ],
  //           ),
  //         ),
  //       ],
  //     ),
  //   );
  // }

  Widget _buildContactInfo(BuildContext context) {
    List<Widget> contacts = [];

    if (canThueKho.sdt1 != null && canThueKho.sdt1!.isNotEmpty) {
      contacts.add(
        InkWell(
          onTap: () => launchUrl(Uri.parse('tel:${canThueKho.sdt1}')),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8),
                Text(canThueKho.sdt1!),
                const Spacer(),
                const Icon(Icons.call, color: Colors.blue, size: 20),
              ],
            ),
          ),
        ),
      );
    }

    if (canThueKho.sdt2 != null && canThueKho.sdt2!.isNotEmpty) {
      contacts.add(
        InkWell(
          onTap: () => launchUrl(Uri.parse('tel:${canThueKho.sdt2}')),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8),
                Text(canThueKho.sdt2!),
                const Spacer(),
                const Icon(Icons.call, color: Colors.blue, size: 20),
              ],
            ),
          ),
        ),
      );
    }

    if (canThueKho.sdt3 != null && canThueKho.sdt3!.isNotEmpty) {
      contacts.add(
        InkWell(
          onTap: () => launchUrl(Uri.parse('tel:${canThueKho.sdt3}')),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                const Icon(Icons.phone, color: Colors.green),
                const SizedBox(width: 8),
                Text(canThueKho.sdt3!),
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
