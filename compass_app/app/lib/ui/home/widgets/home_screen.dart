// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../../routing/routes.dart';
import '../view_models/home_viewmodel.dart';
import '../../core/ui/language_button.dart';
import '../../auth/logout/widgets/logout_button_big.dart';
import '../../auth/logout/view_models/logout_viewmodel.dart';
import 'package:provider/provider.dart';
import '../../core/ui/navigation_bar.dart'; // Import NavigationBars

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key, required this.viewModel});

  final HomeViewModel viewModel; // Biến viewModel

  @override
  State<HomeScreen> createState() => _ExampleStaggeredAnimationsState();
}

class _ExampleStaggeredAnimationsState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController
  _drawerSlideController; // Điều khiển hoạt ảnh cho drawer
  late int _selectedIndex = 0; // Add selectedIndex for NavigationBars

  @override
  void initState() {
    super.initState();

    _drawerSlideController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 150), // Thời gian hoạt ảnh
    );
  }

  @override
  void dispose() {
    _drawerSlideController.dispose(); // Giải phóng tài nguyên
    super.dispose();
  }

  bool _isDrawerOpen() {
    return _drawerSlideController.value == 1.0; // Kiểm tra drawer có mở không
  }

  bool _isDrawerOpening() {
    return _drawerSlideController.status ==
        AnimationStatus.forward; // Kiểm tra drawer đang mở
  }

  bool _isDrawerClosed() {
    return _drawerSlideController.value == 0.0; // Kiểm tra drawer có đóng không
  }

  void _toggleDrawer() {
    if (_isDrawerOpen() || _isDrawerOpening()) {
      _drawerSlideController.reverse(); // Đóng drawer
    } else {
      _drawerSlideController.forward(); // Mở drawer
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          Theme.of(
            context,
          ).scaffoldBackgroundColor, // Use theme background color
      appBar: _buildAppBar(context), // Pass context to _buildAppBar
      body: Stack(
        children: [_buildContent(), _buildDrawer()],
      ), // Xây dựng nội dung và drawer
      bottomNavigationBar: NavigationBars(
        selectedIndex: _selectedIndex,
        onSelectItem: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
      ), // Add NavigationBars at the bottom
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return AppBar(
      title: const Text('LogiW', style: TextStyle(color: Colors.black)),
      backgroundColor:
          Theme.of(
            context,
          ).appBarTheme.backgroundColor, // Use theme app bar color
      elevation: 0.0,
      automaticallyImplyLeading: false,
      actions: [
        // Nút ngôn ngữ
        const LanguageButton(),
        // Nút thông báo
        IconButton(
          onPressed: () {
            context.go('/notifications'); // Điều hướng tới trang thông báo
          },
          icon: Icon(
            Icons.notifications,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        //nút menu
        AnimatedBuilder(
          animation: _drawerSlideController,
          builder: (context, child) {
            return IconButton(
              onPressed: _toggleDrawer,
              icon:
                  _isDrawerOpen() || _isDrawerOpening()
                      ? Icon(
                        Icons.clear,
                        color: Colors.black,
                      ) // Icon khi drawer mở
                      : Icon(
                        Icons.menu,
                        color: Theme.of(context).colorScheme.primary,
                      ), // Icon khi drawer đóng
            );
          },
        ),
      ],
    );
  }

  //build phần content của HomeScreen
  Widget _buildContent() {
    final cacChucNang = [];
    cacChucNang.add({
      'title': 'Test map 1',
      'description': 'Test map 1',
      'route': Routes.testmap1,
    });
    cacChucNang.add({
      'title': 'Chủ xe (phương tiện vận tải)',
      'description':
          'Tìm hàng; Báo xe trống cần hàng; Báo cần hàng chiều về; Đăng thông tin xe.',
      'route': Routes.chuXe,
    });
    cacChucNang.add({
      'title': 'Chủ hàng',
      'description':
          'Tìm xe; Tìm xe chiều về; Tìm xe quanh đây; Đăng nhu cầu vận chuyển.',
      'route': Routes.chuHang,
    });
    cacChucNang.add({
      'title': 'Thị trường',
      'description': 'Danh sách thông tin về xe và nhu cầu vận chuyển hàng',
      'route': Routes.chuXe,
    });
    cacChucNang.add({
      'title': 'Thuê và cho thuê vỏ cont',
      'description': 'Thị trường vỏ cont',
      'route': Routes.canthuecont,
    });
    cacChucNang.add({
      'title': 'Thuê và cho thuê kho bãi',
      'description': 'Thị trường kho bãi',
      'route': Routes.chuXe,
    });
    cacChucNang.add({
      'title': 'Thị trường xuất nhập khẩu',
      'description': 'Thông tin dịch vụ xuất nhập khẩu',
      'route': Routes.chuXe,
    });
    cacChucNang.add({
      'title': 'Giao dịch',
      'description': 'Các giao dịch đã thực hiện',
      'route': Routes.chuXe,
    });
    cacChucNang.add({
      'title': 'Ví tiền (logistic)',
      'description': 'Ví tiền của đơn vị logistic',
      'route': Routes.chuXe,
    });
    cacChucNang.add({
      'title': 'Tài xế',
      'description': 'Định vị tuyến đường',
      'route': Routes.chuXe,
    });

    return Container(
      color: Colors.white, // Đặt màu nền cho Container
      child: ListView.builder(
        padding: const EdgeInsets.fromLTRB(16.0, 16, 16, 200),
        itemCount: cacChucNang.length,
        itemBuilder: (context, index) {
          final chucNang = cacChucNang[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            elevation: 0, // Remove shadow
            color: Theme.of(context).colorScheme.onPrimary, //khá đẹp
            child: ListTile(
              leading: Icon(
                Icons.apps,
                color: Theme.of(context).colorScheme.primary,
              ),
              title: Text(
                chucNang['title']!,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              subtitle: Text(
                chucNang['description']!,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              onTap: () {
                // Điều hướng tới các trang tương ứng
                context.go(chucNang['route']!);
              },
            ),
          );
        },
      ),
    );
  } //end _buildContent

  Widget _buildDrawer() {
    return AnimatedBuilder(
      animation: _drawerSlideController,
      builder: (context, child) {
        return FractionalTranslation(
          translation: Offset(
            1.0 - _drawerSlideController.value,
            0.0,
          ), // Dịch chuyển drawer
          child:
              _isDrawerClosed()
                  ? const SizedBox()
                  : const Menu(), // Hiển thị drawer khi mở
        );
      },
    );
  }
}

//nút menu trên phải
class Menu extends StatefulWidget {
  const Menu({super.key});

  @override
  State<Menu> createState() => _MenuState();
}

class _MenuState extends State<Menu> with SingleTickerProviderStateMixin {
  static const _menuTitles = [
    'Thông tin doanh nghiệp',
    'Tài khoản',
  ]; // Danh sách tiêu đề menu

  static const _initialDelayTime = Duration(
    milliseconds: 50,
  ); // Thời gian trễ ban đầu
  static const _itemSlideTime = Duration(
    milliseconds: 250,
  ); // Thời gian trượt của mỗi mục
  static const _staggerTime = Duration(
    milliseconds: 50,
  ); // Thời gian trễ giữa các mục
  static const _buttonDelayTime = Duration(
    milliseconds: 150,
  ); // Thời gian trễ của nút
  static const _buttonTime = Duration(
    milliseconds: 500,
  ); // Thời gian hoạt ảnh của nút
  final _animationDuration =
      _initialDelayTime +
      (_staggerTime * _menuTitles.length) +
      _buttonDelayTime +
      _buttonTime; // Tổng thời gian hoạt ảnh

  late AnimationController _staggeredController; // Điều khiển hoạt ảnh
  final List<Interval> _itemSlideIntervals =
      []; // Danh sách khoảng thời gian hoạt ảnh cho các mục
  late Interval _buttonInterval; // Khoảng thời gian hoạt ảnh cho nút

  @override
  void initState() {
    super.initState();

    _createAnimationIntervals(); // Tạo các khoảng thời gian hoạt ảnh

    _staggeredController = AnimationController(
      vsync: this,
      duration: _animationDuration,
    )..forward(); // Bắt đầu hoạt ảnh
  }

  void _createAnimationIntervals() {
    for (var i = 0; i < _menuTitles.length; ++i) {
      final startTime = _initialDelayTime + (_staggerTime * i);
      final endTime = startTime + _itemSlideTime;
      _itemSlideIntervals.add(
        Interval(
          startTime.inMilliseconds / _animationDuration.inMilliseconds,
          endTime.inMilliseconds / _animationDuration.inMilliseconds,
        ),
      );
    }

    final buttonStartTime =
        Duration(milliseconds: (_menuTitles.length * 50)) + _buttonDelayTime;
    final buttonEndTime = buttonStartTime + _buttonTime;
    _buttonInterval = Interval(
      buttonStartTime.inMilliseconds / _animationDuration.inMilliseconds,
      buttonEndTime.inMilliseconds / _animationDuration.inMilliseconds,
    );
    if (_buttonInterval.end > 1.0) {}
  }

  @override
  void dispose() {
    _staggeredController.dispose(); // Giải phóng tài nguyên
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Stack(
        fit: StackFit.expand,
        children: [
          _buildFlutterLogo(),
          _buildContent(),
        ], // Xây dựng logo và nội dung
      ),
    );
  }

  Widget _buildFlutterLogo() {
    return const Positioned(
      right: -100,
      child: Opacity(
        opacity: 0.2,
        child: FlutterLogo(size: 400),
      ), // Logo Flutter
    );
  }

  Widget _buildContent() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        const SizedBox(height: 16),
        ..._buildListItems(), // Xây dựng các mục trong danh sách
        const Spacer(),
      ],
    );
  }

  List<Widget> _buildListItems() {
    final listItems = <Widget>[];
    for (var i = 0; i < _menuTitles.length; ++i) {
      listItems.add(
        AnimatedBuilder(
          animation: _staggeredController,
          builder: (context, child) {
            final animationPercent = Curves.easeOut.transform(
              _itemSlideIntervals[i].transform(_staggeredController.value),
            );
            final opacity = animationPercent;
            final slideDistance = (1.0 - animationPercent) * 150;

            return Opacity(
              opacity: opacity,
              child: Transform.translate(
                offset: Offset(slideDistance, 0),
                child: child,
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            //menu item
            child: SizedBox(
              width: 300, // Thiết lập chiều rộng của nút
              child: ElevatedButton(
                onPressed: () {
                  // Điều hướng tới các trang tương ứng
                  switch (_menuTitles[i]) {
                    case 'Thông tin doanh nghiệp':
                      context.go(Routes.editprofile);
                      break;
                    case 'Tài khoản':
                      context.go(Routes.profile);
                      break;
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 16,
                  ),
                  textStyle: Theme.of(context).textTheme.titleSmall,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18), // Bo góc nút
                  ),
                  elevation:
                      0, // Loại bỏ bóng đổ để phù hợp với Material Design 3
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(
                      _getIconForMenuTitle(_menuTitles[i]),
                      color: Theme.of(context).colorScheme.primary,
                    ),
                    const SizedBox(width: 8),
                    Text(_menuTitles[i]),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }

    // Thêm LogoutButtonBig vào danh sách menu item
    listItems.add(
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Builder(
          builder: (context) {
            return LogoutButtonBig(
              // Nút đăng xuất
              viewModel: LogoutViewModel(
                // Khởi tạo LogoutViewModel
                authRepository: context.read(), // Lấy authRepository từ context
                itineraryConfigRepository:
                    context.read(), // Lấy itineraryConfigRepository từ context
              ),
            );
          },
        ),
      ),
    );

    return listItems;
  }
}

IconData _getIconForMenuTitle(String title) {
  switch (title) {
    case 'Thông tin doanh nghiệp':
      return Icons.business;
    case 'Tài khoản':
      return Icons.account_circle;
    default:
      return Icons.help;
  }
}
