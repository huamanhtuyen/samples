import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late String _mst;
  late String _picture;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Edit Profile')),
      body: FutureBuilder<Result<User>>(
        future: context.read<UserRepository>().getUser(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (snapshot.hasData) {
            final result = snapshot.data!;
            switch (result) {
              case Ok():
                {
                  final user = result.value;
                  _mst = user.mst ?? '';
                  _picture = user.picture ?? '';
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          TextFormField(
                            initialValue: _mst,
                            decoration: const InputDecoration(labelText: 'Mst'),
                            onSaved: (value) {
                              _mst = value!;
                            },
                          ),
                          TextFormField(
                            initialValue: _picture,
                            decoration: const InputDecoration(
                              labelText: 'Picture URL',
                            ),
                            onSaved: (value) {
                              _picture = value!;
                            },
                          ),
                          const SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                _formKey.currentState!.save();
                                final result = await context
                                    .read<UserRepository>()
                                    .updateUser(
                                      User(
                                        id: user.id,
                                        mst: _mst,
                                        picture: _picture,
                                      ),
                                    );
                                switch (result) {
                                  case Ok():
                                    {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Profile updated successfully',
                                          ),
                                        ),
                                      );
                                    }
                                  case Error():
                                    {
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Error: ${result.error}',
                                          ),
                                        ),
                                      );
                                    }
                                }
                              }
                            },
                            child: const Text('Save'),
                          ),
                        ],
                      ),
                    ),
                  );
                }
              case Error():
                {
                  return Text(result.error.toString());
                }
            }
          } else {
            return const Center(child: Text('No user data available'));
          }
        },
      ),
    );
  }
}
