// ignore_for_file: directives_ordering
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/thitruongxnk/thitruongxnk_model.dart';
import '../view_models/thitruongxnk_viewmodel.dart';
import 'thitruongxnk_form_screen.dart';

class ThiTruongXNKDetailScreen extends StatelessWidget {
  final ThiTruongXNK thiTruongXNK;

  const ThiTruongXNKDetailScreen({super.key, required this.thiTruongXNK});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(thiTruongXNK.tencty ?? 'Thông tin thị trường XNK'),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) =>
                          ThiTruongXNKFormScreen(thiTruongXNK: thiTruongXNK),
                ),
              ).then((value) {
                if (value == true && context.mounted) {
                  context.read<ThiTruongXNKViewModel>().load.execute();
                }
              });
            },
          ),
        ],
      ),
      body: Consumer<ThiTruongXNKViewModel>(
        builder: (context, viewModel, child) {
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Brochure image section
                if (thiTruongXNK.brochurePictureVi != null &&
                    thiTruongXNK.brochurePictureVi!.isNotEmpty)
                  SizedBox(
                    height: 250,
                    child: CachedNetworkImage(
                      imageUrl: thiTruongXNK.brochurePictureVi!,
                      fit: BoxFit.cover,
                      placeholder:
                          (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                      errorWidget:
                          (context, url, error) => const Icon(Icons.error),
                    ),
                  ),

                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Company name
                      Text(
                        thiTruongXNK.tencty ?? 'Chưa có tên công ty',
                        style: Theme.of(context).textTheme.headlineSmall,
                      ),

                      const SizedBox(height: 16),

                      // Creation date
                      if (thiTruongXNK.createdAt != null) ...[
                        Row(
                          children: [
                            const Icon(Icons.calendar_today, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              'Ngày tạo: ${thiTruongXNK.createdAt!.day}/${thiTruongXNK.createdAt!.month}/${thiTruongXNK.createdAt!.year}',
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],

                      // Contact information
                      if (thiTruongXNK.sdt1 != null &&
                          thiTruongXNK.sdt1!.isNotEmpty) ...[
                        Row(
                          children: [
                            const Icon(Icons.phone, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              'Số điện thoại: ${thiTruongXNK.sdt1}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],

                      // Additional phone numbers if available
                      if (thiTruongXNK.sdt2 != null &&
                          thiTruongXNK.sdt2!.isNotEmpty) ...[
                        Row(
                          children: [
                            const Icon(Icons.phone, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              'Số điện thoại 2: ${thiTruongXNK.sdt2}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],

                      if (thiTruongXNK.sdt3 != null &&
                          thiTruongXNK.sdt3!.isNotEmpty) ...[
                        Row(
                          children: [
                            const Icon(Icons.phone, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              'Số điện thoại 3: ${thiTruongXNK.sdt3}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],

                      // Location information
                      if (thiTruongXNK.diachichitiet != null &&
                          thiTruongXNK.diachichitiet!.isNotEmpty) ...[
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.location_on, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Địa chỉ: ${thiTruongXNK.diachichitiet}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],

                      if (thiTruongXNK.tenquanTiengviet != null ||
                          thiTruongXNK.tentinhTiengviet != null) ...[
                        Row(
                          children: [
                            const Icon(Icons.map, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                'Quận/Huyện: ${thiTruongXNK.tenquanTiengviet ?? 'N/A'}, Tỉnh/Thành phố: ${thiTruongXNK.tentinhTiengviet ?? 'N/A'}',
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 8),
                      ],

                      // Location codes
                      if (thiTruongXNK.maquan != null ||
                          thiTruongXNK.matinh != null) ...[
                        Row(
                          children: [
                            const Icon(Icons.code, size: 16),
                            const SizedBox(width: 8),
                            Text(
                              'Mã quận/huyện: ${thiTruongXNK.maquan ?? 'N/A'}, Mã tỉnh/thành phố: ${thiTruongXNK.matinh ?? 'N/A'}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                      ],

                      const Divider(),
                      const SizedBox(height: 16),

                      // Description
                      if (thiTruongXNK.mota != null &&
                          thiTruongXNK.mota!.isNotEmpty) ...[
                        Text(
                          'Mô tả:',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        Text(
                          thiTruongXNK.mota!,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ],

                      const SizedBox(height: 16),

                      // Additional brochure images if available
                      if (thiTruongXNK.brochurePictureEn != null &&
                              thiTruongXNK.brochurePictureEn!.isNotEmpty ||
                          thiTruongXNK.brochurePictureZh != null &&
                              thiTruongXNK.brochurePictureZh!.isNotEmpty ||
                          thiTruongXNK.brochurePictureTh != null &&
                              thiTruongXNK.brochurePictureTh!.isNotEmpty) ...[
                        const Divider(),
                        const SizedBox(height: 16),
                        Text(
                          'Additional Brochures',
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                        const SizedBox(height: 8),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            children: [
                              if (thiTruongXNK.brochurePictureEn != null &&
                                  thiTruongXNK.brochurePictureEn!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              thiTruongXNK.brochurePictureEn!,
                                          fit: BoxFit.cover,
                                          placeholder:
                                              (context, url) => const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                          errorWidget:
                                              (context, url, error) =>
                                                  const Icon(Icons.error),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text('English'),
                                    ],
                                  ),
                                ),
                              if (thiTruongXNK.brochurePictureZh != null &&
                                  thiTruongXNK.brochurePictureZh!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              thiTruongXNK.brochurePictureZh!,
                                          fit: BoxFit.cover,
                                          placeholder:
                                              (context, url) => const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                          errorWidget:
                                              (context, url, error) =>
                                                  const Icon(Icons.error),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text('Chinese'),
                                    ],
                                  ),
                                ),
                              if (thiTruongXNK.brochurePictureTh != null &&
                                  thiTruongXNK.brochurePictureTh!.isNotEmpty)
                                Padding(
                                  padding: const EdgeInsets.only(right: 8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 150,
                                        width: 150,
                                        child: CachedNetworkImage(
                                          imageUrl:
                                              thiTruongXNK.brochurePictureTh!,
                                          fit: BoxFit.cover,
                                          placeholder:
                                              (context, url) => const Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              ),
                                          errorWidget:
                                              (context, url, error) =>
                                                  const Icon(Icons.error),
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      const Text('Thai'),
                                    ],
                                  ),
                                ),
                            ],
                          ),
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
}
