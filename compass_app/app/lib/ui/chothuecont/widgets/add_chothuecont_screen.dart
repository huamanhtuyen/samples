// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/chothuecont_viewmodel.dart';
import '../../../domain/models/chothuecont/chothuecont_model.dart';
import '../../../utils/result.dart';

class AddChoThueContScreen extends StatefulWidget {
  const AddChoThueContScreen({super.key});

  @override
  State<AddChoThueContScreen> createState() => _AddChoThueContScreenState();
}

class _AddChoThueContScreenState extends State<AddChoThueContScreen> {
  final _formKey = GlobalKey<FormState>();
  final _motaController = TextEditingController();
  final _tenctyController = TextEditingController();
  final _sdt1Controller = TextEditingController();
  final _sdt2Controller = TextEditingController();
  final _sdt3Controller = TextEditingController();
  final _matinhController = TextEditingController();
  final _tentinhTiengvietController = TextEditingController();
  final _tentinhTienganhController = TextEditingController();
  final _tentinhTiengtrungController = TextEditingController();
  final _tentinhTiengthaiController = TextEditingController();
  final _maquanController = TextEditingController();
  final _tenquanTiengvietController = TextEditingController();
  final _tenquanTienganhController = TextEditingController();
  final _tenquanTiengtrungController = TextEditingController();
  final _tenquanTiengthaiController = TextEditingController();
  final _anh1Controller = TextEditingController();
  final _anh2Controller = TextEditingController();
  final _anh3Controller = TextEditingController();
  final _anh4Controller = TextEditingController();
  final _anh5Controller = TextEditingController();
  final _anh6Controller = TextEditingController();
  final _anh7Controller = TextEditingController();
  final _anh8Controller = TextEditingController();
  final _anh9Controller = TextEditingController();

