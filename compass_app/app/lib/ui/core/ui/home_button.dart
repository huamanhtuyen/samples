// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart'; // Thư viện Flutter Material
import 'package:go_router/go_router.dart'; // Thư viện điều hướng GoRouter

import '../../../routing/routes.dart'; // Đường dẫn tới file routes.dart
import '../themes/colors.dart'; // Đường dẫn tới file colors.dart
import 'blur_filter.dart'; // Đường dẫn tới file blur_filter.dart

/// Nút Home để điều hướng quay lại đường dẫn '/'.
class HomeButton extends StatelessWidget {
  const HomeButton({
    super.key,
    this.blur = false,
  }); // Constructor với tham số blur mặc định là false

  final bool
  blur; // Biến boolean để xác định có áp dụng hiệu ứng blur hay không

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 40.0, // Chiều cao của nút
      width: 40.0, // Chiều rộng của nút
      child: Stack(
        fit:
            StackFit.expand, // Mở rộng Stack để lấp đầy kích thước của SizedBox
        children: [
          if (blur) // Nếu blur là true thì áp dụng hiệu ứng blur
            ClipRect(
              child: BackdropFilter(
                filter: kBlurFilter, // Áp dụng bộ lọc blur
                child: const SizedBox(
                  height: 40.0,
                  width: 40.0,
                ), // Kích thước của vùng blur
              ),
            ),
          DecoratedBox(
            decoration: BoxDecoration(
              border: Border.all(
                color: AppColors.grey1,
              ), // Viền của nút với màu xám
              borderRadius: BorderRadius.circular(
                8.0,
              ), // Bo tròn các góc của nút
              color: Colors.transparent, // Màu nền trong suốt
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(
                8.0,
              ), // Bo tròn các góc của hiệu ứng nhấn
              onTap: () {
                context.go(
                  Routes.home,
                ); // Điều hướng tới đường dẫn home khi nhấn nút
              },
              child: Center(
                child: Icon(
                  size: 24.0, // Kích thước của icon
                  Icons.home_outlined, // Icon hình ngôi nhà
                  color:
                      Theme.of(
                        context,
                      ).colorScheme.onSurface, // Màu của icon dựa trên theme
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
