import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';
import 'edit_profile_screen.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Thông tin doanh nghiệp'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
      body: Container(
        color: Theme.of(context).colorScheme.onPrimary,
        child: FutureBuilder<Result<User>>(
          future: context.read<UserRepository>().getUser(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              final result = snapshot.data!;
              switch (result) {
                case Ok():
                  {
                    final user = result.value;
                    return SingleChildScrollView(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildInfoRow(context, 'Mst: ', user.mst),
                          const SizedBox(height: 5),
                          Visibility(
                            visible: false,
                            child:
                                user.picture != null
                                    ? Image.network(user.picture ?? '')
                                    : const SizedBox.shrink(),
                          ),
                          _buildInfoRow(context, 'Tên công ty: ', user.tencty),
                          const SizedBox(height: 5),
                          _buildInfoRow(context, 'Địa chỉ: ', user.diachi),
                          const SizedBox(height: 5),
                          _buildInfoRow(context, 'SĐT 1: ', user.sdt1),
                          const SizedBox(height: 5),
                          _buildInfoRow(context, 'SĐT 2: ', user.sdt2),
                          const SizedBox(height: 5),
                          _buildInfoRow(context, 'SĐT 3: ', user.sdt3),
                          const SizedBox(height: 5),
                          _buildInfoRow(
                            context,
                            'Người đại diện DN: ',
                            user.nguoidaidiendn,
                          ),
                          const SizedBox(height: 5),
                          _buildInfoRow(context, 'STK 1: ', user.stk1),
                          const SizedBox(height: 5),
                          _buildInfoRow(
                            context,
                            'Tên ngân hàng 1: ',
                            user.tennganhang1,
                          ),
                          const SizedBox(height: 5),
                          _buildInfoRow(context, 'STK 2: ', user.stk2),
                          const SizedBox(height: 5),
                          _buildInfoRow(
                            context,
                            'Tên ngân hàng 2: ',
                            user.tennganhang2,
                          ),
                          const SizedBox(height: 5),
                          _buildInfoRow(context, 'STK 3: ', user.stk3),
                          const SizedBox(height: 5),
                          _buildInfoRow(
                            context,
                            'Tên ngân hàng 3: ',
                            user.tennganhang3,
                          ),
                          const SizedBox(height: 5),
                          Center(
                            child: Column(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder:
                                            (context) =>
                                                const EditProfileScreen(),
                                      ),
                                    );
                                  },
                                  child: const Text(
                                    'Sửa thông tin doanh nghiệp',
                                  ),
                                ),
                                const SizedBox(height: 5),
                                TextButton(
                                  onPressed: () async {
                                    await context
                                        .read<UserRepository>()
                                        .deleteUser();
                                  },
                                  style: TextButton.styleFrom(
                                    foregroundColor: Colors.red.withAlpha(128),
                                  ),
                                  child: const Text('Xóa tài khoản'),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                case Error():
                  {
                    return Text(result.error.toString());
                  }
              }
            } else {
              return const Center(child: Text('No user data available'));
            }
          },
        ),
      ),
    );
  }

  Widget _buildInfoRow(BuildContext context, String label, String? value) {
    return Row(
      children: [
        Text(label, style: Theme.of(context).textTheme.labelMedium),
        Text(
          value ?? '',
          style: const TextStyle(fontSize: 20, color: Colors.blue),
        ),
      ],
    );
  }
}
