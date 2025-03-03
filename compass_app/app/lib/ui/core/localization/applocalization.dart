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
    'chuxe': 'Chủ xe (phương tiện vận tải)',
    // Navigation bar items
    'navHome': 'Trang chủ',
    'navChat': 'Chat',
    'navTrip': 'Trong chuyến',
    'navTransaction': 'Giao dịch',
    // Menu items
    'menuMyPosts': 'Bài đăng của tôi',
    'menuBusinessInfo': 'Thông tin doanh nghiệp',
    'menuAccount': 'Tài khoản',
    // Function items
    'funcTestMap': 'Bản đồ thử nghiệm 1',
    'funcTestMapDesc': 'Bản đồ thử nghiệm 1',
    'funcCargoOwner': 'Chủ hàng',
    'funcCargoOwnerDesc':
        'Tìm xe; Tìm xe chiều về; Tìm xe quanh đây; Đăng nhu cầu vận chuyển.',
    'funcMarket': 'Thị trường',
    'funcMarketDesc': 'Danh sách thông tin về xe và nhu cầu vận chuyển hàng',
    'funcContainerRent': 'Thuê và cho thuê vỏ cont',
    'funcContainerRentDesc': 'Thị trường vỏ cont',
    'funcWarehouseRent': 'Thuê và cho thuê kho bãi',
    'funcWarehouseRentDesc': 'Thị trường kho bãi',
    'funcImportExport': 'Thị trường xuất nhập khẩu',
    'funcImportExportDesc': 'Thông tin dịch vụ xuất nhập khẩu',
    'funcTransactions': 'Giao dịch',
    'funcTransactionsDesc': 'Các giao dịch đã thực hiện',
    'funcWallet': 'Ví tiền (logistic)',
    'funcWalletDesc': 'Ví tiền của đơn vị logistic',
    'funcDriver': 'Tài xế',
    'funcDriverDesc': 'Định vị tuyến đường',
  };

  // Thêm từ điển chứa các chuỗi văn bản cho Tiếng Thái
  static const _stringsTh = <String, String>{
    'activities': 'กิจกรรม',
    'addDates': 'เพิ่มวันที่',
    'bookingDeleted': 'การจองถูกลบ',
    'bookNewTrip': 'จองทริปใหม่',
    'close': 'ปิด',
    'confirm': 'ยืนยัน',
    'daytime': 'กลางวัน',
    'errorWhileDeletingBooking': 'เกิดข้อผิดพลาดขณะลบการจอง',
    'errorWhileLoadingActivities': 'เกิดข้อผิดพลาดขณะโหลดกิจกรรม',
    'errorWhileLoadingBooking': 'เกิดข้อผิดพลาดขณะโหลดการจอง',
    'errorWhileLoadingContinents': 'เกิดข้อผิดพลาดขณะโหลดทวีป',
    'errorWhileLoadingDestinations': 'เกิดข้อผิดพลาดขณะโหลดจุดหมายปลายทาง',
    'errorWhileLoadingHome': 'เกิดข้อผิดพลาดขณะโหลดหน้าแรก',
    'errorWhileLogin': 'เกิดข้อผิดพลาดขณะเข้าสู่ระบบ',
    'errorWhileLogout': 'เกิดข้อผิดพลาดขณะออกจากระบบ',
    'errorWhileSavingActivities': 'เกิดข้อผิดพลาดขณะบันทึกกิจกรรม',
    'errorWhileSavingItinerary': 'เกิดข้อผิดพลาดขณะบันทึกแผนการเดินทาง',
    'errorWhileSharing': 'เกิดข้อผิดพลาดขณะแชร์การจอง',
    'evening': 'เย็น',
    'login': 'เข้าสู่ระบบ',
    'register': 'ลงทะเบียน',
    'nameTrips': 'ทริปของ {name}',
    'search': 'ค้นหา',
    'searchDestination': 'ค้นหาจุดหมายปลายทาง',
    'selected': 'เลือก {1}',
    'shareTrip': 'แชร์ทริป',
    'tryAgain': 'ลองอีกครั้ง',
    'yourChosenActivities': 'กิจกรรมที่คุณเลือก',
    'when': 'เมื่อไหร่',
    'chuxe': 'เจ้าของรถ (ยานพาหนะ)',
    // Navigation bar items
    'navHome': 'หน้าแรก',
    'navChat': 'แชท',
    'navTrip': 'ระหว่างทาง',
    'navTransaction': 'ธุรกรรม',
    // Menu items
    'menuMyPosts': 'โพสต์ของฉัน',
    'menuBusinessInfo': 'ข้อมูลธุรกิจ',
    'menuAccount': 'บัญชี',
    // Function items
    'funcTestMap': 'ทดสอบแผนที่ 1',
    'funcTestMapDesc': 'ทดสอบแผนที่ 1',
    'funcCargoOwner': 'เจ้าของสินค้า',
    'funcCargoOwnerDesc':
        'ค้นหารถ; ค้นหารถขากลับ; ค้นหารถในบริเวณใกล้เคียง; ลงประกาศความต้องการขนส่ง',
    'funcMarket': 'ตลาด',
    'funcMarketDesc': 'รายการข้อมูลเกี่ยวกับรถและความต้องการขนส่งสินค้า',
    'funcContainerRent': 'เช่าและให้เช่าตู้คอนเทนเนอร์',
    'funcContainerRentDesc': 'ตลาดตู้คอนเทนเนอร์',
    'funcWarehouseRent': 'เช่าและให้เช่าคลังสินค้า',
    'funcWarehouseRentDesc': 'ตลาดคลังสินค้า',
    'funcImportExport': 'ตลาดนำเข้าส่งออก',
    'funcImportExportDesc': 'ข้อมูลบริการนำเข้าส่งออก',
    'funcTransactions': 'ธุรกรรม',
    'funcTransactionsDesc': 'ธุรกรรมที่ดำเนินการแล้ว',
    'funcWallet': 'กระเป๋าเงิน (โลจิสติกส์)',
    'funcWalletDesc': 'กระเป๋าเงินของหน่วยงานโลจิสติกส์',
    'funcDriver': 'คนขับรถ',
    'funcDriverDesc': 'การนำทางเส้นทาง',
  };

  // Thêm từ điển chứa các chuỗi văn bản cho Tiếng Trung Quốc
  static const _stringsZh = <String, String>{
    'activities': '活动',
    'addDates': '添加日期',
    'bookingDeleted': '预订已删除',
    'bookNewTrip': '预订新行程',
    'close': '关闭',
    'confirm': '确认',
    'daytime': '白天',
    'errorWhileDeletingBooking': '删除预订时出错',
    'errorWhileLoadingActivities': '加载活动时出错',
    'errorWhileLoadingBooking': '加载预订时出错',
    'errorWhileLoadingContinents': '加载大陆时出错',
    'errorWhileLoadingDestinations': '加载目的地时出错',
    'errorWhileLoadingHome': '加载主页时出错',
    'errorWhileLogin': '登录时出错',
    'errorWhileLogout': '登出时出错',
    'errorWhileSavingActivities': '保存活动时出错',
    'errorWhileSavingItinerary': '保存行程时出错',
    'errorWhileSharing': '分享预订时出错',
    'evening': '晚上',
    'login': '登录',
    'register': '注册',
    'nameTrips': '{name}的行程',
    'search': '搜索',
    'searchDestination': '搜索目的地',
    'selected': '已选择 {1}',
    'shareTrip': '分享行程',
    'tryAgain': '再试一次',
    'yourChosenActivities': '你选择的活动',
    'when': '什么时候',
    'chuxe': '车主（车辆）',
    // Navigation bar items
    'navHome': '首页',
    'navChat': '聊天',
    'navTrip': '行程中',
    'navTransaction': '交易',
    // Menu items
    'menuMyPosts': '我的帖子',
    'menuBusinessInfo': '企业信息',
    'menuAccount': '账户',
    // Function items
    'funcTestMap': '测试地图 1',
    'funcTestMapDesc': '测试地图 1',
    'funcCargoOwner': '货主',
    'funcCargoOwnerDesc': '找车辆；找回程车；找附近车辆；发布运输需求',
    'funcMarket': '市场',
    'funcMarketDesc': '车辆和货物运输需求信息列表',
    'funcContainerRent': '集装箱租赁',
    'funcContainerRentDesc': '集装箱市场',
    'funcWarehouseRent': '仓库租赁',
    'funcWarehouseRentDesc': '仓库市场',
    'funcImportExport': '进出口市场',
    'funcImportExportDesc': '进出口服务信息',
    'funcTransactions': '交易',
    'funcTransactionsDesc': '已完成的交易',
    'funcWallet': '钱包（物流）',
    'funcWalletDesc': '物流单位的钱包',
    'funcDriver': '司机',
    'funcDriverDesc': '路线定位',
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
    'chuxe': 'Vehicle owner (vehicle)',
    // Navigation bar items
    'navHome': 'Home',
    'navChat': 'Chat',
    'navTrip': 'Trip',
    'navTransaction': 'Transactions',
    // Menu items
    'menuMyPosts': 'My Posts',
    'menuBusinessInfo': 'Business Information',
    'menuAccount': 'Account',
    // Function items
    'funcTestMap': 'Test map 1',
    'funcTestMapDesc': 'Test map 1',
    'funcCargoOwner': 'Cargo Owner',
    'funcCargoOwnerDesc':
        'Find vehicles; Find return vehicles; Find vehicles nearby; Post transportation needs.',
    'funcMarket': 'Market',
    'funcMarketDesc':
        'List of information about vehicles and cargo transportation needs',
    'funcContainerRent': 'Container Rental',
    'funcContainerRentDesc': 'Container market',
    'funcWarehouseRent': 'Warehouse Rental',
    'funcWarehouseRentDesc': 'Warehouse market',
    'funcImportExport': 'Import/Export Market',
    'funcImportExportDesc': 'Import/Export service information',
    'funcTransactions': 'Transactions',
    'funcTransactionsDesc': 'Completed transactions',
    'funcWallet': 'Wallet (logistics)',
    'funcWalletDesc': 'Logistics unit wallet',
    'funcDriver': 'Driver',
    'funcDriverDesc': 'Route location',
  };

  // Cập nhật phương thức _get để hỗ trợ đa ngôn ngữ
  static String _get(String label, Locale locale) {
    switch (locale.languageCode) {
      case 'vi':
        return _stringsVi[label] ?? '[${label.toUpperCase()}]';
      case 'th':
        return _stringsTh[label] ?? '[${label.toUpperCase()}]';
      case 'zh':
        return _stringsZh[label] ?? '[${label.toUpperCase()}]';
      default:
        return _strings[label] ?? '[${label.toUpperCase()}]';
    }
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

  //'Chủ xe (phương tiện vận tải)'
  String get chuxe => _get('chuxe', locale);

  String get register => _get('register', locale);

  String get errorWhileLogout => _get('errorWhileLogout', locale);

  String get close => _get('close', locale);

  String get errorWhileSharing => _get('errorWhileSharing', locale);

  String get bookNewTrip => _get('bookNewTrip', locale);

  String get errorWhileLoadingHome => _get('errorWhileLoadingHome', locale);

  String get bookingDeleted => _get('bookingDeleted', locale);

  String get errorWhileDeletingBooking =>
      _get('errorWhileDeletingBooking', locale);

  // Navigation bar items
  String get navHome => _get('navHome', locale);
  String get navChat => _get('navChat', locale);
  String get navTrip => _get('navTrip', locale);
  String get navTransaction => _get('navTransaction', locale);

  // Menu items
  String get menuMyPosts => _get('menuMyPosts', locale);
  String get menuBusinessInfo => _get('menuBusinessInfo', locale);
  String get menuAccount => _get('menuAccount', locale);

  // Function items
  String get funcTestMap => _get('funcTestMap', locale);
  String get funcTestMapDesc => _get('funcTestMapDesc', locale);
  String get funcCargoOwner => _get('funcCargoOwner', locale);
  String get funcCargoOwnerDesc => _get('funcCargoOwnerDesc', locale);
  String get funcMarket => _get('funcMarket', locale);
  String get funcMarketDesc => _get('funcMarketDesc', locale);
  String get funcContainerRent => _get('funcContainerRent', locale);
  String get funcContainerRentDesc => _get('funcContainerRentDesc', locale);
  String get funcWarehouseRent => _get('funcWarehouseRent', locale);
  String get funcWarehouseRentDesc => _get('funcWarehouseRentDesc', locale);
  String get funcImportExport => _get('funcImportExport', locale);
  String get funcImportExportDesc => _get('funcImportExportDesc', locale);
  String get funcTransactions => _get('funcTransactions', locale);
  String get funcTransactionsDesc => _get('funcTransactionsDesc', locale);
  String get funcWallet => _get('funcWallet', locale);
  String get funcWalletDesc => _get('funcWalletDesc', locale);
  String get funcDriver => _get('funcDriver', locale);
  String get funcDriverDesc => _get('funcDriverDesc', locale);

  // Phương thức để lấy chuỗi văn bản với tham số
  String nameTrips(String name) =>
      _get('nameTrips', locale).replaceAll('{name}', name);

  String selected(int value) =>
      _get('selected', locale).replaceAll('{1}', value.toString());
}

// Cập nhật lớp AppLocalizationDelegate để hỗ trợ ngôn ngữ Tiếng Việt, Tiếng Thái và Tiếng Trung Quốc
class AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  @override
  bool isSupported(Locale locale) =>
      ['en', 'vi', 'th', 'zh'].contains(locale.languageCode);

  @override
  Future<AppLocalization> load(Locale locale) {
    return SynchronousFuture(AppLocalization(locale));
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
