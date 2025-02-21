// ignore_for_file: directives_ordering

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../view_models/hocsinh_viewmodel.dart';
import '../../../domain/models/hocsinh/hocsinh_model.dart';

class AddHocSinhScreen extends StatefulWidget {
  const AddHocSinhScreen({super.key});

  @override
  State<AddHocSinhScreen> createState() => _AddHocSinhScreenState();
}

class _AddHocSinhScreenState extends State<AddHocSinhScreen> {
  final _formKey = GlobalKey<FormState>();
  final _hotenController = TextEditingController();
  final _tuoiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Hoc Sinh')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _hotenController,
                decoration: InputDecoration(labelText: 'Ho Ten'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter ho ten';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _tuoiController,
                decoration: InputDecoration(labelText: 'Tuoi'),
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter tuoi';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {
                    final hocSinh = HocSinh(
                      hoten: _hotenController.text,
                      tuoi: int.parse(_tuoiController.text),
                    );
                    final viewModel = context.read<HocSinhViewModel>();
                    await viewModel.addHocSinh.execute(hocSinh);
                    if (!mounted) return;
                    final error = viewModel.addHocSinh.error;
                    final errorMsg = viewModel.addHocSinh.result.toString();
                    if (error == false) {
                      Navigator.pop(context, true);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('Failed to add Hoc Sinh: $errorMsg'),
                        ),
                      );
                    }
                  }
                },
                child: Text('Add Hoc Sinh'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
