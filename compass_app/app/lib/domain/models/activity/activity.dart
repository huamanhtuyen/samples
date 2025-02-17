// Bản quyền 2024 thuộc về nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có thể được
// tìm thấy trong tệp LICENSE.

import 'package:freezed_annotation/freezed_annotation.dart'; // Nhập gói freezed_annotation

part 'activity.freezed.dart'; // Phần freezed của tệp activity

part 'activity.g.dart'; // Phần g.dart của tệp activity

// Định nghĩa enum TimeOfDay với các giá trị: any, morning, afternoon, evening, night
enum TimeOfDay { any, morning, afternoon, evening, night }

@freezed
// Định nghĩa lớp Activity với mixin _$Activity
class Activity with _$Activity {
  // Định nghĩa factory constructor cho Activity
  const factory Activity({
    // Tên hoạt động, ví dụ: 'Glacier Trekking and Ice Climbing'
    required String name,

    // Mô tả hoạt động, ví dụ: 'Embark on a thrilling adventure exploring the awe-inspiring glaciers of Alaska...'
    required String description,

    // Tên địa điểm, ví dụ: 'Matanuska Glacier or Mendenhall Glacier'
    required String locationName,

    // Thời gian hoạt động tính bằng ngày, ví dụ: 8
    required int duration,

    // Thời gian trong ngày, ví dụ: 'morning'
    required TimeOfDay timeOfDay,

    // Hoạt động có phù hợp cho gia đình hay không, ví dụ: false
    required bool familyFriendly,

    // Giá của hoạt động, ví dụ: 4
    required int price,

    // Tham chiếu đến điểm đến, ví dụ: 'alaska'
    required String destinationRef,

    // Tham chiếu đến hoạt động, ví dụ: 'glacier-trekking-and-ice-climbing'
    required String ref,

    // URL hình ảnh của hoạt động, ví dụ: 'https://storage.googleapis.com/tripedia-images/activities/alaska_glacier-trekking-and-ice-climbing.jpg'
    required String imageUrl,
  }) = _Activity;

  // Phương thức factory để tạo đối tượng Activity từ JSON
  factory Activity.fromJson(Map<String, Object?> json) =>
      _$ActivityFromJson(json);
}
