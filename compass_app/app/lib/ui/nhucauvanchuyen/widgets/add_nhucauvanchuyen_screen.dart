// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/nhucauvanchuyen_viewmodel.dart';
import '../../../domain/models/nhucauvanchuyen/nhucauvanchuyen_model.dart';
import '../../../utils/result.dart';

class AddNhuCauVanChuyenScreen extends StatefulWidget {
  const AddNhuCauVanChuyenScreen({super.key});

  @override
  State<AddNhuCauVanChuyenScreen> createState() =>
      _AddNhuCauVanChuyenScreenState();
}

class _AddNhuCauVanChuyenScreenState extends State<AddNhuCauVanChuyenScreen> {
  final _formKey = GlobalKey<FormState>();
  final _motaController = TextEditingController();
  final _anh1Controller = TextEditingController();
  final _anh2Controller = TextEditingController();
  final _anh3Controller = TextEditingController();
  final _anh4Controller = TextEditingController();
  final _anh5Controller = TextEditingController();
  final _anh6Controller = TextEditingController();
  final _anh7Controller = TextEditingController();
  final _anh8Controller = TextEditingController();
  final _anh9Controller = TextEditingController();
  final _matinhxuatphatController = TextEditingController();
  final _matinhdichController = TextEditingController();
  final _kichthuocController = TextEditingController();
  final _trongluongController = TextEditingController();

Future<void> _pickAndUploadImage() async {
  final viewModel = context.read<NhuCauVanChuyenViewModel>();
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
      appBar: AppBar(title: Text('Add Nhu Cau Van Chuyen')),
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
                 GestureDetector(
                  onTap: _pickAndUploadImage,
                  child: Container(
                    height: 150,
                    width: 150,
                    color: Colors.grey[300],
                    child: Stack(
                      children: [
                        _anh1Controller.text.isEmpty
                            ? Center(child: Icon(Icons.add_a_photo))
                            : Image.network(_anh1Controller.text, fit: BoxFit.fill),
                        if (_anh1Controller.text.isEmpty)
                          Align(
                            alignment: Alignment.bottomCenter,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                'Chọn ảnh',
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
                TextFormField(
                  controller: _matinhxuatphatController,
                  decoration: InputDecoration(labelText: 'Matinhxuatphat'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Matinhxuatphat';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _matinhdichController,
                  decoration: InputDecoration(labelText: 'Matinhdich'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Matinhdich';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _kichthuocController,
                  decoration: InputDecoration(labelText: 'Kichthuoc'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Kichthuoc';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _trongluongController,
                  decoration: InputDecoration(labelText: 'Trongluong'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter Trongluong';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      final nhuCauVanChuyen = NhuCauVanChuyen(
                        mota: _motaController.text,
                        anh1: _anh1Controller.text,
                        anh2: _anh2Controller.text,
                        anh3: _anh3Controller.text,
                        anh4: _anh4Controller.text,
                        anh5: _anh5Controller.text,
                        anh6: _anh6Controller.text,
                        anh7: _anh7Controller.text,
                        anh8: _anh8Controller.text,
                        anh9: _anh9Controller.text,
                        matinhxuatphat: _matinhxuatphatController.text,
                        matinhdich: _matinhdichController.text,
                        kichthuoc: _kichthuocController.text,
                        trongluong: _trongluongController.text,
                      );
                      final viewModel =
                          context.read<NhuCauVanChuyenViewModel>();
                      await viewModel.addNhuCauVanChuyen.execute(
                        nhuCauVanChuyen,
                      );
                      if (!mounted) return;
                      final error = viewModel.addNhuCauVanChuyen.error;
                      final errorMsg =
                          viewModel.addNhuCauVanChuyen.result.toString();
                      if (error == false) {
                        Navigator.of(context).pop(true);
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Failed to add Nhu Cau Van Chuyen: $errorMsg',
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Add Nhu Cau Van Chuyen'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
