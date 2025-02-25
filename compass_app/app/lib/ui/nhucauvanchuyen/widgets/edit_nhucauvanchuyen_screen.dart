// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/nhucauvanchuyen_viewmodel.dart';
import '../../../domain/models/nhucauvanchuyen/nhucauvanchuyen_model.dart';

class EditNhuCauVanChuyenScreen extends StatefulWidget {
  final NhuCauVanChuyen nhuCauVanChuyen;

  const EditNhuCauVanChuyenScreen({super.key, required this.nhuCauVanChuyen});

  @override
  State<EditNhuCauVanChuyenScreen> createState() =>
      _EditNhuCauVanChuyenScreenState();
}

class _EditNhuCauVanChuyenScreenState extends State<EditNhuCauVanChuyenScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _mota;
  late String _anh1;
  late String _anh2;
  late String _anh3;
  late String _anh4;
  late String _anh5;
  late String _anh6;
  late String _anh7;
  late String _anh8;
  late String _anh9;
  late String _matinhxuatphat;
  late String _matinhdich;
  late String _kichthuoc;
  late String _trongluong;

  @override
  void initState() {
    super.initState();
    _mota = widget.nhuCauVanChuyen.mota ?? '';
    _anh1 = widget.nhuCauVanChuyen.anh1 ?? '';
    _anh2 = widget.nhuCauVanChuyen.anh2 ?? '';
    _anh3 = widget.nhuCauVanChuyen.anh3 ?? '';
    _anh4 = widget.nhuCauVanChuyen.anh4 ?? '';
    _anh5 = widget.nhuCauVanChuyen.anh5 ?? '';
    _anh6 = widget.nhuCauVanChuyen.anh6 ?? '';
    _anh7 = widget.nhuCauVanChuyen.anh7 ?? '';
    _anh8 = widget.nhuCauVanChuyen.anh8 ?? '';
    _anh9 = widget.nhuCauVanChuyen.anh9 ?? '';
    _matinhxuatphat = widget.nhuCauVanChuyen.matinhxuatphat ?? '';
    _matinhdich = widget.nhuCauVanChuyen.matinhdich ?? '';
    _kichthuoc = widget.nhuCauVanChuyen.kichthuoc ?? '';
    _trongluong = widget.nhuCauVanChuyen.trongluong ?? '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Nhu Cau Van Chuyen')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _mota,
                decoration: InputDecoration(labelText: 'Mota'),
                onSaved: (value) {
                  _mota = value!;
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
                initialValue: _matinhxuatphat,
                decoration: InputDecoration(labelText: 'Matinhxuatphat'),
                onSaved: (value) {
                  _matinhxuatphat = value!;
                },
              ),
              TextFormField(
                initialValue: _matinhdich,
                decoration: InputDecoration(labelText: 'Matinhdich'),
                onSaved: (value) {
                  _matinhdich = value!;
                },
              ),
              TextFormField(
                initialValue: _kichthuoc,
                decoration: InputDecoration(labelText: 'Kichthuoc'),
                onSaved: (value) {
                  _kichthuoc = value!;
                },
              ),
              TextFormField(
                initialValue: _trongluong,
                decoration: InputDecoration(labelText: 'Trongluong'),
                onSaved: (value) {
                  _trongluong = value!;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final updatedNhuCauVanChuyen = NhuCauVanChuyen(
                      id: widget.nhuCauVanChuyen.id,
                      mota: _mota,
                      anh1: _anh1,
                      anh2: _anh2,
                      anh3: _anh3,
                      anh4: _anh4,
                      anh5: _anh5,
                      anh6: _anh6,
                      anh7: _anh7,
                      anh8: _anh8,
                      anh9: _anh9,
                      matinhxuatphat: _matinhxuatphat,
                      matinhdich: _matinhdich,
                      kichthuoc: _kichthuoc,
                      trongluong: _trongluong,
                    );
                    final viewModel = context.read<NhuCauVanChuyenViewModel>();
                    await viewModel.updateNhuCauVanChuyen.execute(
                      updatedNhuCauVanChuyen,
                    );
                    if (!mounted) return;
                    final error = viewModel.updateNhuCauVanChuyen.error;
                    final errorMsg =
                        viewModel.updateNhuCauVanChuyen.result.toString();
                    if (error == false) {
                      Navigator.of(context).pop(true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            'Failed to update Nhu Cau Van Chuyen: $errorMsg',
                          ),
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
