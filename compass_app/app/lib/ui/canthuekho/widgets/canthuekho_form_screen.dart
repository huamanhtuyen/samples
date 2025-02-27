// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/canthuekho/canthuekho_model.dart';
import '../view_models/canthuekho_viewmodel.dart';
import '../../../utils/result.dart';

class CanThueKhoFormScreen extends StatefulWidget {
  final CanThueKho? canThueKho;

  const CanThueKhoFormScreen({super.key, this.canThueKho});

  @override
  State<CanThueKhoFormScreen> createState() => _CanThueKhoFormScreenState();
}

class _CanThueKhoFormScreenState extends State<CanThueKhoFormScreen> {
  final _formKey = GlobalKey<FormState>();
  late TextEditingController _tenCtyController;
  late TextEditingController _sdt1Controller;
  late TextEditingController _sdt2Controller;
  late TextEditingController _sdt3Controller;
  late TextEditingController _motaController;

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
    _isEditing = widget.canThueKho != null;
    _tenCtyController = TextEditingController(
      text: widget.canThueKho?.tencty ?? '',
    );
    _sdt1Controller = TextEditingController(
      text: widget.canThueKho?.sdt1 ?? '',
    );
    _sdt2Controller = TextEditingController(
      text: widget.canThueKho?.sdt2 ?? '',
    );
    _sdt3Controller = TextEditingController(
      text: widget.canThueKho?.sdt3 ?? '',
    );
    _motaController = TextEditingController(
      text: widget.canThueKho?.mota ?? '',
    );

    _maTinh = widget.canThueKho?.matinh;
    _maQuan = widget.canThueKho?.maquan;
    _tentinhTiengviet = widget.canThueKho?.tentinhTiengviet;
    _tenquanTiengviet = widget.canThueKho?.tenquanTiengviet;
    _anh1 = widget.canThueKho?.anh1;
    _anh2 = widget.canThueKho?.anh2;
    _anh3 = widget.canThueKho?.anh3;
    _anh4 = widget.canThueKho?.anh4;
    _anh5 = widget.canThueKho?.anh5;
    _anh6 = widget.canThueKho?.anh6;
    _anh7 = widget.canThueKho?.anh7;
    _anh8 = widget.canThueKho?.anh8;
    _anh9 = widget.canThueKho?.anh9;
  }

  @override
  void dispose() {
    _tenCtyController.dispose();
    _sdt1Controller.dispose();
    _sdt2Controller.dispose();
    _sdt3Controller.dispose();
    _motaController.dispose();
    super.dispose();
  }

  void _submitForm(CanThueKhoViewModel viewModel) {
    final canThueKho = CanThueKho(
      id: widget.canThueKho?.id,
      tencty: _tenCtyController.text,
      sdt1: _sdt1Controller.text,
      sdt2: _sdt2Controller.text.isNotEmpty ? _sdt2Controller.text : null,
      sdt3: _sdt3Controller.text.isNotEmpty ? _sdt3Controller.text : null,
      matinh: _maTinh,
      maquan: _maQuan,
      tentinhTiengviet: _tentinhTiengviet,
      tenquanTiengviet: _tenquanTiengviet,
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
      viewModel.updateCanThueKho.execute(canThueKho);
    } else {
      viewModel.addCanThueKho.execute(canThueKho);
    }

    // Handle result
    final result =
        _isEditing
            ? viewModel.updateCanThueKho.result
            : viewModel.addCanThueKho.result;

    if (result is Ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            _isEditing
                ? 'Cập nhật thành công'
                : 'Thêm yêu cầu thuê kho thành công',
          ),
          backgroundColor: Colors.green,
        ),
      );
      Navigator.pop(context, true);
    } else if (result is Ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Lỗi: ${(result as Error).error}'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Widget _buildLocationSelection() {
    return Consumer<CanThueKhoViewModel>(
      builder: (context, viewModel, child) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Địa điểm *',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            // Province dropdown
            // DropdownButtonFormField<String>(
            //   decoration: const InputDecoration(
            //     labelText: 'Tỉnh/Thành phố',
            //     border: OutlineInputBorder(),
            //   ),
            //   value: _maTinh,
            //   hint: const Text('Chọn tỉnh/thành phố'),
            //   items:
            //       viewModel.provinces.map((province) {
            //         return DropdownMenuItem<String>(
            //           value: province.ma,
            //           child: Text(province.tenTiengviet ?? ''),
            //         );
            //       }).toList(),
            //   onChanged: (value) {
            //     setState(() {
            //       _maTinh = value;
            //       _maQuan = null; // Reset district when province changes
            //       _tentinhTiengviet =
            //           viewModel.provinces
            //               .firstWhere((province) => province.ma == value)
            //               .tenTiengviet;
            //     });
            //     // Load districts for selected province
            //     if (value != null) {
            //       viewModel.getDistricts.execute(value);
            //     }
            //   },
            //   validator: (value) {
            //     if (value == null || value.isEmpty) {
            //       return 'Vui lòng chọn tỉnh/thành phố';
            //     }
            //     return null;
            //   },
            // ),
            const SizedBox(height: 16),
            // District dropdown
            //   DropdownButtonFormField<String>(
            //     decoration: const InputDecoration(
            //       labelText: 'Quận/Huyện',
            //       border: OutlineInputBorder(),
            //     ),
            //     value: _maQuan,
            //     hint: const Text('Chọn quận/huyện'),
            //     items:
            //         viewModel.districts.map((district) {
            //           return DropdownMenuItem<String>(
            //             value: district.ma,
            //             child: Text(district.tenTiengviet ?? ''),
            //           );
            //         }).toList(),
            //     onChanged: (value) {
            //       setState(() {
            //         _maQuan = value;
            //         _tenquanTiengviet =
            //             viewModel.districts
            //                 .firstWhere((district) => district.ma == value)
            //                 .tenTiengviet;
            //       });
            //     },
            //     validator: (value) {
            //       if (value == null || value.isEmpty) {
            //         return 'Vui lòng chọn quận/huyện';
            //       }
            //       return null;
            //     },
            //     // Disable if no province is selected
            //     onTap:
            //         _maTinh == null
            //             ? () {
            //               ScaffoldMessenger.of(context).showSnackBar(
            //                 const SnackBar(
            //                   content: Text('Vui lòng chọn tỉnh/thành phố trước'),
            //                 ),
            //               );
            //             }
            //             : null,
            //   ),
            //   const SizedBox(height: 16),
            //   TextFormField(
            //     controller: _diaChiChiTietController,
            //     decoration: const InputDecoration(
            //       labelText: 'Địa chỉ chi tiết',
            //       hintText: 'Số nhà, tên đường, khu vực...',
            //       border: OutlineInputBorder(),
            //     ),
            //   ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing
              ? 'Chỉnh sửa thông tin cần thuê kho'
              : 'Thêm yêu cầu thuê kho',
        ),
      ),
      body: Consumer<CanThueKhoViewModel>(
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
                  _buildLocationSelection(),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _motaController,
                    decoration: const InputDecoration(
                      labelText: 'Mô tả yêu cầu',
                      hintText:
                          'Nhập mô tả về kho cần thuê (diện tích, vị trí...)',
                      border: OutlineInputBorder(),
                      alignLabelWithHint: true,
                    ),
                    maxLines: 5,
                  ),
                  const SizedBox(height: 24),
                  const Text(
                    'Hình ảnh tham khảo (nếu có)',
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
                      _isEditing ? 'Cập nhật' : 'Thêm yêu cầu',
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

  Widget _buildImagesGrid(CanThueKhoViewModel viewModel) {
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
}
