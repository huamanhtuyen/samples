// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

// Lớp AppLocalization để quản lý các chuỗi văn bản đa ngôn ngữ
class AppLocalization {
  final Locale locale;

  AppLocalization(this.locale);

  // Thêm từ điển chứa các chuỗi văn bản cho Tiếng Việt
  static const _stringsVi = <String, String>{
    'activities': 'Hoạt động',
    'addDates': 'Thêm ngày',
    'bookingDeleted': 'Đã xóa đặt chỗ',
    'bookNewTrip': 'Đặt chuyến đi mới',
    'close': 'Đóng',
    'confirm': 'Xác nhận',
    'daytime': 'Ban ngày',
    'errorWhileDeletingBooking': 'Lỗi khi xóa đặt chỗ',
    'errorWhileLoadingActivities': 'Lỗi khi tải hoạt động',
    'errorWhileLoadingBooking': 'Lỗi khi tải đặt chỗ',
    'errorWhileLoadingContinents': 'Lỗi khi tải châu lục',
    'errorWhileLoadingDestinations': 'Lỗi khi tải điểm đến',
    'errorWhileLoadingHome': 'Lỗi khi tải trang chủ',
    'errorWhileLogin': 'Lỗi khi đăng nhập',
    'errorWhileLogout': 'Lỗi khi đăng xuất',
    'errorWhileSavingActivities': 'Lỗi khi lưu hoạt động',
    'errorWhileSavingItinerary': 'Lỗi khi lưu hành trình',
    'errorWhileSharing': 'Lỗi khi chia sẻ đặt chỗ',
    'evening': 'Buổi tối',
    'login': 'Đăng nhập',
    'register': 'Đăng ký',
    'nameTrips': 'Chuyến đi của {name}',
    'search': 'Tìm kiếm',
    'searchDestination': 'Tìm kiếm điểm đến',
    'selected': '{1} đã chọn',
    'shareTrip': 'Chia sẻ chuyến đi',
    'tryAgain': 'Thử lại',
    'yourChosenActivities': 'Hoạt động bạn đã chọn',
    'when': 'Khi nào',
  };

  // Phương thức tĩnh để lấy đối tượng AppLocalization từ context
  static AppLocalization of(BuildContext context) {
    return Localizations.of(context, AppLocalization);
  }

  // Từ điển chứa các chuỗi văn bản
  static const _strings = <String, String>{
    'activities': 'Activities',
    'addDates': 'Add Dates',
    'bookingDeleted': 'Booking deleted',
    'bookNewTrip': 'Book New Trip',
    'close': 'Close',
    'confirm': 'Confirm',
    'daytime': 'Daytime',
    'errorWhileDeletingBooking': 'Error while deleting booking',
    'errorWhileLoadingActivities': 'Error while loading activities',
    'errorWhileLoadingBooking': 'Error while loading booking',
    'errorWhileLoadingContinents': 'Error while loading continents',
    'errorWhileLoadingDestinations': 'Error while loading destinations',
    'errorWhileLoadingHome': 'Error while loading home',
    'errorWhileLogin': 'Error while trying to login',
    'errorWhileLogout': 'Error while trying to logout',
    'errorWhileSavingActivities': 'Error while saving activities',
    'errorWhileSavingItinerary': 'Error while saving itinerary',
    'errorWhileSharing': 'Error while sharing booking',
    'evening': 'Evening',
    'login': 'Login',
    'register': 'Register',
    'nameTrips': '{name}\'s Trips',
    'search': 'Search',
    'searchDestination': 'Search destination',
    'selected': '{1} selected',
    'shareTrip': 'Share Trip',
    'tryAgain': 'Try again',
    'yourChosenActivities': 'Your chosen activities',
    'when': 'When',
  };

  // Cập nhật phương thức _get để hỗ trợ đa ngôn ngữ
  static String _get(String label, Locale locale) {
    if (locale.languageCode == 'vi') {
      return _stringsVi[label] ?? '[${label.toUpperCase()}]';
    }
    return _strings[label] ?? '[${label.toUpperCase()}]';
  }

  // Các phương thức getter để lấy chuỗi văn bản tương ứng
  String get activities => _get('activities', locale);

  String get addDates => _get('addDates', locale);

  String get confirm => _get('confirm', locale);

  String get daytime => _get('daytime', locale);

  String get errorWhileLoadingActivities =>
      _get('errorWhileLoadingActivities', locale);

  String get errorWhileLoadingBooking =>
      _get('errorWhileLoadingBooking', locale);

  String get errorWhileLoadingContinents =>
      _get('errorWhileLoadingContinents', locale);

  String get errorWhileLoadingDestinations =>
      _get('errorWhileLoadingDestinations', locale);

  String get errorWhileSavingActivities =>
      _get('errorWhileSavingActivities', locale);

  String get errorWhileSavingItinerary =>
      _get('errorWhileSavingItinerary', locale);

  String get evening => _get('evening', locale);

  String get search => _get('search', locale);

  String get searchDestination => _get('searchDestination', locale);

  String get shareTrip => _get('shareTrip', locale);

  String get tryAgain => _get('tryAgain', locale);

  String get yourChosenActivities => _get('yourChosenActivities', locale);

  String get when => _get('when', locale);

  String get errorWhileLogin => _get('errorWhileLogin', locale);

  String get login => _get('login', locale);

  String get register => _get('register', locale);

  String get errorWhileLogout => _get('errorWhileLogout', locale);

  String get close => _get('close', locale);

  String get errorWhileSharing => _get('errorWhileSharing', locale);

  String get bookNewTrip => _get('bookNewTrip', locale);

  String get errorWhileLoadingHome => _get('errorWhileLoadingHome', locale);

  String get bookingDeleted => _get('bookingDeleted', locale);

  String get errorWhileDeletingBooking =>
      _get('errorWhileDeletingBooking', locale);

  // Phương thức để lấy chuỗi văn bản với tham số
  String nameTrips(String name) =>
      _get('nameTrips', locale).replaceAll('{name}', name);

  String selected(int value) =>
      _get('selected', locale).replaceAll('{1}', value.toString());
}

// Cập nhật lớp AppLocalizationDelegate để hỗ trợ ngôn ngữ Tiếng Việt
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) => ['en', 'vi'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
