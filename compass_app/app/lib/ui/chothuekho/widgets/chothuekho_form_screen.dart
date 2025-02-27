// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/chothuekho/chothuekho_model.dart';
import '../view_models/chothuekho_viewmodel.dart';
import '../../../utils/result.dart';

class ChoThueKhoFormScreen extends StatefulWidget {
  final ChoThueKho? choThueKho;

  const ChoThueKhoFormScreen({super.key, this.choThueKho});

  @override
  State<ChoThueKhoFormScreen> createState() => _ChoThueKhoFormScreenState();
}

class _ChoThueKhoFormScreenState extends State<ChoThueKhoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _tenCtyController;
  late TextEditingController _sdt1Controller;
  late TextEditingController _sdt2Controller;
  late TextEditingController _sdt3Controller;
  late TextEditingController _motaController;
  late TextEditingController _diaChiChiTietController;
  late String? _maTinh;
  late String? _maQuan;
  late String? _tentinhTiengviet;
  late String? _tenquanTiengviet;
  String? _anh1;
  String? _anh2;
  String? _anh3;
  String? _anh4;
  String? _anh5;
  String? _anh6;
  String? _anh7;
  String? _anh8;
  String? _anh9;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.choThueKho != null;
    _tenCtyController = TextEditingController(
      text: widget.choThueKho?.tencty ?? '',
    );
    _sdt1Controller = TextEditingController(
      text: widget.choThueKho?.sdt1 ?? '',
    );
    _sdt2Controller = TextEditingController(
      text: widget.choThueKho?.sdt2 ?? '',
    );
    _sdt3Controller = TextEditingController(
      text: widget.choThueKho?.sdt3 ?? '',
    );
    _motaController = TextEditingController(
      text: widget.choThueKho?.mota ?? '',
    );
    _diaChiChiTietController = TextEditingController(
      text: widget.choThueKho?.diachichitiet ?? '',
    );
    _maTinh = widget.choThueKho?.matinh;
    _maQuan = widget.choThueKho?.maquan;
    _tentinhTiengviet = widget.choThueKho?.tentinhTiengviet;
    _tenquanTiengviet = widget.choThueKho?.tenquanTiengviet;
    _anh1 = widget.choThueKho?.anh1;
    _anh2 = widget.choThueKho?.anh2;
    _anh3 = widget.choThueKho?.anh3;
    _anh4 = widget.choThueKho?.anh4;
    _anh5 = widget.choThueKho?.anh5;
    _anh6 = widget.choThueKho?.anh6;
    _anh7 = widget.choThueKho?.anh7;
    _anh8 = widget.choThueKho?.anh8;
    _anh9 = widget.choThueKho?.anh9;
  }

  @override
  void dispose() {
    _tenCtyController.dispose();
    _sdt1Controller.dispose();
    _sdt2Controller.dispose();
    _sdt3Controller.dispose();
    _motaController.dispose();
    _diaChiChiTietController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing ? 'Chỉnh sửa thông tin kho' : 'Thêm kho cho thuê',
        ),
      ),
      body: Consumer<ChoThueKhoViewModel>(
        builder: (context, viewModel, child) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  TextFormField(
                    controller: _tenCtyController,
                    decoration: const InputDecoration(
                      labelText: 'Tên công ty *',
                      hintText: 'Nhập tên công ty',
                      border: OutlineInputBorder(),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập tên công ty';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _sdt1Controller,
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại 1 *',
                      hintText: 'Nhập số điện thoại 1',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Vui lòng nhập số điện thoại';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _sdt2Controller,
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại 2',
                      hintText: 'Nhập số điện thoại 2 (nếu có)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _sdt3Controller,
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại 3',
                      hintText: 'Nhập số điện thoại 3 (nếu có)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),
                  // TODO: Add province and district selectors here
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _diaChiChiTietController,
                    decoration: const InputDecoration(
                      labelText: 'Địa chỉ chi tiết',
                      hintText: 'Số nhà, tên đường, khu vực...',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _motaController,
                    decoration: const InputDecoration(
                      labelText: 'Mô tả',
                      hintText: 'Nhập mô tả về kho cho thuê',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Hình ảnh kho',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 16),
                  _buildImagesGrid(viewModel),
                  const SizedBox(height: 32),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        _submitForm(viewModel);
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Text(
                      _isEditing ? 'Cập nhật' : 'Thêm kho',
                      style: const TextStyle(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildImagesGrid(ChoThueKhoViewModel viewModel) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: 9, // 9 images max
      itemBuilder: (context, index) {
        String? currentImage;
        switch (index) {
          case 0:
            currentImage = _anh1;
          case 1:
            currentImage = _anh2;
          case 2:
            currentImage = _anh3;
          case 3:
            currentImage = _anh4;
          case 4:
            currentImage = _anh5;
          case 5:
            currentImage = _anh6;
          case 6:
            currentImage = _anh7;
          case 7:
            currentImage = _anh8;
          case 8:
            currentImage = _anh9;
        }

        return InkWell(
          onTap: () async {
            await viewModel.pickAndUploadImage.execute();
            final result = viewModel.pickAndUploadImage.result;
            if (result is Ok<String?>) {
              setState(() {
                switch (index) {
                  case 0:
                    _anh1 = result.value;
                  case 1:
                    _anh2 = result.value;
                  case 2:
                    _anh3 = result.value;
                  case 3:
                    _anh4 = result.value;
                  case 4:
                    _anh5 = result.value;
                  case 5:
                    _anh6 = result.value;
                  case 6:
                    _anh7 = result.value;
                  case 7:
                    _anh8 = result.value;
                  case 8:
                    _anh9 = result.value;
                }
              });
            }
          },
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                currentImage != null && currentImage.isNotEmpty
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(currentImage, fit: BoxFit.cover),
                    )
                    : const Center(
                      child: Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 40,
                        color: Colors.grey,
                      ),
                    ),
          ),
        );
      },
    );
  }

  void _submitForm(ChoThueKhoViewModel viewModel) {
    final choThueKho = ChoThueKho(
      id: widget.choThueKho?.id,
      tencty: _tenCtyController.text,
      sdt1: _sdt1Controller.text,
      sdt2: _sdt2Controller.text.isNotEmpty ? _sdt2Controller.text : null,
      sdt3: _sdt3Controller.text.isNotEmpty ? _sdt3Controller.text : null,
      matinh: _maTinh,
      maquan: _maQuan,
      tentinhTiengviet: _tentinhTiengviet,
      tenquanTiengviet: _tenquanTiengviet,
      diachichitiet: _diaChiChiTietController.text,
      mota: _motaController.text,
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

    if (_isEditing) {
      viewModel.updateChoThueKho
          .execute(choThueKho)
          .then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Cập nhật thành công')),
            );
            Navigator.pop(context);
          })
          .catchError((error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Lỗi: ${error.toString()}')));
          });
    } else {
      viewModel.addChoThueKho
          .execute(choThueKho)
          .then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Thêm kho thành công')),
            );
            Navigator.pop(context);
          })
          .catchError((error) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text('Lỗi: ${error.toString()}')));
          });
    }
  }
}
