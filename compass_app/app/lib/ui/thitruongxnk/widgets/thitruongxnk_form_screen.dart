// ignore_for_file: directives_ordering
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../domain/models/thitruongxnk/thitruongxnk_model.dart';
import '../view_models/thitruongxnk_viewmodel.dart';
import '../../../utils/result.dart';

class ThiTruongXNKFormScreen extends StatefulWidget {
  final ThiTruongXNK? thiTruongXNK;

  const ThiTruongXNKFormScreen({super.key, this.thiTruongXNK});

  @override
  State<ThiTruongXNKFormScreen> createState() => _ThiTruongXNKFormScreenState();
}

class _ThiTruongXNKFormScreenState extends State<ThiTruongXNKFormScreen> {
  final _formKey = GlobalKey<FormState>();

  // Define all controllers based on ThiTruongXNK model
  late TextEditingController _tenctyController;
  late TextEditingController _motaController;
  late TextEditingController _sdt1Controller;
  late TextEditingController _sdt2Controller;
  late TextEditingController _sdt3Controller;
  late TextEditingController _matinhController;
  late TextEditingController _tentinhTiengvietController;
  late TextEditingController _tentinhTienganhController;
  late TextEditingController _tentinhTiengtrungController;
  late TextEditingController _tentinhTiengthaiController;
  late TextEditingController _maquanController;
  late TextEditingController _tenquanTiengvietController;
  late TextEditingController _tenquanTienganhController;
  late TextEditingController _tenquanTiengtrungController;
  late TextEditingController _tenquanTiengthaiController;
  late TextEditingController _diachichitietController;

  // Brochure images
  String? _brochurePictureVi;
  String? _brochurePictureEn;
  String? _brochurePictureZh;
  String? _brochurePictureTh;
  String? _brochurePictureOther1;
  String? _brochurePictureOther2;
  String? _brochurePictureOther3;
  String? _brochurePictureOther4;
  String? _brochurePictureOther5;

  bool _isEditing = false;

  @override
  void initState() {
    super.initState();
    _isEditing = widget.thiTruongXNK != null;

    // Initialize controllers with data from model
    _tenctyController = TextEditingController(
      text: widget.thiTruongXNK?.tencty ?? '',
    );
    _motaController = TextEditingController(
      text: widget.thiTruongXNK?.mota ?? '',
    );
    _sdt1Controller = TextEditingController(
      text: widget.thiTruongXNK?.sdt1 ?? '',
    );
    _sdt2Controller = TextEditingController(
      text: widget.thiTruongXNK?.sdt2 ?? '',
    );
    _sdt3Controller = TextEditingController(
      text: widget.thiTruongXNK?.sdt3 ?? '',
    );
    _matinhController = TextEditingController(
      text: widget.thiTruongXNK?.matinh ?? '',
    );
    _tentinhTiengvietController = TextEditingController(
      text: widget.thiTruongXNK?.tentinhTiengviet ?? '',
    );
    _tentinhTienganhController = TextEditingController(
      text: widget.thiTruongXNK?.tentinhTienganh ?? '',
    );
    _tentinhTiengtrungController = TextEditingController(
      text: widget.thiTruongXNK?.tentinhTiengtrung ?? '',
    );
    _tentinhTiengthaiController = TextEditingController(
      text: widget.thiTruongXNK?.tentinhTiengthai ?? '',
    );
    _maquanController = TextEditingController(
      text: widget.thiTruongXNK?.maquan ?? '',
    );
    _tenquanTiengvietController = TextEditingController(
      text: widget.thiTruongXNK?.tenquanTiengviet ?? '',
    );
    _tenquanTienganhController = TextEditingController(
      text: widget.thiTruongXNK?.tenquanTienganh ?? '',
    );
    _tenquanTiengtrungController = TextEditingController(
      text: widget.thiTruongXNK?.tenquanTiengtrung ?? '',
    );
    _tenquanTiengthaiController = TextEditingController(
      text: widget.thiTruongXNK?.tenquanTiengthai ?? '',
    );
    _diachichitietController = TextEditingController(
      text: widget.thiTruongXNK?.diachichitiet ?? '',
    );

    // Initialize brochure images
    _brochurePictureVi = widget.thiTruongXNK?.brochurePictureVi;
    _brochurePictureEn = widget.thiTruongXNK?.brochurePictureEn;
    _brochurePictureZh = widget.thiTruongXNK?.brochurePictureZh;
    _brochurePictureTh = widget.thiTruongXNK?.brochurePictureTh;
    _brochurePictureOther1 = widget.thiTruongXNK?.brochurePictureOther1;
    _brochurePictureOther2 = widget.thiTruongXNK?.brochurePictureOther2;
    _brochurePictureOther3 = widget.thiTruongXNK?.brochurePictureOther3;
    _brochurePictureOther4 = widget.thiTruongXNK?.brochurePictureOther4;
    _brochurePictureOther5 = widget.thiTruongXNK?.brochurePictureOther5;
  }

