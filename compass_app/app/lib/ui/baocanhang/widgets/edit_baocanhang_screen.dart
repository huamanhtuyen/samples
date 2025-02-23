// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/baocanhang_viewmodel.dart';
import '../../../domain/models/baocanhang/baocanhang_model.dart';

class EditBaoCanHangScreen extends StatefulWidget {
  final BaoCanHang baoCanHang;

  const EditBaoCanHangScreen({super.key, required this.baoCanHang});

  @override
  State<EditBaoCanHangScreen> createState() => _EditBaoCanHangScreenState();
}

class _EditBaoCanHangScreenState extends State<EditBaoCanHangScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _biensoxe;
  late String _chieuvetu_matinh;
  late String _chieuvetu_tentinh_tienganh;
  late String _chieuvetu_tentinh_tiengviet;
  late String _chieuvetu_tentinh_tiengthai;
  late String _chieuvetu_temtinh_tiengtrung;
  late String _veden_matinh;
  late String _veden_tentinh_tienganh;
  late String _veden_tentinh_tiengviet;
  late String _veden_tentinh_tiengthai;
  late String _veden_temtinh_tiengtrung;
  late double _gianhan;
  late double _gianhandvt;
  late DateTime _ngaydoitoida;

  @override
  void initState() {
    super.initState();
    _biensoxe = widget.baoCanHang.biensoxe ?? '';
    _chieuvetu_matinh = widget.baoCanHang.chieuvetu_matinh ?? '';
    _chieuvetu_tentinh_tienganh = widget.baoCanHang.chieuvetu_tentinh_tienganh ?? '';
    _chieuvetu_tentinh_tiengviet = widget.baoCanHang.chieuvetu_tentinh_tiengviet ?? '';
    _chieuvetu_tentinh_tiengthai = widget.baoCanHang.chieuvetu_tentinh_tiengthai ?? '';
    _chieuvetu_temtinh_tiengtrung = widget.baoCanHang.chieuvetu_temtinh_tiengtrung ?? '';
    _veden_matinh = widget.baoCanHang.veden_matinh ?? '';
    _veden_tentinh_tienganh = widget.baoCanHang.veden_tentinh_tienganh ?? '';
    _veden_tentinh_tiengviet = widget.baoCanHang.veden_tentinh_tiengviet ?? '';
    _veden_tentinh_tiengthai = widget.baoCanHang.veden_tentinh_tiengthai ?? '';
    _veden_temtinh_tiengtrung = widget.baoCanHang.veden_temtinh_tiengtrung ?? '';
    _gianhan = widget.baoCanHang.gianhan ?? 0.0;
    _gianhandvt = widget.baoCanHang.gianhandvt ?? 0.0;
    _ngaydoitoida = widget.baoCanHang.ngaydoitoida ?? DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Bao Can Hang')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _biensoxe,
                decoration: InputDecoration(labelText: 'Bienso'),
                onSaved: (value) {
                  _biensoxe = value!;
                },
              ),
              TextFormField(
                initialValue: _chieuvetu_matinh,
                decoration: InputDecoration(labelText: 'Chieu ve tu Ma Tinh'),
                onSaved: (value) {
                  _chieuvetu_matinh = value!;
                },
              ),
              TextFormField(
                initialValue: _chieuvetu_tentinh_tienganh,
                decoration: InputDecoration(labelText: 'Chieu ve tu Ten Tinh Tieng Anh'),
                onSaved: (value) {
                  _chieuvetu_tentinh_tienganh = value!;
                },
              ),
              TextFormField(
                initialValue: _chieuvetu_tentinh_tiengviet,
                decoration: InputDecoration(labelText: 'Chieu ve tu Ten Tinh Tieng Viet'),
                onSaved: (value) {
                  _chieuvetu_tentinh_tiengviet = value!;
                },
              ),
              TextFormField(
                initialValue: _chieuvetu_tentinh_tiengthai,
                decoration: InputDecoration(labelText: 'Chieu ve tu Ten Tinh Tieng Thai'),
                onSaved: (value) {
                  _chieuvetu_tentinh_tiengthai = value!;
                },
              ),
              TextFormField(
                initialValue: _chieuvetu_temtinh_tiengtrung,
                decoration: InputDecoration(labelText: 'Chieu ve tu Ten Tinh Tieng Trung'),
                onSaved: (value) {
                  _chieuvetu_temtinh_tiengtrung = value!;
                },
              ),
              TextFormField(
                initialValue: _veden_matinh,
                decoration: InputDecoration(labelText: 'Ve den Ma Tinh'),
                onSaved: (value) {
                  _veden_matinh = value!;
                },
              ),
              TextFormField(
                initialValue: _veden_tentinh_tienganh,
                decoration: InputDecoration(labelText: 'Ve den Ten Tinh Tieng Anh'),
                onSaved: (value) {
                  _veden_tentinh_tienganh = value!;
                },
              ),
              TextFormField(
                initialValue: _veden_tentinh_tiengviet,
                decoration: InputDecoration(labelText: 'Ve den Ten Tinh Tieng Viet'),
                onSaved: (value) {
                  _veden_tentinh_tiengviet = value!;
                },
              ),
              TextFormField(
                initialValue: _veden_tentinh_tiengthai,
                decoration: InputDecoration(labelText: 'Ve den Ten Tinh Tieng Thai'),
                onSaved: (value) {
                  _veden_tentinh_tiengthai = value!;
                },
              ),
              TextFormField(
                initialValue: _veden_temtinh_tiengtrung,
                decoration: InputDecoration(labelText: 'Ve den Ten Tinh Tieng Trung'),
                onSaved: (value) {
                  _veden_temtinh_tiengtrung = value!;
                },
              ),
              TextFormField(
                initialValue: _gianhan.toString(),
                decoration: InputDecoration(labelText: 'Gia nhan'),
                onSaved: (value) {
                  _gianhan = double.parse(value!);
                },
              ),
              TextFormField(
                initialValue: _gianhandvt.toString(),
                decoration: InputDecoration(labelText: 'Gia nhan DVT'),
                onSaved: (value) {
                  _gianhandvt = double.parse(value!);
                },
              ),
              TextFormField(
                initialValue: _ngaydoitoida.toIso8601String(),
                decoration: InputDecoration(labelText: 'Ngay doi toi da'),
                onSaved: (value) {
                  _ngaydoitoida = DateTime.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final updatedBaoCanHang = BaoCanHang(
                      id: widget.baoCanHang.id,
                      biensoxe: _biensoxe,
                      chieuvetu_matinh: _chieuvetu_matinh,
                      chieuvetu_tentinh_tienganh: _chieuvetu_tentinh_tienganh,
                      chieuvetu_tentinh_tiengviet: _chieuvetu_tentinh_tiengviet,
                      chieuvetu_tentinh_tiengthai: _chieuvetu_tentinh_tiengthai,
                      chieuvetu_temtinh_tiengtrung: _chieuvetu_temtinh_tiengtrung,
                      veden_matinh: _veden_matinh,
                      veden_tentinh_tienganh: _veden_tentinh_tienganh,
                      veden_tentinh_tiengviet: _veden_tentinh_tiengviet,
                      veden_tentinh_tiengthai: _veden_tentinh_tiengthai,
                      veden_temtinh_tiengtrung: _veden_temtinh_tiengtrung,
                      gianhan: _gianhan,
                      gianhandvt: _gianhandvt,
                      ngaydoitoida: _ngaydoitoida,
                    );
                    final viewModel = context.read<BaoCanHangViewModel>();
                    await viewModel.updateBaoCanHang.execute(updatedBaoCanHang);
                    if (!mounted) return;
                    final error = viewModel.updateBaoCanHang.error;
                    final errorMsg = viewModel.updateBaoCanHang.result.toString();
                    if (error == false) {
                      Navigator.of(context).pop(true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to update Bao Can Hang: $errorMsg'),
                        ),
                      );
                    }
                  }
                },
                child: Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
