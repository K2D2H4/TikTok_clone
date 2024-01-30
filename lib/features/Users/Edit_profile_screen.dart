import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/Users/view_models/users_view_model.dart';

class EditProfileScreen extends ConsumerStatefulWidget {
  const EditProfileScreen({super.key});

  @override
  EditProfileScreenState createState() => EditProfileScreenState();
}

class EditProfileScreenState extends ConsumerState<EditProfileScreen> {
  final TextEditingController _linkController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();

  void _onSubmit() {
    ref
        .read(userProvider.notifier)
        .updateProfile(_linkController.text, _bioController.text);
    Navigator.pop(context);
  }

  @override
  void initState() {
    super.initState();

    final userProfile = ref.read(userProvider).value;

    if (userProfile != null) {
      _linkController.text = userProfile.link;
      _bioController.text = userProfile.bio;
    }
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(userProvider).isLoading;
    return ref.watch(userProvider).when(
          error: (error, stackTrace) => Center(
            child: Text(
              error.toString(),
            ),
          ),
          loading: () => const Center(
            child: CircularProgressIndicator.adaptive(),
          ),
          data: (data) => Scaffold(
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
                    controller: _linkController,
                    decoration: InputDecoration(
                      suffixIcon: Icon(Icons.clear),
                      hintText: 'Enter link',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v24,
                  TextField(
                    controller: _bioController,
                    keyboardType: TextInputType.multiline,
                    maxLines: 4,
                    decoration: InputDecoration(
                      hintText: "Enter Bio",
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                          width: 2,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    ),
                  ),
                  Gaps.v24,
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Theme.of(context).primaryColor,
                      minimumSize: Size(120, 40),
                    ),
                    onPressed: _onSubmit,
                    child: isLoading
                        ? const CircularProgressIndicator()
                        : const Text(
                            "Submit",
                            style: TextStyle(
                              color: Colors.white,
                            ),
                          ),
                  ),
                ],
              ),
            ),
          ),
        );
  }
}
