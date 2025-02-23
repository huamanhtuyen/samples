// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/thongtinxe_viewmodel.dart';
import '../../../domain/models/thongtinxe/thongtinxe_model.dart';
import '../../../utils/result.dart';

class AddThongTinXeScreen extends StatefulWidget {
  const AddThongTinXeScreen({super.key});

  @override
  State<AddThongTinXeScreen> createState() => _AddThongTinXeScreenState();
}

class _AddThongTinXeScreenState extends State<AddThongTinXeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _anh1Controller = TextEditingController();
  final _anh2Controller = TextEditingController();
  final _anh3Controller = TextEditingController();
  final _anh4Controller = TextEditingController();
  final _anh5Controller = TextEditingController();
  final _anh6Controller = TextEditingController();
  final _anh7Controller = TextEditingController();
  final _anh8Controller = TextEditingController();
  final _anh9Controller = TextEditingController();
  final _matinhController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _tentinh_tienganhController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _tentinh_tiengvietController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _tentinh_tiengthaiController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _temtinh_tiengtrungController = TextEditingController();
  final _maquanController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _tenquan_tienganhController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _tenquan_tiengvietController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _tenquan_tiengthaiController = TextEditingController();
  // ignore: non_constant_identifier_names
  final _tenquan_tiengtrungController = TextEditingController();
  final _diachichitietController = TextEditingController();
  final _biensoController = TextEditingController();
  final _maloaixeController = TextEditingController();
  
  Future<void> _pickAndUploadImage() async {
  final viewModel = context.read<ThongTinXeViewModel>();
  await viewModel.pickAndUploadImage.execute();
  final result = viewModel.pickAndUploadImage.result;
  if (result != null) {
    if (result is Ok<String?>) {
      final imageUrl = result.value;
      setState(() {
        _anh1Controller.text = imageUrl ?? '';
      });
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image uploaded successfully'),
        ),
      );
    } else if (result is Error<String?>) {
      final error = result.error;
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Image loaded unsuccessfully: $error'),
        ),
      );
    }
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Image upload result is null'),
      ),
    );
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Thong Tin Xe')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter email';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _nameController,
                  decoration: InputDecoration(labelText: 'Name'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter name';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(labelText: 'Phone Number'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter phone number';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: _pickAndUploadImage,
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: _anh1Controller.text.isEmpty
                        ? Icon(Icons.add_a_photo)
                        : Image.network(_anh1Controller.text, fit: BoxFit.cover),
                  ),
                ),
                TextFormField(
                  controller: _anh1Controller,
                  decoration: InputDecoration(labelText: 'Anh 1'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh 1';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _anh2Controller,
                  decoration: InputDecoration(labelText: 'Anh 2'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh 2';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _anh3Controller,
                  decoration: InputDecoration(labelText: 'Anh 3'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh 3';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _anh4Controller,
                  decoration: InputDecoration(labelText: 'Anh 4'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh 4';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _anh5Controller,
                  decoration: InputDecoration(labelText: 'Anh 5'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh 5';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _anh6Controller,
                  decoration: InputDecoration(labelText: 'Anh 6'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh 6';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _anh7Controller,
                  decoration: InputDecoration(labelText: 'Anh 7'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh 7';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _anh8Controller,
                  decoration: InputDecoration(labelText: 'Anh 8'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh 8';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _anh9Controller,
                  decoration: InputDecoration(labelText: 'Anh 9'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh 9';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _matinhController,
                  decoration: InputDecoration(labelText: 'Ma Tinh'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ma Tinh';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tentinh_tienganhController,
                  decoration: InputDecoration(labelText: 'Ten Tinh Tieng Anh'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Tinh Tieng Anh';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tentinh_tiengvietController,
                  decoration: InputDecoration(labelText: 'Ten Tinh Tieng Viet'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Tinh Tieng Viet';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tentinh_tiengthaiController,
                  decoration: InputDecoration(labelText: 'Ten Tinh Tieng Thai'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Tinh Tieng Thai';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _temtinh_tiengtrungController,
                  decoration: InputDecoration(labelText: 'Ten Tinh Tieng Trung'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Tinh Tieng Trung';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _maquanController,
                  decoration: InputDecoration(labelText: 'Ma Quan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ma Quan';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tenquan_tienganhController,
                  decoration: InputDecoration(labelText: 'Ten Quan Tieng Anh'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Quan Tieng Anh';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tenquan_tiengvietController,
                  decoration: InputDecoration(labelText: 'Ten Quan Tieng Viet'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Quan Tieng Viet';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tenquan_tiengthaiController,
                  decoration: InputDecoration(labelText: 'Ten Quan Tieng Thai'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Quan Tieng Thai';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tenquan_tiengtrungController,
                  decoration: InputDecoration(labelText: 'Ten Quan Tieng Trung'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Quan Tieng Trung';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _diachichitietController,
                  decoration: InputDecoration(labelText: 'Dia Chi Chi Tiet'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Dia Chi Chi Tiet';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _biensoController,
                  decoration: InputDecoration(labelText: 'Bien So'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Bien So';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _maloaixeController,
                  decoration: InputDecoration(labelText: 'Ma Loai Xe'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ma Loai Xe';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final thongTinXe = ThongTinXe(
                        email: _emailController.text,                   
                        anh1: _anh1Controller.text,
                        anh2: _anh2Controller.text,
                        anh3: _anh3Controller.text,
                        anh4: _anh4Controller.text,
                        anh5: _anh5Controller.text,
                        anh6: _anh6Controller.text,
                        anh7: _anh7Controller.text,
                        anh8: _anh8Controller.text,
                        anh9: _anh9Controller.text,
                        matinh: _matinhController.text,
                        tentinh_tienganh: _tentinh_tienganhController.text,
                        tentinh_tiengviet: _tentinh_tiengvietController.text,
                        tentinh_tiengthai: _tentinh_tiengthaiController.text,
                        temtinh_tiengtrung: _temtinh_tiengtrungController.text,
                        maquan: _maquanController.text,
                        tenquan_tienganh: _tenquan_tienganhController.text,
                        tenquan_tiengviet: _tenquan_tiengvietController.text,
                        tenquan_tiengthai: _tenquan_tiengthaiController.text,
                        tenquan_tiengtrung: _tenquan_tiengtrungController.text,
                        diachichitiet: _diachichitietController.text,
                        bienso: _biensoController.text,
                        maloaixe: _maloaixeController.text,
                        // Add more fields as needed
                      );
                      final viewModel = context.read<ThongTinXeViewModel>();
                      await viewModel.addThongTinXe.execute(thongTinXe);
                      if (!mounted) return;
                      final error = viewModel.addThongTinXe.error;
                      final errorMsg = viewModel.addThongTinXe.result.toString();
                      if (error == false) {
                        Navigator.of(context).pop(true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to add Thong Tin Xe: $errorMsg'),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Add Thong Tin Xe'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
