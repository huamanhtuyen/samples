// Bản quyền 2024 thuộc về nhóm Flutter. Bảo lưu mọi quyền.
// Việc sử dụng mã nguồn này được điều chỉnh bởi giấy phép kiểu BSD có trong tệp LICENSE.

import 'package:flutter/material.dart';

// Lớp trừu tượng chứa các kích thước
abstract final class Dimens {
  const Dimens();

  /// Khoảng cách ngang chung dùng để tách các mục UI
  static const paddingHorizontal = 20.0;

  /// Khoảng cách dọc chung dùng để tách các mục UI
  static const paddingVertical = 12.0;

  /// Khoảng cách ngang cho các cạnh màn hình
  double get paddingScreenHorizontal;

  /// Khoảng cách dọc cho các cạnh màn hình
  double get paddingScreenVertical;

  double get profilePictureSize;

  //Kích thước nút menu
  double get menuButtonSize;

  //Kích thước logo ứng dụng
  double get logoSize;

  /// Khoảng cách ngang đối xứng cho các cạnh màn hình
  EdgeInsets get edgeInsetsScreenHorizontal =>
      EdgeInsets.symmetric(horizontal: paddingScreenHorizontal);

  /// Khoảng cách đối xứng cho các cạnh màn hình
  EdgeInsets get edgeInsetsScreenSymmetric => EdgeInsets.symmetric(
    horizontal: paddingScreenHorizontal,
    vertical: paddingScreenVertical,
  );

  static const Dimens desktop = _DimensDesktop();
  static const Dimens mobile = _DimensMobile();

  /// Lấy định nghĩa kích thước dựa trên kích thước màn hình
  factory Dimens.of(BuildContext context) => switch (MediaQuery.sizeOf(
    context,
  ).width) {
    > 600 && < 840 => desktop,
    _ => mobile,
  };
}

// Kích thước cho thiết bị di động
final class _DimensMobile extends Dimens {
  @override
  final double paddingScreenHorizontal = Dimens.paddingHorizontal;

  @override
  final double paddingScreenVertical = Dimens.paddingVertical;

  @override
  final double profilePictureSize = 64.0;

  @override
  final double menuButtonSize = 48.0;

  @override
  final double logoSize = 48.0;

  const _DimensMobile();
}

// Kích thước cho thiết bị Desktop/Web
final class _DimensDesktop extends Dimens {
  @override
  final double paddingScreenHorizontal = 100.0;

  @override
  final double paddingScreenVertical = 64.0;

  @override
  final double profilePictureSize = 128.0;

  @override
  final double menuButtonSize = 128.0;

  @override
  final double logoSize = 128.0;

  const _DimensDesktop();
}
