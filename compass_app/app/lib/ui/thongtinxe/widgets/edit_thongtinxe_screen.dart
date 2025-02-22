// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/thongtinxe_viewmodel.dart';
import '../../../domain/models/thongtinxe/thongtinxe_model.dart';

class EditThongTinXeScreen extends StatefulWidget {
  final ThongTinXe thongTinXe;

  const EditThongTinXeScreen({super.key, required this.thongTinXe});

  @override
  State<EditThongTinXeScreen> createState() => _EditThongTinXeScreenState();
}

class _EditThongTinXeScreenState extends State<EditThongTinXeScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _email;
  late String _name;
  late String _phoneNumber;
  late String _anh1;
  late String _anh2;
  late String _anh3;
  late String _anh4;
  late String _anh5;
  late String _anh6;
  late String _anh7;
  late String _anh8;
  late String _anh9;
  late String _matinh;
  // ignore: non_constant_identifier_names
  late String _tentinh_tienganh;
  // ignore: non_constant_identifier_names
  late String _tentinh_tiengviet;
  // ignore: non_constant_identifier_names
  late String _tentinh_tiengthai;
  // ignore: non_constant_identifier_names
  late String _temtinh_tiengtrung;
  late String _maquan;
  // ignore: non_constant_identifier_names
  late String _tenquan_tienganh;
  // ignore: non_constant_identifier_names
  late String _tenquan_tiengviet;
  // ignore: non_constant_identifier_names
  late String _tenquan_tiengthai;
  // ignore: non_constant_identifier_names
  late String _tenquan_tiengtrung;
  late String _diachichitiet;
  late String _bienso;
  late String _maloaixe;
  // ignore: non_constant_identifier_names
  late String _tenloaixe_tienganh;
  // ignore: non_constant_identifier_names
  late String _tenloaixe_tiengviet;
  // ignore: non_constant_identifier_names
  late String _tenloaixe_tiengtrung;
  // ignore: non_constant_identifier_names
  late String _tenloaixe_tiengthai;
  // ignore: non_constant_identifier_names
  late double _taitrong_tan;
  // ignore: non_constant_identifier_names
  late double _taitrong_m3;
  late String _kichthuoccont;

  @override
  void initState() {
    super.initState();
    _email = widget.thongTinXe.email;
    _anh1 = widget.thongTinXe.anh1 ?? '';
    _anh2 = widget.thongTinXe.anh2 ?? '';
    _anh3 = widget.thongTinXe.anh3 ?? '';
    _anh4 = widget.thongTinXe.anh4 ?? '';
    _anh5 = widget.thongTinXe.anh5 ?? '';
    _anh6 = widget.thongTinXe.anh6 ?? '';
    _anh7 = widget.thongTinXe.anh7 ?? '';
    _anh8 = widget.thongTinXe.anh8 ?? '';
    _anh9 = widget.thongTinXe.anh9 ?? '';
    _matinh = widget.thongTinXe.matinh ?? '';
    _tentinh_tienganh = widget.thongTinXe.tentinh_tienganh ?? '';
    _tentinh_tiengviet = widget.thongTinXe.tentinh_tiengviet ?? '';
    _tentinh_tiengthai = widget.thongTinXe.tentinh_tiengthai ?? '';
    _temtinh_tiengtrung = widget.thongTinXe.temtinh_tiengtrung ?? '';
    _maquan = widget.thongTinXe.maquan ?? '';
    _tenquan_tienganh = widget.thongTinXe.tenquan_tienganh ?? '';
    _tenquan_tiengviet = widget.thongTinXe.tenquan_tiengviet ?? '';
    _tenquan_tiengthai = widget.thongTinXe.tenquan_tiengthai ?? '';
    _tenquan_tiengtrung = widget.thongTinXe.tenquan_tiengtrung ?? '';
    _diachichitiet = widget.thongTinXe.diachichitiet ?? '';
    _bienso = widget.thongTinXe.bienso ?? '';
    _maloaixe = widget.thongTinXe.maloaixe ?? '';
    _tenloaixe_tienganh = widget.thongTinXe.tenloaixe_tienganh ?? '';
    _tenloaixe_tiengviet = widget.thongTinXe.tenloaixe_tiengviet ?? '';
    _tenloaixe_tiengtrung = widget.thongTinXe.tenloaixe_tiengtrung ?? '';
    _tenloaixe_tiengthai = widget.thongTinXe.tenloaixe_tiengthai ?? '';
    _taitrong_tan = widget.thongTinXe.taitrong_tan ?? 0.0;
    _taitrong_m3 = widget.thongTinXe.taitrong_m3 ?? 0.0;
    _kichthuoccont = widget.thongTinXe.kichthuoccont ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Thong Tin Xe')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _email,
                decoration: InputDecoration(labelText: 'Email'),
                onSaved: (value) {
                  _email = value!;
                },
              ),
              TextFormField(
                initialValue: _name,
                decoration: InputDecoration(labelText: 'Name'),
                onSaved: (value) {
                  _name = value!;
                },
              ),
              TextFormField(
                initialValue: _phoneNumber,
                decoration: InputDecoration(labelText: 'Phone Number'),
                onSaved: (value) {
                  _phoneNumber = value!;
                },
              ),
              TextFormField(
                initialValue: _anh1,
                decoration: InputDecoration(labelText: 'Anh1'),
                onSaved: (value) {
                  _anh1 = value!;
                },
              ),
              TextFormField(
                initialValue: _anh2,
                decoration: InputDecoration(labelText: 'Anh2'),
                onSaved: (value) {
                  _anh2 = value!;
                },
              ),
              TextFormField(
                initialValue: _anh3,
                decoration: InputDecoration(labelText: 'Anh3'),
                onSaved: (value) {
                  _anh3 = value!;
                },
              ),
              TextFormField(
                initialValue: _anh4,
                decoration: InputDecoration(labelText: 'Anh4'),
                onSaved: (value) {
                  _anh4 = value!;
                },
              ),
              TextFormField(
                initialValue: _anh5,
                decoration: InputDecoration(labelText: 'Anh5'),
                onSaved: (value) {
                  _anh5 = value!;
                },
              ),
              TextFormField(
                initialValue: _anh6,
                decoration: InputDecoration(labelText: 'Anh6'),
                onSaved: (value) {
                  _anh6 = value!;
                },
              ),
              TextFormField(
                initialValue: _anh7,
                decoration: InputDecoration(labelText: 'Anh7'),
                onSaved: (value) {
                  _anh7 = value!;
                },
              ),
              TextFormField(
                initialValue: _anh8,
                decoration: InputDecoration(labelText: 'Anh8'),
                onSaved: (value) {
                  _anh8 = value!;
                },
              ),
              TextFormField(
                initialValue: _anh9,
                decoration: InputDecoration(labelText: 'Anh9'),
                onSaved: (value) {
                  _anh9 = value!;
                },
              ),
              TextFormField(
                initialValue: _matinh,
                decoration: InputDecoration(labelText: 'Matinh'),
                onSaved: (value) {
                  _matinh = value!;
                },
              ),
              TextFormField(
                initialValue: _tentinh_tienganh,
                decoration: InputDecoration(labelText: 'Tentinh Tieng Anh'),
                onSaved: (value) {
                  _tentinh_tienganh = value!;
                },
              ),
              TextFormField(
                initialValue: _tentinh_tiengviet,
                decoration: InputDecoration(labelText: 'Tentinh Tieng Viet'),
                onSaved: (value) {
                  _tentinh_tiengviet = value!;
                },
              ),
              TextFormField(
                initialValue: _tentinh_tiengthai,
                decoration: InputDecoration(labelText: 'Tentinh Tieng Thai'),
                onSaved: (value) {
                  _tentinh_tiengthai = value!;
                },
              ),
              TextFormField(
                initialValue: _temtinh_tiengtrung,
                decoration: InputDecoration(labelText: 'Tentinh Tieng Trung'),
                onSaved: (value) {
                  _temtinh_tiengtrung = value!;
                },
              ),
              TextFormField(
                initialValue: _maquan,
                decoration: InputDecoration(labelText: 'Maquan'),
                onSaved: (value) {
                  _maquan = value!;
                },
              ),
              TextFormField(
                initialValue: _tenquan_tienganh,
                decoration: InputDecoration(labelText: 'Tenquan Tieng Anh'),
                onSaved: (value) {
                  _tenquan_tienganh = value!;
                },
              ),
              TextFormField(
                initialValue: _tenquan_tiengviet,
                decoration: InputDecoration(labelText: 'Tenquan Tieng Viet'),
                onSaved: (value) {
                  _tenquan_tiengviet = value!;
                },
              ),
              TextFormField(
                initialValue: _tenquan_tiengthai,
                decoration: InputDecoration(labelText: 'Tenquan Tieng Thai'),
                onSaved: (value) {
                  _tenquan_tiengthai = value!;
                },
              ),
              TextFormField(
                initialValue: _tenquan_tiengtrung,
                decoration: InputDecoration(labelText: 'Tenquan Tieng Trung'),
                onSaved: (value) {
                  _tenquan_tiengtrung = value!;
                },
              ),
              TextFormField(
                initialValue: _diachichitiet,
                decoration: InputDecoration(labelText: 'Diachi Chi Tiet'),
                onSaved: (value) {
                  _diachichitiet = value!;
                },
              ),
              TextFormField(
                initialValue: _bienso,
                decoration: InputDecoration(labelText: 'Bienso'),
                onSaved: (value) {
                  _bienso = value!;
                },
              ),
              TextFormField(
                initialValue: _maloaixe,
                decoration: InputDecoration(labelText: 'Maloaixe'),
                onSaved: (value) {
                  _maloaixe = value!;
                },
              ),
              TextFormField(
                initialValue: _tenloaixe_tienganh,
                decoration: InputDecoration(labelText: 'Tenloaixe Tieng Anh'),
                onSaved: (value) {
                  _tenloaixe_tienganh = value!;
                },
              ),
              TextFormField(
                initialValue: _tenloaixe_tiengviet,
                decoration: InputDecoration(labelText: 'Tenloaixe Tieng Viet'),
                onSaved: (value) {
                  _tenloaixe_tiengviet = value!;
                },
              ),
              TextFormField(
                initialValue: _tenloaixe_tiengtrung,
                decoration: InputDecoration(labelText: 'Tenloaixe Tieng Trung'),
                onSaved: (value) {
                  _tenloaixe_tiengtrung = value!;
                },
              ),
              TextFormField(
                initialValue: _tenloaixe_tiengthai,
                decoration: InputDecoration(labelText: 'Tenloaixe Tieng Thai'),
                onSaved: (value) {
                  _tenloaixe_tiengthai = value!;
                },
              ),
              TextFormField(
                initialValue: _taitrong_tan.toString(),
                decoration: InputDecoration(labelText: 'Taitrong Tan'),
                onSaved: (value) {
                  _taitrong_tan = double.parse(value!);
                },
              ),
              TextFormField(
                initialValue: _taitrong_m3.toString(),
                decoration: InputDecoration(labelText: 'Taitrong M3'),
                onSaved: (value) {
                  _taitrong_m3 = double.parse(value!);
                },
              ),
              TextFormField(
                initialValue: _kichthuoccont,
                decoration: InputDecoration(labelText: 'Kichthuoc Cont'),
                onSaved: (value) {
                  _kichthuoccont = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final updatedThongTinXe = ThongTinXe(
                      id: widget.thongTinXe.id,
                      email: _email,                    
                      anh1: _anh1,
                      anh2: _anh2,
                      anh3: _anh3,
                      anh4: _anh4,
                      anh5: _anh5,
                      anh6: _anh6,
                      anh7: _anh7,
                      anh8: _anh8,
                      anh9: _anh9,
                      matinh: _matinh,
                      tentinh_tienganh: _tentinh_tienganh,
                      tentinh_tiengviet: _tentinh_tiengviet,
                      tentinh_tiengthai: _tentinh_tiengthai,
                      temtinh_tiengtrung: _temtinh_tiengtrung,
                      maquan: _maquan,
                      tenquan_tienganh: _tenquan_tienganh,
                      tenquan_tiengviet: _tenquan_tiengviet,
                      tenquan_tiengthai: _tenquan_tiengthai,
                      tenquan_tiengtrung: _tenquan_tiengtrung,
                      diachichitiet: _diachichitiet,
                      bienso: _bienso,
                      maloaixe: _maloaixe,
                      tenloaixe_tienganh: _tenloaixe_tienganh,
                      tenloaixe_tiengviet: _tenloaixe_tiengviet,
                      tenloaixe_tiengtrung: _tenloaixe_tiengtrung,
                      tenloaixe_tiengthai: _tenloaixe_tiengthai,
                      taitrong_tan: _taitrong_tan,
                      taitrong_m3: _taitrong_m3,
                      kichthuoccont: _kichthuoccont,
                    );
                    final viewModel = context.read<ThongTinXeViewModel>();
                    await viewModel.updateThongTinXe.execute(updatedThongTinXe);
                    if (!mounted) return;
                    final error = viewModel.updateThongTinXe.error;
                    final errorMsg = viewModel.updateThongTinXe.result.toString();
                    if (error == false) {
                      Navigator.of(context).pop(true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to update Thong Tin Xe: $errorMsg'),
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