  @override
  void dispose() {
    _tenctyController.dispose();
    _motaController.dispose();
    _sdt1Controller.dispose();
    _sdt2Controller.dispose();
    _sdt3Controller.dispose();
    _matinhController.dispose();
    _tentinhTiengvietController.dispose();
    _tentinhTienganhController.dispose();
    _tentinhTiengtrungController.dispose();
    _tentinhTiengthaiController.dispose();
    _maquanController.dispose();
    _tenquanTiengvietController.dispose();
    _tenquanTienganhController.dispose();
    _tenquanTiengtrungController.dispose();
    _tenquanTiengthaiController.dispose();
    _diachichitietController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _isEditing
              ? 'Chỉnh sửa thông tin thị trường'
              : 'Thêm thông tin thị trường',
        ),
      ),
      body: Consumer<ThiTruongXNKViewModel>(
        builder: (context, viewModel, child) {
          return Form(
            key: _formKey,
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // Company Information
                  _buildSectionHeader('Thông tin công ty'),

                  TextFormField(
                    controller: _tenctyController,
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
                    controller: _motaController,
                    decoration: const InputDecoration(
                      labelText: 'Mô tả',
                      hintText: 'Nhập mô tả ngắn về công ty',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 3,
                  ),
                  const SizedBox(height: 16),

                  // Contact Information
                  _buildSectionHeader('Thông tin liên hệ'),

                  TextFormField(
                    controller: _sdt1Controller,
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại 1',
                      hintText: 'Nhập số điện thoại chính',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _sdt2Controller,
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại 2',
                      hintText: 'Nhập số điện thoại phụ (nếu có)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),

                  TextFormField(
                    controller: _sdt3Controller,
                    decoration: const InputDecoration(
                      labelText: 'Số điện thoại 3',
                      hintText: 'Nhập số điện thoại phụ khác (nếu có)',
                      border: OutlineInputBorder(),
                    ),
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: 16),

                  // Province Information
                  _buildSectionHeader('Thông tin tỉnh/thành'),

                  TextFormField(
                    controller: _matinhController,
                    decoration: const InputDecoration(
                      labelText: 'Mã tỉnh',
                      hintText: 'Nhập mã tỉnh',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildLanguageFields(
                    'tỉnh/thành',
                    _tentinhTiengvietController,
                    _tentinhTienganhController,
                    _tentinhTiengtrungController,
                    _tentinhTiengthaiController,
                  ),

                  // District Information
                  _buildSectionHeader('Thông tin quận/huyện'),

                  TextFormField(
                    controller: _maquanController,
                    decoration: const InputDecoration(
                      labelText: 'Mã quận',
                      hintText: 'Nhập mã quận',
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 16),

                  _buildLanguageFields(
                    'quận/huyện',
                    _tenquanTiengvietController,
                    _tenquanTienganhController,
                    _tenquanTiengtrungController,
                    _tenquanTiengthaiController,
                  ),

                  // Detailed Address
                  _buildSectionHeader('Địa chỉ chi tiết'),

                  TextFormField(
                    controller: _diachichitietController,
                    decoration: const InputDecoration(
                      labelText: 'Địa chỉ chi tiết',
                      hintText: 'Nhập địa chỉ chi tiết',
                      border: OutlineInputBorder(),
                    ),
                    maxLines: 2,
                  ),
                  const SizedBox(height: 16),

                  // Brochure Images
                  _buildSectionHeader('Hình ảnh brochure'),

                  _buildBrochureImageSection(viewModel),

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
                      _isEditing ? 'Cập nhật' : 'Thêm mới',
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

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: Colors.blue,
        ),
      ),
    );
  }

  Widget _buildLanguageFields(
    String entityName,
    TextEditingController vietController,
    TextEditingController engController,
    TextEditingController zhController,
    TextEditingController thController,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: vietController,
          decoration: InputDecoration(
            labelText: 'Tên $entityName (Tiếng Việt)',
            hintText: 'Nhập tên $entityName bằng Tiếng Việt',
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),

        TextFormField(
          controller: engController,
          decoration: InputDecoration(
            labelText: 'Tên $entityName (Tiếng Anh)',
            hintText: 'Nhập tên $entityName bằng Tiếng Anh',
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),

        TextFormField(
          controller: zhController,
          decoration: InputDecoration(
            labelText: 'Tên $entityName (Tiếng Trung)',
            hintText: 'Nhập tên $entityName bằng Tiếng Trung',
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),

        TextFormField(
          controller: thController,
          decoration: InputDecoration(
            labelText: 'Tên $entityName (Tiếng Thái)',
            hintText: 'Nhập tên $entityName bằng Tiếng Thái',
            border: const OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  Widget _buildBrochureImageSection(ThiTruongXNKViewModel viewModel) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildBrochureImageUpload(
          viewModel,
          'Brochure tiếng Việt',
          _brochurePictureVi,
          (value) => setState(() => _brochurePictureVi = value),
        ),
        const SizedBox(height: 12),

        _buildBrochureImageUpload(
          viewModel,
          'Brochure tiếng Anh',
          _brochurePictureEn,
          (value) => setState(() => _brochurePictureEn = value),
        ),
        const SizedBox(height: 12),

        _buildBrochureImageUpload(
          viewModel,
          'Brochure tiếng Trung',
          _brochurePictureZh,
          (value) => setState(() => _brochurePictureZh = value),
        ),
        const SizedBox(height: 12),

        _buildBrochureImageUpload(
          viewModel,
          'Brochure tiếng Thái',
          _brochurePictureTh,
          (value) => setState(() => _brochurePictureTh = value),
        ),
        const SizedBox(height: 12),

        _buildBrochureImageUpload(
          viewModel,
          'Hình ảnh khác 1',
          _brochurePictureOther1,
          (value) => setState(() => _brochurePictureOther1 = value),
        ),
        const SizedBox(height: 12),

        _buildBrochureImageUpload(
          viewModel,
          'Hình ảnh khác 2',
          _brochurePictureOther2,
          (value) => setState(() => _brochurePictureOther2 = value),
        ),
        const SizedBox(height: 12),

        _buildBrochureImageUpload(
          viewModel,
          'Hình ảnh khác 3',
          _brochurePictureOther3,
          (value) => setState(() => _brochurePictureOther3 = value),
        ),
        const SizedBox(height: 12),

        _buildBrochureImageUpload(
          viewModel,
          'Hình ảnh khác 4',
          _brochurePictureOther4,
          (value) => setState(() => _brochurePictureOther4 = value),
        ),
        const SizedBox(height: 12),

        _buildBrochureImageUpload(
          viewModel,
          'Hình ảnh khác 5',
          _brochurePictureOther5,
          (value) => setState(() => _brochurePictureOther5 = value),
        ),
      ],
    );
  }

  Widget _buildBrochureImageUpload(
    ThiTruongXNKViewModel viewModel,
    String title,
    String? imageUrl,
    Function(String?) onImageUpdated,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        InkWell(
          onTap: () async {
            await viewModel.pickAndUploadImage.execute();
            final result = viewModel.pickAndUploadImage.result;
            if (result is Ok<String?> && result.value != null) {
              onImageUpdated(result.value);
            }
          },
          child: Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(8),
            ),
            child:
                imageUrl != null && imageUrl.isNotEmpty
                    ? ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.network(imageUrl, fit: BoxFit.cover),
                    )
                    : const Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.add_photo_alternate_outlined,
                            size: 48,
                            color: Colors.grey,
                          ),
                          SizedBox(height: 8),
                          Text('Chạm để thêm ảnh'),
                        ],
                      ),
                    ),
          ),
        ),
        if (imageUrl != null && imageUrl.isNotEmpty)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              icon: const Icon(Icons.delete, color: Colors.red),
              label: const Text('Xóa ảnh', style: TextStyle(color: Colors.red)),
              onPressed: () {
                onImageUpdated(null);
              },
            ),
          ),
      ],
    );
  }

  void _submitForm(ThiTruongXNKViewModel viewModel) {
    final thiTruongXNK = ThiTruongXNK(
      id: widget.thiTruongXNK?.id,
      createdAt: widget.thiTruongXNK?.createdAt,
      userId: widget.thiTruongXNK?.userId,
      mota: _motaController.text.isNotEmpty ? _motaController.text : null,
      tencty: _tenctyController.text.isNotEmpty ? _tenctyController.text : null,
      sdt1: _sdt1Controller.text.isNotEmpty ? _sdt1Controller.text : null,
      sdt2: _sdt2Controller.text.isNotEmpty ? _sdt2Controller.text : null,
      sdt3: _sdt3Controller.text.isNotEmpty ? _sdt3Controller.text : null,
      matinh: _matinhController.text.isNotEmpty ? _matinhController.text : null,
      tentinhTiengviet:
          _tentinhTiengvietController.text.isNotEmpty
              ? _tentinhTiengvietController.text
              : null,
      tentinhTienganh:
          _tentinhTienganhController.text.isNotEmpty
              ? _tentinhTienganhController.text
              : null,
      tentinhTiengtrung:
          _tentinhTiengtrungController.text.isNotEmpty
              ? _tentinhTiengtrungController.text
              : null,
      tentinhTiengthai:
          _tentinhTiengthaiController.text.isNotEmpty
              ? _tentinhTiengthaiController.text
              : null,
      maquan: _maquanController.text.isNotEmpty ? _maquanController.text : null,
      tenquanTiengviet:
          _tenquanTiengvietController.text.isNotEmpty
              ? _tenquanTiengvietController.text
              : null,
      tenquanTienganh:
          _tenquanTienganhController.text.isNotEmpty
              ? _tenquanTienganhController.text
              : null,
      tenquanTiengtrung:
          _tenquanTiengtrungController.text.isNotEmpty
              ? _tenquanTiengtrungController.text
              : null,
      tenquanTiengthai:
          _tenquanTiengthaiController.text.isNotEmpty
              ? _tenquanTiengthaiController.text
              : null,
      brochurePictureVi: _brochurePictureVi,
      brochurePictureEn: _brochurePictureEn,
      brochurePictureZh: _brochurePictureZh,
      brochurePictureTh: _brochurePictureTh,
      brochurePictureOther1: _brochurePictureOther1,
      brochurePictureOther2: _brochurePictureOther2,
      brochurePictureOther3: _brochurePictureOther3,
      brochurePictureOther4: _brochurePictureOther4,
      brochurePictureOther5: _brochurePictureOther5,
      diachichitiet:
          _diachichitietController.text.isNotEmpty
              ? _diachichitietController.text
              : null,
    );

    if (_isEditing) {
      viewModel.updateThiTruongXNK
          .execute(thiTruongXNK)
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
      viewModel.addThiTruongXNK
          .execute(thiTruongXNK)
          .then((_) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Thêm mới thành công')),
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
