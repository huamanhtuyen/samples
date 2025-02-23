// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/baocanhang_viewmodel.dart';
import '../../../domain/models/baocanhang/baocanhang_model.dart';

class AddBaoCanHangScreen extends StatefulWidget {
  const AddBaoCanHangScreen({super.key});

  @override
  State<AddBaoCanHangScreen> createState() => _AddBaoCanHangScreenState();
}

class _AddBaoCanHangScreenState extends State<AddBaoCanHangScreen> {
  final _formKey = GlobalKey<FormState>();
  final _biensoxeController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _chieuvetu_matinhController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _chieuvetu_tentinh_tienganhController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _chieuvetu_tentinh_tiengvietController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _chieuvetu_tentinh_tiengthaiController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _chieuvetu_temtinh_tiengtrungController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _veden_matinhController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _veden_tentinh_tienganhController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _veden_tentinh_tiengvietController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _veden_tentinh_tiengthaiController = TextEditingController();
   // ignore: non_constant_identifier_names
  final _veden_temtinh_tiengtrungController = TextEditingController();
  final _gianhanController = TextEditingController();
  final _gianhandvtController = TextEditingController();
  final _ngaydoitoidaController = TextEditingController();
  DateTime _selectedDate = DateTime.now().add(Duration(days: 2));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Bao Can Hang')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _biensoxeController,
                  decoration: InputDecoration(labelText: 'Bienso'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Bienso';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _chieuvetu_matinhController,
                  decoration: InputDecoration(labelText: 'Chieu ve tu Ma Tinh'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Chieu ve tu Ma Tinh';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _chieuvetu_tentinh_tienganhController,
                  decoration: InputDecoration(labelText: 'Chieu ve tu Ten Tinh Tieng Anh'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Chieu ve tu Ten Tinh Tieng Anh';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _chieuvetu_tentinh_tiengvietController,
                  decoration: InputDecoration(labelText: 'Chieu ve tu Ten Tinh Tieng Viet'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Chieu ve tu Ten Tinh Tieng Viet';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _chieuvetu_tentinh_tiengthaiController,
                  decoration: InputDecoration(labelText: 'Chieu ve tu Ten Tinh Tieng Thai'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Chieu ve tu Ten Tinh Tieng Thai';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _chieuvetu_temtinh_tiengtrungController,
                  decoration: InputDecoration(labelText: 'Chieu ve tu Ten Tinh Tieng Trung'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Chieu ve tu Ten Tinh Tieng Trung';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _veden_matinhController,
                  decoration: InputDecoration(labelText: 'Ve den Ma Tinh'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ve den Ma Tinh';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _veden_tentinh_tienganhController,
                  decoration: InputDecoration(labelText: 'Ve den Ten Tinh Tieng Anh'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ve den Ten Tinh Tieng Anh';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _veden_tentinh_tiengvietController,
                  decoration: InputDecoration(labelText: 'Ve den Ten Tinh Tieng Viet'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ve den Ten Tinh Tieng Viet';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _veden_tentinh_tiengthaiController,
                  decoration: InputDecoration(labelText: 'Ve den Ten Tinh Tieng Thai'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ve den Ten Tinh Tieng Thai';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _veden_temtinh_tiengtrungController,
                  decoration: InputDecoration(labelText: 'Ve den Ten Tinh Tieng Trung'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ve den Ten Tinh Tieng Trung';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _gianhanController,
                  decoration: InputDecoration(labelText: 'Gia nhan'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Gia nhan';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _gianhandvtController,
                  decoration: InputDecoration(labelText: 'Gia nhan DVT'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Gia nhan DVT';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _ngaydoitoidaController,
                  decoration: InputDecoration(labelText: 'Ngay doi toi da'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ngay doi toi da';
                    }
                    return null;
                  },
                  onTap: () async {
                    FocusScope.of(context).requestFocus(FocusNode());
                    final DateTime? picked = await showDatePicker(
                      context: context,
                      initialDate: _selectedDate,
                      firstDate: DateTime(2000),
                      lastDate: DateTime(2101),
                    );
                    if (picked != null && picked != _selectedDate) {
                      setState(() {
                        _selectedDate = picked;
                        _ngaydoitoidaController.text = _selectedDate.toIso8601String().split('T').first;
                      });
                    }
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final baoCanHang = BaoCanHang(
                        biensoxe: _biensoxeController.text,
                        chieuvetu_matinh: _chieuvetu_matinhController.text,
                        chieuvetu_tentinh_tienganh: _chieuvetu_tentinh_tienganhController.text,
                        chieuvetu_tentinh_tiengviet: _chieuvetu_tentinh_tiengvietController.text,
                        chieuvetu_tentinh_tiengthai: _chieuvetu_tentinh_tiengthaiController.text,
                        chieuvetu_temtinh_tiengtrung: _chieuvetu_temtinh_tiengtrungController.text,
                        veden_matinh: _veden_matinhController.text,
                        veden_tentinh_tienganh: _veden_tentinh_tienganhController.text,
                        veden_tentinh_tiengviet: _veden_tentinh_tiengvietController.text,
                        veden_tentinh_tiengthai: _veden_tentinh_tiengthaiController.text,
                        veden_temtinh_tiengtrung: _veden_temtinh_tiengtrungController.text,
                        gianhan: double.tryParse(_gianhanController.text),
                        gianhandvt: double.tryParse(_gianhandvtController.text),
                        ngaydoitoida: _selectedDate,
                      );
                      final viewModel = context.read<BaoCanHangViewModel>();
                      await viewModel.addBaoCanHang.execute(baoCanHang);
                      if (!mounted) return;
                      final error = viewModel.addBaoCanHang.error;
                      final errorMsg = viewModel.addBaoCanHang.result.toString();
                      if (error == false) {
                        Navigator.of(context).pop(true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('Failed to add Bao Can Hang: $errorMsg'),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Add Bao Can Hang'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}