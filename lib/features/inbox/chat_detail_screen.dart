import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../constants/sizes.dart';

class ChatDetailScreen extends StatefulWidget {
  const ChatDetailScreen({super.key});

  @override
  State<ChatDetailScreen> createState() => _ChatDetailScreenState();
}

class _ChatDetailScreenState extends State<ChatDetailScreen> {
  void _stopWriting() {
    FocusScope.of(context).unfocus();

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          contentPadding: EdgeInsets.zero,
          horizontalTitleGap: Sizes.size8,
          leading: Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 50,
                height: 50,
              ),
              const CircleAvatar(
                radius: Sizes.size20,
                foregroundImage: NetworkImage(
                    "https://avatars.githubusercontent.com/u/139418272?v=4"),
              ),
              Positioned(
                bottom: 0,
                right: 1,
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 3,
                      color: Colors.white,
                    ),
                    shape: BoxShape.circle,
                    color: Colors.green,
                  ),
                  height: Sizes.size20,
                  width: Sizes.size20,
                ),
              ),
            ],
          ),
          title: const Text(
            'KDH',
            style: TextStyle(
              fontWeight: FontWeight.w600,
            ),
          ),
          subtitle: const Text("Active now"),
          trailing: const Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              FaIcon(
                FontAwesomeIcons.flag,
                size: Sizes.size20,
              ),
              Gaps.h32,
              FaIcon(
                FontAwesomeIcons.ellipsis,
                size: Sizes.size20,
              ),
            ],
          ),
        ),
      ),
      body: GestureDetector(
        onTap: _stopWriting,
        child: Stack(children: [
          ListView.separated(
            padding: const EdgeInsets.symmetric(
              vertical: Sizes.size20,
              horizontal: Sizes.size14,
            ),
            itemBuilder: (context, index) {
              final isMine = index % 2 == 0;
              return Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment:
                    isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: [
                  Container(
                    padding: const EdgeInsets.all(
                      Sizes.size14,
                    ),
                    decoration: BoxDecoration(
                      color:
                          isMine ? Colors.blue : Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: const Radius.circular(
                          Sizes.size20,
                        ),
                        topRight: const Radius.circular(
                          Sizes.size20,
                        ),
                        bottomLeft: Radius.circular(
                            isMine ? Sizes.size20 : Sizes.size5),
                        bottomRight: Radius.circular(
                            isMine ? Sizes.size5 : Sizes.size20),
                      ),
                    ),
                    child: const Text(
                      'This is a Message.',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: Sizes.size16,
                      ),
                    ),
                  ),
                ],
              );
            },
            separatorBuilder: (context, index) => Gaps.v10,
            itemCount: 20,
          ),
          Positioned(
            bottom: 0,
            width: MediaQuery.of(context).size.width,
            child: BottomAppBar(
              color: Colors.grey.shade50,
              child: Row(
                children: [
                  Expanded(
                    child: SizedBox(
                      height: Sizes.size60,
                      child: TextField(
                        expands: true,
                        minLines: null,
                        maxLines: null,
                        cursorColor: Theme.of(context).primaryColor,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size20,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          hintText: 'Send a message...',
                          hintStyle: TextStyle(
                            color: Colors.grey.shade500,
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(
                              Sizes.size10,
                            ),
                            borderSide: BorderSide.none,
                          ),
                          suffixIconColor: Colors.grey.shade500,
                          suffixIcon: const Padding(
                            padding: EdgeInsets.symmetric(
                              horizontal: Sizes.size10,
                            ),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                FaIcon(
                                  FontAwesomeIcons.faceSmile,
                                  size: Sizes.size28,
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Gaps.h10,
                  Container(
                    alignment: Alignment.center,
                    width: Sizes.size44,
                    height: Sizes.size44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade400,
                    ),
                    child: const FaIcon(
                      FontAwesomeIcons.solidPaperPlane,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          )
        ]),
      ),
    );
  }
}
