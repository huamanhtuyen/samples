// Copyright 2024 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../routing/routes.dart';
import '../../../core/localization/applocalization.dart';
import '../../../core/themes/dimens.dart';
import '../view_models/register_viewmodel.dart';
import 'tilted_cards.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key, required this.viewModel});

  final RegisterViewModel viewModel;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _email = TextEditingController(
    text: 'email@example.com', // Đặt giá trị mặc định cho email
  );
  final TextEditingController _password = TextEditingController(
    text: 'password', // Đặt giá trị mặc định cho mật khẩu
  );

  @override
  void initState() {
    super.initState();
    widget.viewModel.register.addListener(_onResult); // Thêm listener cho login
  }

  @override
  void didUpdateWidget(covariant RegisterScreen oldWidget) {
    super.didUpdateWidget(oldWidget);
    oldWidget.viewModel.register.removeListener(_onResult); // Gỡ listener cũ
    widget.viewModel.register.addListener(_onResult); // Thêm listener mới
  }

  @override
  void dispose() {
    widget.viewModel.register.removeListener(
      _onResult,
    ); // Gỡ listener khi dispose
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
                  listenable: widget.viewModel.register,
                  builder: (context, _) {
                    return FilledButton(
                      onPressed: () {
                        widget.viewModel.register.execute((
                          _email.value.text,
                          _password.value.text,
                        )); // Thực hiện register
                      },
                      child: Text(
                        AppLocalization.of(context).register,
                      ), // Nút đăng ký
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void _onResult() {
    if (widget.viewModel.register.completed) {
      widget.viewModel.register.clearResult(); // Xóa kết quả sau khi hoàn thành
      context.go(Routes.home); // Điều hướng đến trang chủ
    }

    if (widget.viewModel.register.error) {
      widget.viewModel.register.clearResult(); // Xóa kết quả sau khi có lỗi
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            AppLocalization.of(context).errorWhileLogin,
          ), // Hiển thị thông báo lỗi
          action: SnackBarAction(
            label: AppLocalization.of(context).tryAgain,
            onPressed:
                () => widget.viewModel.register.execute((
                  _email.value.text,
                  _password.value.text,
                )), // Thử lại đăng ký
          ),
        ),
      );
    }
  }
}
