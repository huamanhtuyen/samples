// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/hocsinh_viewmodel.dart';
import '../../../domain/models/hocsinh/hocsinh_model.dart';

class EditHocSinhScreen extends StatefulWidget {
  final HocSinh hocSinh;

  const EditHocSinhScreen({super.key, required this.hocSinh});

  @override
  State<EditHocSinhScreen> createState() => _EditHocSinhScreenState();
}

class _EditHocSinhScreenState extends State<EditHocSinhScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _hoten;
  late int _tuoi;

  @override
  void initState() {
    super.initState();
    _hoten = widget.hocSinh.hoten;
    _tuoi = widget.hocSinh.tuoi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Edit Hoc Sinh')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                initialValue: _hoten,
                decoration: InputDecoration(labelText: 'Ho Ten'),
                onSaved: (value) {
                  _hoten = value!;
                },
              ),
              TextFormField(
                initialValue: _tuoi.toString(),
                decoration: InputDecoration(labelText: 'Tuoi'),
                keyboardType: TextInputType.number,
                onSaved: (value) {
                  _tuoi = int.parse(value!);
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    _formKey.currentState!.save();
                    final updatedHocSinh = HocSinh(
                      id: widget.hocSinh.id,
                      hoten: _hoten,
                      tuoi: _tuoi,
                    );
                    final viewModel = context.read<HocSinhViewModel>();
                    await viewModel.updateHocSinh.execute(updatedHocSinh);
                    if (!mounted) return;
                    final error = viewModel.updateHocSinh.error;
                    final errorMsg = viewModel.updateHocSinh.result.toString();

                    if (error == false) {
                      //Navigator.pop(context, true);
                      Navigator.of(context).pop(true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to add Hoc Sinh: $errorMsg'),
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
