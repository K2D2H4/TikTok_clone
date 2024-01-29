import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/constants/gaps.dart';

class EditProfileScreen extends ConsumerWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Update Profile'),
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: Column(
          children: [
            Gaps.v20,
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.clear),
                hintText: 'link',
                helperText: 'Write your link',
                filled: true,
              ),
            ),
            Gaps.v10,
            TextField(
              decoration: InputDecoration(
                suffixIcon: Icon(Icons.clear),
                hintText: 'link',
                helperText: 'Write your bio',
                filled: true,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
