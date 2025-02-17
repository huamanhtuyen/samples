// Bản quyền 2024 Nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể tìm thấy trong tệp LICENSE.

import 'package:cached_network_image/cached_network_image.dart'; // Thư viện để tải và lưu trữ hình ảnh từ mạng
import 'package:flutter/material.dart'; // Thư viện chính của Flutter

import '../../../domain/models/activity/activity.dart'; // Import mô hình Activity
import '../../../utils/image_error_listener.dart'; // Import hàm xử lý lỗi hình ảnh
import '../../core/ui/custom_checkbox.dart'; // Import widget CustomCheckbox

class ActivityEntry extends StatelessWidget {
  // Định nghĩa lớp ActivityEntry kế thừa StatelessWidget
  const ActivityEntry({
    super.key, // Khóa siêu lớp
    required this.activity, // Tham số bắt buộc activity
    required this.selected, // Tham số bắt buộc selected
    required this.onChanged, // Tham số bắt buộc onChanged
  });

  final Activity activity; // Khai báo biến activity kiểu Activity
  final bool selected; // Khai báo biến selected kiểu bool
  final ValueChanged<bool?>
  onChanged; // Khai báo biến onChanged kiểu ValueChanged<bool?>

  @override
  Widget build(BuildContext context) {
    // Phương thức build để xây dựng giao diện
    return SizedBox(
      // Widget SizedBox để định kích thước
      height: 80, // Chiều cao của SizedBox
      child: Row(
        // Widget Row để xếp các widget theo hàng ngang
        children: [
          ClipRRect(
            // Widget ClipRRect để bo góc hình ảnh
            borderRadius: BorderRadius.circular(8), // Bán kính bo góc
            child: CachedNetworkImage(
              // Widget CachedNetworkImage để tải và lưu trữ hình ảnh từ mạng
              imageUrl: activity.imageUrl, // URL hình ảnh từ activity
              height: 80, // Chiều cao của hình ảnh
              width: 80, // Chiều rộng của hình ảnh
              errorListener: imageErrorListener, // Hàm xử lý lỗi hình ảnh
            ),
          ),
          const SizedBox(width: 20), // Khoảng cách ngang giữa các widget
          Expanded(
            // Widget Expanded để mở rộng không gian còn lại
            child: Column(
              // Widget Column để xếp các widget theo cột dọc
              crossAxisAlignment:
                  CrossAxisAlignment.start, // Căn lề trái cho các widget con
              mainAxisAlignment:
                  MainAxisAlignment.start, // Căn lề trên cho các widget con
              children: [
                Text(
                  // Widget Text để hiển thị văn bản
                  activity.timeOfDay.name
                      .toUpperCase(), // Hiển thị thời gian của activity
                  style:
                      Theme.of(
                        context,
                      ).textTheme.labelSmall, // Áp dụng kiểu chữ từ chủ đề
                ),
                Text(
                  // Widget Text để hiển thị tên activity
                  activity.name, // Tên của activity
                  maxLines: 2, // Giới hạn số dòng hiển thị
                  overflow:
                      TextOverflow
                          .ellipsis, // Hiển thị dấu ba chấm nếu văn bản quá dài
                  style:
                      Theme.of(
                        context,
                      ).textTheme.bodyMedium, // Áp dụng kiểu chữ từ chủ đề
                ),
              ],
            ),
          ),
          const SizedBox(width: 20), // Khoảng cách ngang giữa các widget
          CustomCheckbox(
            // Widget CustomCheckbox để hiển thị checkbox tùy chỉnh
            key: ValueKey(
              '${activity.ref}-checkbox',
            ), // Khóa duy nhất cho checkbox
            value: selected, // Giá trị của checkbox
            onChanged: onChanged, // Hàm gọi lại khi giá trị checkbox thay đổi
          ),
        ],
      ),
    );
  }
}
