import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _mst;
  late String _picture;
  late String _tencty;
  late String _diachi;
  late String _sdt1;
  late String _sdt2;
  late String _sdt3;
  late String _nguoidaidiendn;
  late String _stk1;
  late String _tennganhang1;
  late String _stk2;
  late String _tennganhang2;
  late String _stk3;
  late String _tennganhang3;
  User? _user; // Add this line

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Thông tin doanh nghiệp')),
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
                    _user = user; // Add this line
                    _mst = user.mst ?? '';
                    _picture = user.picture ?? '';
                    _tencty = user.tencty ?? '';
                    _diachi = user.diachi ?? '';
                    _sdt1 = user.sdt1 ?? '';
                    _sdt2 = user.sdt2 ?? '';
                    _sdt3 = user.sdt3 ?? '';
                    _nguoidaidiendn = user.nguoidaidiendn ?? '';
                    _stk1 = user.stk1 ?? '';
                    _tennganhang1 = user.tennganhang1 ?? '';
                    _stk2 = user.stk2 ?? '';
                    _tennganhang2 = user.tennganhang2 ?? '';
                    _stk3 = user.stk3 ?? '';
                    _tennganhang3 = user.tennganhang3 ?? '';
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              TextFormField(
                                initialValue: _mst,
                                decoration: const InputDecoration(
                                  labelText: 'Mst',
                                ),
                                onSaved: (value) {
                                  _mst = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _tencty,
                                decoration: const InputDecoration(
                                  labelText: 'Tên công ty',
                                ),
                                onSaved: (value) {
                                  _tencty = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _diachi,
                                decoration: const InputDecoration(
                                  labelText: 'Địa chỉ',
                                ),
                                onSaved: (value) {
                                  _diachi = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _sdt1,
                                decoration: const InputDecoration(
                                  labelText: 'Số điện thoại 1',
                                ),
                                onSaved: (value) {
                                  _sdt1 = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _sdt2,
                                decoration: const InputDecoration(
                                  labelText: 'Số điện thoại 2',
                                ),
                                onSaved: (value) {
                                  _sdt2 = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _sdt3,
                                decoration: const InputDecoration(
                                  labelText: 'Số điện thoại 3',
                                ),
                                onSaved: (value) {
                                  _sdt3 = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _nguoidaidiendn,
                                decoration: const InputDecoration(
                                  labelText: 'Người đại diện doanh nghiệp',
                                ),
                                onSaved: (value) {
                                  _nguoidaidiendn = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _stk1,
                                decoration: const InputDecoration(
                                  labelText: 'Số tài khoản 1',
                                ),
                                onSaved: (value) {
                                  _stk1 = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _tennganhang1,
                                decoration: const InputDecoration(
                                  labelText: 'Tên ngân hàng 1',
                                ),
                                onSaved: (value) {
                                  _tennganhang1 = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _stk2,
                                decoration: const InputDecoration(
                                  labelText: 'Số tài khoản 2',
                                ),
                                onSaved: (value) {
                                  _stk2 = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _tennganhang2,
                                decoration: const InputDecoration(
                                  labelText: 'Tên ngân hàng 2',
                                ),
                                onSaved: (value) {
                                  _tennganhang2 = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _stk3,
                                decoration: const InputDecoration(
                                  labelText: 'Số tài khoản 3',
                                ),
                                onSaved: (value) {
                                  _stk3 = value!;
                                },
                              ),
                              TextFormField(
                                initialValue: _tennganhang3,
                                decoration: const InputDecoration(
                                  labelText: 'Tên ngân hàng 3',
                                ),
                                onSaved: (value) {
                                  _tennganhang3 = value!;
                                },
                              ),
                              Visibility(
                                visible: false,
                                child: TextFormField(
                                  initialValue: _picture,
                                  decoration: const InputDecoration(
                                    labelText: 'Picture URL',
                                  ),
                                  onSaved: (value) {
                                    _picture = value!;
                                  },
                                ),
                              ),
                              const SizedBox(height: 20),
                            ],
                          ),
                        ),
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
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (_formKey.currentState!.validate()) {
            _formKey.currentState!.save();
            if (_user != null) {
              // Add this check
              final result = await context.read<UserRepository>().updateUser(
                User(
                  id: _user!.id, // Use _user here
                  mst: _mst,
                  picture: _picture,
                  tencty: _tencty,
                  diachi: _diachi,
                  sdt1: _sdt1,
                  sdt2: _sdt2,
                  sdt3: _sdt3,
                  nguoidaidiendn: _nguoidaidiendn,
                  stk1: _stk1,
                  tennganhang1: _tennganhang1,
                  stk2: _stk2,
                  tennganhang2: _tennganhang2,
                  stk3: _stk3,
                  tennganhang3: _tennganhang3,
                ),
              );
              switch (result) {
                case Ok():
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Profile updated successfully'),
                      ),
                    );
                  }
                case Error():
                  {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: ${result.error}')),
                    );
                  }
              }
            }
          }
        },
        label: const Text('Lưu lại'),
        icon: const Icon(Icons.save),
      ),
    );
  }
}
