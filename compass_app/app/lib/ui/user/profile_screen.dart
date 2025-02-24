import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../data/repositories/user/user_repository.dart';
import '../../../domain/models/user/user.dart';
import '../../../utils/result.dart';
import 'edit_profile_screen.dart';

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
                        Row(
                          children: [
                            Text(
                              'Mst: ',
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            Text(
                              user.mst ?? '',
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.blue,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 10),
                        user.picture != null
                            ? Image.network(user.picture ?? '')
                            : const SizedBox.shrink(),
                        const SizedBox(height: 10),
                        Center(
                          child: Column(
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder:
                                          (context) =>
                                              const EditProfileScreen(),
                                    ),
                                  );
                                },
                                child: const Text('Edit Profile'),
                              ),
                              const SizedBox(height: 10),
                              TextButton(
                                onPressed: () async {
                                  await context
                                      .read<UserRepository>()
                                      .deleteUser();
                                },
                                style: TextButton.styleFrom(
                                  foregroundColor: Colors.red.withAlpha(128),
                                ),
                                child: const Text('Delete Account'),
                              ),
                            ],
                          ),
                        ),
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
