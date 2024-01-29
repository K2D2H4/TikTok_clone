import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoint.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/features/Users/Edit_profile_screen.dart';
import 'package:tiktok_clone/features/Users/view_models/users_view_model.dart';
import 'package:tiktok_clone/features/Users/widgets/avatar.dart';
import 'package:tiktok_clone/features/Users/widgets/persistent_tab_bar.dart';
import 'package:tiktok_clone/features/settings/settings_screen.dart';

import '../../constants/sizes.dart';

class UserProfileScreen extends ConsumerStatefulWidget {
  const UserProfileScreen({
    super.key,
    required this.username,
    required this.tab,
  });
  final String username;
  final String tab;

  @override
  UserProfileScreenState createState() => UserProfileScreenState();
}

class UserProfileScreenState extends ConsumerState<UserProfileScreen> {
  void _onGearPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const SettingsScreen(),
      ),
    );
  }

  void _onEditPressed() {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => const EditProfileScreen(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
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
            backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
            body: SafeArea(
              child: DefaultTabController(
                initialIndex: widget.tab == 'likes' ? 1 : 0,
                length: 2,
                child: NestedScrollView(
                  headerSliverBuilder: (context, innerBoxIsScrolled) {
                    return [
                      if (width <= Breakpoints.md) ...[
                        SliverAppBar(
                          centerTitle: true,
                          title: Text(data.name),
                          actions: [
                            IconButton(
                              onPressed: _onEditPressed,
                              icon: const FaIcon(
                                FontAwesomeIcons.pen,
                                size: Sizes.size20,
                              ),
                            ),
                            IconButton(
                              onPressed: _onGearPressed,
                              icon: const FaIcon(
                                FontAwesomeIcons.gear,
                                size: Sizes.size20,
                              ),
                            ),
                          ],
                        ),
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              Gaps.v20,
                              Avatar(
                                uid: data.uid,
                                name: data.name,
                                hasAvatar: data.hasAvatar,
                              ),
                              Gaps.v20,
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    '@${data.name}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: Sizes.size18,
                                    ),
                                  ),
                                  Gaps.h5,
                                  FaIcon(
                                    FontAwesomeIcons.solidCircleCheck,
                                    size: Sizes.size16,
                                    color: Colors.blue.shade500,
                                  ),
                                ],
                              ),
                              Gaps.v24,
                              SizedBox(
                                height: Sizes.size52,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: [
                                        const Text(
                                          '97',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Sizes.size18,
                                          ),
                                        ),
                                        Gaps.v3,
                                        Text(
                                          'Following',
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(
                                      width: Sizes.size32,
                                      thickness: Sizes.size1,
                                      indent: Sizes.size14,
                                      color: Colors.grey.shade400,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          '10M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Sizes.size18,
                                          ),
                                        ),
                                        Gaps.v3,
                                        Text(
                                          'Followers',
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                    VerticalDivider(
                                      width: Sizes.size32,
                                      thickness: Sizes.size1,
                                      indent: Sizes.size14,
                                      color: Colors.grey.shade400,
                                    ),
                                    Column(
                                      children: [
                                        const Text(
                                          '194.3M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: Sizes.size18,
                                          ),
                                        ),
                                        Gaps.v3,
                                        Text(
                                          'Likes',
                                          style: TextStyle(
                                            color: Colors.grey.shade500,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                              Gaps.v14,
                              FractionallySizedBox(
                                widthFactor: 0.7,
                                child: Row(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Expanded(
                                      flex: 6,
                                      child: Container(
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Sizes.size12,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          border: Border.all(
                                            color:
                                                Theme.of(context).primaryColor,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              Sizes.size4,
                                            ),
                                          ),
                                        ),
                                        child: const Text(
                                          'Follow',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w600,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                    ),
                                    Gaps.h2,
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Sizes.size12,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              Sizes.size4,
                                            ),
                                          ),
                                        ),
                                        child: const FaIcon(
                                          FontAwesomeIcons.youtube,
                                          size: Sizes.size20,
                                        ),
                                      ),
                                    ),
                                    Gaps.h2,
                                    Expanded(
                                      flex: 2,
                                      child: Container(
                                        alignment: Alignment.center,
                                        padding: const EdgeInsets.symmetric(
                                          vertical: Sizes.size12,
                                        ),
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: Colors.grey.shade300,
                                          ),
                                          borderRadius: const BorderRadius.all(
                                            Radius.circular(
                                              Sizes.size4,
                                            ),
                                          ),
                                        ),
                                        child: const FaIcon(
                                          FontAwesomeIcons.caretDown,
                                          size: Sizes.size20,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Gaps.v14,
                              const Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: Sizes.size32,
                                ),
                                child: Text(
                                  'All highlights and where to watch live matches on FIFA + I wonder how it would look',
                                  textAlign: TextAlign.center,
                                ),
                              ),
                              Gaps.v14,
                              const Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(
                                    FontAwesomeIcons.link,
                                    size: Sizes.size12,
                                  ),
                                  Gaps.h4,
                                  Text(
                                    'https://nomadcoders.co',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                    ),
                                  )
                                ],
                              ),
                              Gaps.v20,
                            ],
                          ),
                        ),
                      ],
                      if (width > Breakpoints.md) ...[
                        SliverAppBar(
                          centerTitle: true,
                          title: Text(data.name),
                          actions: [
                            IconButton(
                              onPressed: _onGearPressed,
                              icon: const FaIcon(
                                FontAwesomeIcons.gear,
                                size: Sizes.size20,
                              ),
                            )
                          ],
                        ),
                        SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Column(
                                children: [
                                  const CircleAvatar(
                                    radius: 80,
                                    foregroundImage: NetworkImage(
                                        "https://avatars.githubusercontent.com/u/139418272?v=4"),
                                  ),
                                  Gaps.v20,
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        '@${data.name}',
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: Sizes.size18,
                                        ),
                                      ),
                                      Gaps.h5,
                                      FaIcon(
                                        FontAwesomeIcons.solidCircleCheck,
                                        size: Sizes.size16,
                                        color: Colors.blue.shade500,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Gaps.h28,
                              Column(
                                children: [
                                  SizedBox(
                                    height: 50,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Column(
                                          children: [
                                            const Text(
                                              '97',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Sizes.size18,
                                              ),
                                            ),
                                            Gaps.v3,
                                            Text(
                                              'Following',
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        VerticalDivider(
                                          width: Sizes.size32,
                                          thickness: Sizes.size1,
                                          indent: Sizes.size14,
                                          color: Colors.grey.shade400,
                                        ),
                                        Column(
                                          children: [
                                            const Text(
                                              '10M',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Sizes.size18,
                                              ),
                                            ),
                                            Gaps.v3,
                                            Text(
                                              'Followers',
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ],
                                        ),
                                        VerticalDivider(
                                          width: Sizes.size32,
                                          thickness: Sizes.size1,
                                          indent: Sizes.size14,
                                          color: Colors.grey.shade400,
                                        ),
                                        Column(
                                          children: [
                                            const Text(
                                              '194.3M',
                                              style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: Sizes.size18,
                                              ),
                                            ),
                                            Gaps.v3,
                                            Text(
                                              'Likes',
                                              style: TextStyle(
                                                color: Colors.grey.shade500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gaps.v14,
                                  SizedBox(
                                    child: Row(
                                      children: [
                                        Container(
                                          width: 250,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: Sizes.size12,
                                          ),
                                          decoration: BoxDecoration(
                                            color:
                                                Theme.of(context).primaryColor,
                                            border: Border.all(
                                              color: Theme.of(context)
                                                  .primaryColor,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(
                                                Sizes.size4,
                                              ),
                                            ),
                                          ),
                                          child: const Text(
                                            'Follow',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                            ),
                                            textAlign: TextAlign.center,
                                          ),
                                        ),
                                        Gaps.h2,
                                        Container(
                                          width: 80,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: Sizes.size12,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade300,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(
                                                Sizes.size4,
                                              ),
                                            ),
                                          ),
                                          child: const FaIcon(
                                            FontAwesomeIcons.youtube,
                                            size: Sizes.size20,
                                          ),
                                        ),
                                        Gaps.h2,
                                        Container(
                                          width: 80,
                                          alignment: Alignment.center,
                                          padding: const EdgeInsets.symmetric(
                                            vertical: Sizes.size12,
                                          ),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: Colors.grey.shade300,
                                            ),
                                            borderRadius:
                                                const BorderRadius.all(
                                              Radius.circular(
                                                Sizes.size4,
                                              ),
                                            ),
                                          ),
                                          child: const FaIcon(
                                            FontAwesomeIcons.youtube,
                                            size: Sizes.size20,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Gaps.v14,
                                  const Text(
                                    'All highlights and where to watch live matches on FIFA + I wonder how it would look',
                                    textAlign: TextAlign.center,
                                  ),
                                  Gaps.v14,
                                  const Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FaIcon(
                                        FontAwesomeIcons.link,
                                        size: Sizes.size12,
                                      ),
                                      Gaps.h4,
                                      Text(
                                        'https://nomadcoders.co',
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                        ),
                                      )
                                    ],
                                  ),
                                  Gaps.v20,
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                      SliverPersistentHeader(
                        delegate: PersistentTabBar(),
                        pinned: true,
                      )
                    ];
                  },
                  body: TabBarView(
                    children: [
                      GridView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        padding: EdgeInsets.zero,
                        itemCount: 20,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: Sizes.size2,
                          mainAxisSpacing: Sizes.size2,
                          childAspectRatio: 9 / 14,
                        ),
                        itemBuilder: (context, index) => Column(
                          children: [
                            Stack(
                              children: [
                                AspectRatio(
                                  aspectRatio: 9 / 14,
                                  child: FadeInImage.assetNetwork(
                                    fit: BoxFit.cover,
                                    placeholder: "assets/images/image1.jpg",
                                    image:
                                        "https://images.unsplash.com/photo-1566895291281-ea63efd4bdbc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D&w=1000&q=80",
                                  ),
                                ),
                                const Positioned(
                                  bottom: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(4.0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        FaIcon(
                                          FontAwesomeIcons.circlePlay,
                                          size: Sizes.size18,
                                          color: Colors.white,
                                        ),
                                        Gaps.h8,
                                        Text(
                                          '2.4M',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Center(
                        child: Text('Page two'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
  }
}
