// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../domain/models/thitruongxnk/thitruongxnk_model.dart';

class ThiTruongXNKCard extends StatelessWidget {
  final ThiTruongXNK thiTruongXNK;
  final VoidCallback? onTap;
  final VoidCallback? onDelete;

  const ThiTruongXNKCard({
    super.key,
    required this.thiTruongXNK,
    this.onTap,
    this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: InkWell(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (thiTruongXNK.brochurePictureVi != null &&
                thiTruongXNK.brochurePictureVi!.isNotEmpty)
              SizedBox(
                height: 180,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: thiTruongXNK.brochurePictureVi!,
                  fit: BoxFit.cover,
                  placeholder:
                      (context, url) =>
                          const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    thiTruongXNK.tencty ?? 'Chưa có tên công ty',
                    style: Theme.of(context).textTheme.titleLarge,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  if (thiTruongXNK.mota != null &&
                      thiTruongXNK.mota!.isNotEmpty)
                    Text(
                      thiTruongXNK.mota!,
                      style: Theme.of(context).textTheme.bodyMedium,
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                  const SizedBox(height: 8),
                  if (thiTruongXNK.diachichitiet != null &&
                      thiTruongXNK.diachichitiet!.isNotEmpty)
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.location_on, size: 16),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            thiTruongXNK.diachichitiet!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 8),
                  if (thiTruongXNK.tenquanTiengviet != null ||
                      thiTruongXNK.tentinhTiengviet != null)
                    Row(
                      children: [
                        const Icon(Icons.map, size: 16),
                        const SizedBox(width: 4),
                        Expanded(
                          child: Text(
                            '${thiTruongXNK.tenquanTiengviet ?? ''}, ${thiTruongXNK.tentinhTiengviet ?? ''}',
                            style: Theme.of(context).textTheme.bodySmall,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  const SizedBox(height: 8),
                  if (thiTruongXNK.sdt1 != null &&
                      thiTruongXNK.sdt1!.isNotEmpty)
                    Row(
                      children: [
                        const Icon(Icons.phone, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          thiTruongXNK.sdt1!,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  const SizedBox(height: 8),
                  if (thiTruongXNK.createdAt != null)
                    Row(
                      children: [
                        const Icon(Icons.calendar_today, size: 16),
                        const SizedBox(width: 4),
                        Text(
                          '${thiTruongXNK.createdAt!.day}/${thiTruongXNK.createdAt!.month}/${thiTruongXNK.createdAt!.year}',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  if (thiTruongXNK.maquan != null ||
                      thiTruongXNK.matinh != null)
                    Container(
                      margin: const EdgeInsets.only(top: 8),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(4),
                      ),
                      child: Text(
                        'Mã: ${thiTruongXNK.maquan ?? ''} - ${thiTruongXNK.matinh ?? ''}',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall?.copyWith(color: Colors.black54),
                      ),
                    ),
                ],
              ),
            ),
            if (onDelete != null)
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      icon: const Icon(Icons.delete),
                      label: const Text('Xóa'),
                      style: TextButton.styleFrom(foregroundColor: Colors.red),
                      onPressed: onDelete,
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
