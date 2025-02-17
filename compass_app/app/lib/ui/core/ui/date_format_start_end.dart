// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart'; // Import thư viện Flutter Material
import 'package:intl/intl.dart'; // Import thư viện quốc tế hóa (intl) để định dạng ngày tháng

final _dateFormatDay = DateFormat('d'); // Định dạng ngày (chỉ ngày)
final _dateFormatDayMonth = DateFormat('d MMM'); // Định dạng ngày và tháng

String dateFormatStartEnd(DateTimeRange dateTimeRange) {
  final start = dateTimeRange.start; // Lấy ngày bắt đầu từ khoảng thời gian
  final end = dateTimeRange.end; // Lấy ngày kết thúc từ khoảng thời gian

  final dayMonthEnd = _dateFormatDayMonth.format(
    end,
  ); // Định dạng ngày kết thúc

  if (start.month == end.month) {
    // Nếu tháng bắt đầu và kết thúc giống nhau
    final dayStart = _dateFormatDay.format(start); // Định dạng ngày bắt đầu
    return '$dayStart - $dayMonthEnd'; // Trả về chuỗi định dạng "ngày bắt đầu - ngày kết thúc"
  }

  final dayMonthStart = _dateFormatDayMonth.format(
    start,
  ); // Định dạng ngày bắt đầu
  return '$dayMonthStart - $dayMonthEnd'; // Trả về chuỗi định dạng "ngày bắt đầu - ngày kết thúc"
}
