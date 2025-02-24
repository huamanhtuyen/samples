import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          },
        ),
      ),
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
                  return Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name: ${user.name}',
                          style: TextStyle(fontSize: 20),
                        ),
                        const SizedBox(height: 10),
                        user.picture.isNotEmpty
                            ? Image.network(user.picture)
                            : const SizedBox.shrink(),
                      ],
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
