// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/routes.dart';
import '../../../core/localization/applocalization.dart';
import '../../../core/themes/dimens.dart';
import '../view_models/login_viewmodel.dart';
import 'tilted_cards.dart';
import '../../../core/ui/language_button_ngang.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key, required this.viewModel});

  final LoginViewModel viewModel;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _email = TextEditingController(
    text: 'test1@gmail.com', // Đặt giá trị mặc định cho email
  );
  final TextEditingController _password = TextEditingController(
    text: '123456', // Đặt giá trị mặc định cho mật khẩu
  );

  @override
  void initState() {
    super.initState();
    widget.viewModel.login.addListener(_onResult); // Thêm listener cho login
  }

  @override
  void didUpdateWidget(covariant LoginScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.login.removeListener(_onResult); // Gỡ listener cũ
    widget.viewModel.login.addListener(_onResult); // Thêm listener mới
  }

  @override
  void dispose() {
    widget.viewModel.login.removeListener(_onResult); // Gỡ listener khi dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const TiltedCards(), // Hiển thị các thẻ nghiêng
          const LanguageButtonNgang(), // Thêm nút chọn ngôn ngữ
          Padding(
            padding: Dimens.of(context).edgeInsetsScreenSymmetric,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                TextField(controller: _email), // Trường nhập email
                const SizedBox(height: Dimens.paddingVertical),
                TextField(
                  controller: _password,
                  obscureText: true,
                ), // Trường nhập mật khẩu
                const SizedBox(height: Dimens.paddingVertical),
                ListenableBuilder(
                  listenable: widget.viewModel.login,
                  builder: (context, _) {
                    return FilledButton(
                      onPressed: () {
                        widget.viewModel.login.execute((
                          _email.value.text,
                          _password.value.text,
                        )); // Thực hiện login
                      },
                      child: Text(
                        AppLocalization.of(context).login,
                      ), // Nút đăng nhập
                    );
                  },
                ),
                TextButton(
                  onPressed: () {
                    print('nhấn nút đăng ký');
                    context.go(Routes.register); // Điều hướng đến trang đăng ký
                  },
                  child: Text('Nếu bạn chưa có tài khoản, hãy đăng ký'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.login.completed) {
      widget.viewModel.login.clearResult(); // Xóa kết quả sau khi hoàn thành
      context.go(Routes.home); // Điều hướng đến trang chủ
    }

    if (widget.viewModel.login.error) {
      widget.viewModel.login.clearResult(); // Xóa kết quả sau khi có lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalization.of(context).errorWhileLogin,
          ), // Hiển thị thông báo lỗi
          action: SnackBarAction(
            label: AppLocalization.of(context).tryAgain,
            onPressed:
                () => widget.viewModel.login.execute((
                  _email.value.text,
                  _password.value.text,
                )), // Thử lại đăng nhập
          ),
        ),
      );
    }
  }
}