  Future<void> _pickAndUploadImage(TextEditingController controller) async {
    final viewModel = context.read<ChoThueContViewModel>();
    await viewModel.pickAndUploadImage.execute();
    final result = viewModel.pickAndUploadImage.result;
    if (result != null) {
      if (result is Ok<String?>) {
        final imageUrl = result.value;
        setState(() {
          controller.text = imageUrl ?? '';
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
      appBar: AppBar(title: Text('Add Cho Thue Cont')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: _motaController,
                  decoration: InputDecoration(labelText: 'Mota'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Mota';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tenctyController,
                  decoration: InputDecoration(labelText: 'Ten Cong Ty'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Cong Ty';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _sdt1Controller,
                  decoration: InputDecoration(labelText: 'SDT1'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter SDT1';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _sdt2Controller,
                  decoration: InputDecoration(labelText: 'SDT2'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter SDT2';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _sdt3Controller,
                  decoration: InputDecoration(labelText: 'SDT3'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter SDT3';
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
                  controller: _tentinhTiengvietController,
                  decoration: InputDecoration(
                    labelText: 'Ten Tinh (Tieng Viet)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Tinh (Tieng Viet)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tentinhTienganhController,
                  decoration: InputDecoration(
                    labelText: 'Ten Tinh (Tieng Anh)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Tinh (Tieng Anh)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tentinhTiengtrungController,
                  decoration: InputDecoration(
                    labelText: 'Ten Tinh (Tieng Trung)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Tinh (Tieng Trung)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tentinhTiengthaiController,
                  decoration: InputDecoration(
                    labelText: 'Ten Tinh (Tieng Thai)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Tinh (Tieng Thai)';
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
                  controller: _tenquanTiengvietController,
                  decoration: InputDecoration(
                    labelText: 'Ten Quan (Tieng Viet)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Quan (Tieng Viet)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tenquanTienganhController,
                  decoration: InputDecoration(
                    labelText: 'Ten Quan (Tieng Anh)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Quan (Tieng Anh)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tenquanTiengtrungController,
                  decoration: InputDecoration(
                    labelText: 'Ten Quan (Tieng Trung)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Quan (Tieng Trung)';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _tenquanTiengthaiController,
                  decoration: InputDecoration(
                    labelText: 'Ten Quan (Tieng Thai)',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Ten Quan (Tieng Thai)';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage(_anh1Controller),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh1Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(
                              _anh1Controller.text,
                              fit: BoxFit.fill,
                            ),
                        if (_anh1Controller.text.isEmpty)
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
                  controller: _anh1Controller,
                  decoration: InputDecoration(labelText: 'Anh1'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh1';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage(_anh2Controller),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh2Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(
                              _anh2Controller.text,
                              fit: BoxFit.fill,
                            ),
                        if (_anh2Controller.text.isEmpty)
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
                  controller: _anh2Controller,
                  decoration: InputDecoration(labelText: 'Anh2'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh2';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage(_anh3Controller),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh3Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(
                              _anh3Controller.text,
                              fit: BoxFit.fill,
                            ),
                        if (_anh3Controller.text.isEmpty)
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
                  controller: _anh3Controller,
                  decoration: InputDecoration(labelText: 'Anh3'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh3';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage(_anh4Controller),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh4Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(
                              _anh4Controller.text,
                              fit: BoxFit.fill,
                            ),
                        if (_anh4Controller.text.isEmpty)
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
                  controller: _anh4Controller,
                  decoration: InputDecoration(labelText: 'Anh4'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh4';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage(_anh5Controller),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh5Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(
                              _anh5Controller.text,
                              fit: BoxFit.fill,
                            ),
                        if (_anh5Controller.text.isEmpty)
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
                  controller: _anh5Controller,
                  decoration: InputDecoration(labelText: 'Anh5'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh5';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage(_anh6Controller),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh6Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(
                              _anh6Controller.text,
                              fit: BoxFit.fill,
                            ),
                        if (_anh6Controller.text.isEmpty)
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
                  controller: _anh6Controller,
                  decoration: InputDecoration(labelText: 'Anh6'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh6';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage(_anh7Controller),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh7Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(
                              _anh7Controller.text,
                              fit: BoxFit.fill,
                            ),
                        if (_anh7Controller.text.isEmpty)
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
                  controller: _anh7Controller,
                  decoration: InputDecoration(labelText: 'Anh7'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh7';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage(_anh8Controller),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh8Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(
                              _anh8Controller.text,
                              fit: BoxFit.fill,
                            ),
                        if (_anh8Controller.text.isEmpty)
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
                  controller: _anh8Controller,
                  decoration: InputDecoration(labelText: 'Anh8'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh8';
                    }
                    return null;
                  },
                ),
                GestureDetector(
                  onTap: () => _pickAndUploadImage(_anh9Controller),
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh9Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(
                              _anh9Controller.text,
                              fit: BoxFit.fill,
                            ),
                        if (_anh9Controller.text.isEmpty)
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
                  controller: _anh9Controller,
                  decoration: InputDecoration(labelText: 'Anh9'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Anh9';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final choThueCont = ChoThueCont(
                        mota: _motaController.text,
                        tencty: _tenctyController.text,
                        sdt1: _sdt1Controller.text,
                        sdt2: _sdt2Controller.text,
                        sdt3: _sdt3Controller.text,
                        matinh: _matinhController.text,
                        tentinhTiengviet: _tentinhTiengvietController.text,
                        tentinhTienganh: _tentinhTienganhController.text,
                        tentinhTiengtrung: _tentinhTiengtrungController.text,
                        tentinhTiengthai: _tentinhTiengthaiController.text,
                        maquan: _maquanController.text,
                        tenquanTiengviet: _tenquanTiengvietController.text,
                        tenquanTienganh: _tenquanTienganhController.text,
                        tenquanTiengtrung: _tenquanTiengtrungController.text,
                        tenquanTiengthai: _tenquanTiengthaiController.text,
                        anh1: _anh1Controller.text,
                        anh2: _anh2Controller.text,
                        anh3: _anh3Controller.text,
                        anh4: _anh4Controller.text,
                        anh5: _anh5Controller.text,
                        anh6: _anh6Controller.text,
                        anh7: _anh7Controller.text,
                        anh8: _anh8Controller.text,
                        anh9: _anh9Controller.text,
                      );
                      final viewModel = context.read<ChoThueContViewModel>();
                      await viewModel.addChoThueCont.execute(choThueCont);
                      if (!mounted) return;
                      final error = viewModel.addChoThueCont.error;
                      final errorMsg =
                          viewModel.addChoThueCont.result.toString();
                      if (error == false) {
                        Navigator.of(context).pop(true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Failed to add Cho Thue Cont: $errorMsg',
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Add Cho Thue Cont'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
