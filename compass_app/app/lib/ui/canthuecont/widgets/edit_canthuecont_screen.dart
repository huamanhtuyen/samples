// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/canthuecont_viewmodel.dart';
import '../../../domain/models/canthuecont/canthuecont_model.dart';
import '../../../utils/result.dart';

class EditCanThueContScreen extends StatefulWidget {
  final CanThueCont canThueCont;

  const EditCanThueContScreen({super.key, required this.canThueCont});

  @override
  State<EditCanThueContScreen> createState() => _EditCanThueContScreenState();
}

class _EditCanThueContScreenState extends State<EditCanThueContScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _mota;
  late String _tencty;
  late String _sdt1;
  late String _sdt2;
  late String _sdt3;
  late String _matinh;
  late String _tentinhTiengviet;
  late String _tentinhTienganh;
  late String _tentinhTiengtrung;
  late String _tentinhTiengthai;
  late String _maquan;
  late String _tenquanTiengviet;
  late String _tenquanTienganh;
  late String _tenquanTiengtrung;
  late String _tenquanTiengthai;
  late String _anh1;
  late String _anh2;
  late String _anh3;
  late String _anh4;
  late String _anh5;
  late String _anh6;
  late String _anh7;
  late String _anh8;
  late String _anh9;

  @override
  void initState() {
    super.initState();
    _mota = widget.canThueCont.mota ?? '';
    _tencty = widget.canThueCont.tencty ?? '';
    _sdt1 = widget.canThueCont.sdt1 ?? '';
    _sdt2 = widget.canThueCont.sdt2 ?? '';
    _sdt3 = widget.canThueCont.sdt3 ?? '';
    _matinh = widget.canThueCont.matinh ?? '';
    _tentinhTiengviet = widget.canThueCont.tentinhTiengviet ?? '';
    _tentinhTienganh = widget.canThueCont.tentinhTienganh ?? '';
    _tentinhTiengtrung = widget.canThueCont.tentinhTiengtrung ?? '';
    _tentinhTiengthai = widget.canThueCont.tentinhTiengthai ?? '';
    _maquan = widget.canThueCont.maquan ?? '';
    _tenquanTiengviet = widget.canThueCont.tenquanTiengviet ?? '';
    _tenquanTienganh = widget.canThueCont.tenquanTienganh ?? '';
    _tenquanTiengtrung = widget.canThueCont.tenquanTiengtrung ?? '';
    _tenquanTiengthai = widget.canThueCont.tenquanTiengthai ?? '';
    _anh1 = widget.canThueCont.anh1 ?? '';
    _anh2 = widget.canThueCont.anh2 ?? '';
    _anh3 = widget.canThueCont.anh3 ?? '';
    _anh4 = widget.canThueCont.anh4 ?? '';
    _anh5 = widget.canThueCont.anh5 ?? '';
    _anh6 = widget.canThueCont.anh6 ?? '';
    _anh7 = widget.canThueCont.anh7 ?? '';
    _anh8 = widget.canThueCont.anh8 ?? '';
    _anh9 = widget.canThueCont.anh9 ?? '';
  }

  Future<void> _pickAndUploadImage(String field) async {
    final viewModel = context.read<CanThueContViewModel>();
    await viewModel.pickAndUploadImage.execute();
    final result = viewModel.pickAndUploadImage.result;
    if (result != null) {
      if (result is Ok<String?>) {
        final imageUrl = result.value;
        setState(() {
          switch (field) {
            case 'anh1':
              _anh1 = imageUrl ?? '';
              break;
            case 'anh2':
              _anh2 = imageUrl ?? '';
              break;
            case 'anh3':
              _anh3 = imageUrl ?? '';
              break;
            case 'anh4':
              _anh4 = imageUrl ?? '';
              break;
            case 'anh5':
              _anh5 = imageUrl ?? '';
              break;
            case 'anh6':
              _anh6 = imageUrl ?? '';
              break;
            case 'anh7':
              _anh7 = imageUrl ?? '';
              break;
            case 'anh8':
              _anh8 = imageUrl ?? '';
              break;
            case 'anh9':
              _anh9 = imageUrl ?? '';
              break;
          }
        });
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text('Image uploaded successfully')));
      } else if (result is Error<String?>) {
        final error = result.error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Image loaded unsuccessfully: $error')),
        );
      }
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Image upload result is null')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Cho Thue Cont')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
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
                  initialValue: _tencty,
                  decoration: InputDecoration(labelText: 'Ten Cong Ty'),
                  onSaved: (value) {
                    _tencty = value!;
                  },
                ),
                TextFormField(
                  initialValue: _sdt1,
                  decoration: InputDecoration(labelText: 'SDT1'),
                  onSaved: (value) {
                    _sdt1 = value!;
                  },
                ),
                TextFormField(
                  initialValue: _sdt2,
                  decoration: InputDecoration(labelText: 'SDT2'),
                  onSaved: (value) {
                    _sdt2 = value!;
                  },
                ),
                TextFormField(
                  initialValue: _sdt3,
                  decoration: InputDecoration(labelText: 'SDT3'),
                  onSaved: (value) {
                    _sdt3 = value!;
                  },
                ),
                TextFormField(
                  initialValue: _matinh,
                  decoration: InputDecoration(labelText: 'Ma Tinh'),
                  onSaved: (value) {
                    _matinh = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tentinhTiengviet,
                  decoration: InputDecoration(
                    labelText: 'Ten Tinh (Tieng Viet)',
                  ),
                  onSaved: (value) {
                    _tentinhTiengviet = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tentinhTienganh,
                  decoration: InputDecoration(
                    labelText: 'Ten Tinh (Tieng Anh)',
                  ),
                  onSaved: (value) {
                    _tentinhTienganh = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tentinhTiengtrung,
                  decoration: InputDecoration(
                    labelText: 'Ten Tinh (Tieng Trung)',
                  ),
                  onSaved: (value) {
                    _tentinhTiengtrung = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tentinhTiengthai,
                  decoration: InputDecoration(
                    labelText: 'Ten Tinh (Tieng Thai)',
                  ),
                  onSaved: (value) {
                    _tentinhTiengthai = value!;
                  },
                ),
                TextFormField(
                  initialValue: _maquan,
                  decoration: InputDecoration(labelText: 'Ma Quan'),
                  onSaved: (value) {
                    _maquan = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tenquanTiengviet,
                  decoration: InputDecoration(
                    labelText: 'Ten Quan (Tieng Viet)',
                  ),
                  onSaved: (value) {
                    _tenquanTiengviet = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tenquanTienganh,
                  decoration: InputDecoration(
                    labelText: 'Ten Quan (Tieng Anh)',
                  ),
                  onSaved: (value) {
                    _tenquanTienganh = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tenquanTiengtrung,
                  decoration: InputDecoration(
                    labelText: 'Ten Quan (Tieng Trung)',
                  ),
                  onSaved: (value) {
                    _tenquanTiengtrung = value!;
                  },
                ),
                TextFormField(
                  initialValue: _tenquanTiengthai,
                  decoration: InputDecoration(
                    labelText: 'Ten Quan (Tieng Thai)',
                  ),
                  onSaved: (value) {
                    _tenquanTiengthai = value!;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage('anh1'),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh1.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh1, fit: BoxFit.fill),
                        if (_anh1.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh 1',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _anh1,
                  decoration: InputDecoration(labelText: 'Anh1'),
                  onSaved: (value) {
                    _anh1 = value!;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage('anh2'),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh2.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh2, fit: BoxFit.fill),
                        if (_anh2.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh 2',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _anh2,
                  decoration: InputDecoration(labelText: 'Anh2'),
                  onSaved: (value) {
                    _anh2 = value!;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage('anh3'),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh3.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh3, fit: BoxFit.fill),
                        if (_anh3.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh 3',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _anh3,
                  decoration: InputDecoration(labelText: 'Anh3'),
                  onSaved: (value) {
                    _anh3 = value!;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage('anh4'),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh4.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh4, fit: BoxFit.fill),
                        if (_anh4.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh 4',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _anh4,
                  decoration: InputDecoration(labelText: 'Anh4'),
                  onSaved: (value) {
                    _anh4 = value!;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage('anh5'),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh5.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh5, fit: BoxFit.fill),
                        if (_anh5.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh 5',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _anh5,
                  decoration: InputDecoration(labelText: 'Anh5'),
                  onSaved: (value) {
                    _anh5 = value!;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage('anh6'),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh6.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh6, fit: BoxFit.fill),
                        if (_anh6.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh 6',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _anh6,
                  decoration: InputDecoration(labelText: 'Anh6'),
                  onSaved: (value) {
                    _anh6 = value!;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage('anh7'),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh7.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh7, fit: BoxFit.fill),
                        if (_anh7.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh 7',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _anh7,
                  decoration: InputDecoration(labelText: 'Anh7'),
                  onSaved: (value) {
                    _anh7 = value!;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage('anh8'),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh8.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh8, fit: BoxFit.fill),
                        if (_anh8.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh 8',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _anh8,
                  decoration: InputDecoration(labelText: 'Anh8'),
                  onSaved: (value) {
                    _anh8 = value!;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage('anh9'),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh9.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh9, fit: BoxFit.fill),
                        if (_anh9.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh 9',
                                style: TextStyle(color: Colors.black54),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
                TextFormField(
                  initialValue: _anh9,
                  decoration: InputDecoration(labelText: 'Anh9'),
                  onSaved: (value) {
                    _anh9 = value!;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      _formKey.currentState!.save();
                      final updatedCanThueCont = CanThueCont(
                        id: widget.canThueCont.id,
                        mota: _mota,
                        tencty: _tencty,
                        sdt1: _sdt1,
                        sdt2: _sdt2,
                        sdt3: _sdt3,
                        matinh: _matinh,
                        tentinhTiengviet: _tentinhTiengviet,
                        tentinhTienganh: _tentinhTienganh,
                        tentinhTiengtrung: _tentinhTiengtrung,
                        tentinhTiengthai: _tentinhTiengthai,
                        maquan: _maquan,
                        tenquanTiengviet: _tenquanTiengviet,
                        tenquanTienganh: _tenquanTienganh,
                        tenquanTiengtrung: _tenquanTiengtrung,
                        tenquanTiengthai: _tenquanTiengthai,
                        anh1: _anh1,
                        anh2: _anh2,
                        anh3: _anh3,
                        anh4: _anh4,
                        anh5: _anh5,
                        anh6: _anh6,
                        anh7: _anh7,
                        anh8: _anh8,
                        anh9: _anh9,
                      );
                      final viewModel = context.read<CanThueContViewModel>();
                      await viewModel.updateCanThueCont.execute(
                        updatedCanThueCont,
                      );
                      if (!mounted) return;
                      final error = viewModel.updateCanThueCont.error;
                      final errorMsg =
                          viewModel.updateCanThueCont.result.toString();
                      if (error == false) {
                        Navigator.of(context).pop(true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Failed to update Cho Thue Cont: $errorMsg',
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
      ),
    );
  }
}
