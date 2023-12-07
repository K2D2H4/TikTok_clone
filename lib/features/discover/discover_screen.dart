import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:tiktok_clone/constants/breakpoint.dart';
import 'package:tiktok_clone/constants/gaps.dart';

import '../../constants/sizes.dart';

final tabs = [
  "Top",
  "Users",
  "Videos",
  "Sounds",
  "LIVE",
  "Shopping",
  "Brands",
];

class DiscoverScreen extends StatefulWidget {
  const DiscoverScreen({super.key});

  @override
  State<DiscoverScreen> createState() => _DiscoverScreenState();
}

class _DiscoverScreenState extends State<DiscoverScreen>
    with SingleTickerProviderStateMixin {
  bool _isWritten = false;

  final TextEditingController _textEditingController =
      TextEditingController(text: "Initial Text");

  late final TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  void _onSearchChanged(String value) {
    if (value != "") {
      setState(() {
        _isWritten = true;
      });
    }
  }

  void _onSearchSubmitted(String value) {
    print(value);
  }

  void _onSearchClear() {
    _textEditingController.text = "";
    setState(() {
      _isWritten = false;
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _textEditingController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          /*title: CupertinoSearchTextField(
            controller: _textEditingController,
            onChanged: _onSearchChanged,
            onSubmitted: _onSearchSubmitted,
          ),*/
          title: Center(
            child: ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: Breakpoints.sm,
              ),
              child: SizedBox(
                height: Sizes.size40,
                child: TextField(
                  onChanged: _onSearchChanged,
                  onSubmitted: _onSearchSubmitted,
                  controller: _textEditingController,
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size10),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            FaIcon(
                              FontAwesomeIcons.magnifyingGlass,
                              color: Colors.grey.shade400,
                              size: Sizes.size20,
                            ),
                          ],
                        ),
                      ),
                      suffixIcon: GestureDetector(
                        onTap: _onSearchClear,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                            horizontal: Sizes.size10,
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              if (_isWritten)
                                FaIcon(
                                  FontAwesomeIcons.solidCircleXmark,
                                  color: Colors.grey.shade500,
                                  size: Sizes.size20,
                                ),
                            ],
                          ),
                        ),
                      ),
                      hintStyle: TextStyle(color: Colors.grey.shade500),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(Sizes.size12),
                        borderSide: BorderSide.none,
                      ),
                      filled: true,
                      fillColor: Colors.grey.shade200,
                      contentPadding: const EdgeInsets.symmetric(
                        horizontal: Sizes.size10,
                      )),
                ),
              ),
            ),
          ),
          bottom: TabBar(
            tabAlignment: TabAlignment.center,
            controller: _tabController,
            splashFactory: NoSplash.splashFactory,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.grey.shade500,
            indicatorColor: Colors.black,
            labelStyle: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: Sizes.size16,
            ),
            tabs: [
              for (var tab in tabs)
                Tab(
                  text: tab,
                ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            GridView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              padding: const EdgeInsets.all(
                Sizes.size6,
              ),
              itemCount: 20,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > Breakpoints.lg ? 5 : 2,
                crossAxisSpacing: Sizes.size10,
                mainAxisSpacing: Sizes.size10,
                childAspectRatio: 9 / 20,
              ),
              itemBuilder: (context, index) => LayoutBuilder(
                builder: (context, constraints) => Column(
                  children: [
                    Container(
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(
                        Sizes.size4,
                      )),
                      child: AspectRatio(
                        aspectRatio: 9 / 15,
                        child: FadeInImage.assetNetwork(
                          fit: BoxFit.cover,
                          placeholder: "assets/images/image1.jpg",
                          image:
                              "https://images.unsplash.com/photo-1566895291281-ea63efd4bdbc?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1yZWxhdGVkfDN8fHxlbnwwfHx8fHw%3D&w=1000&q=80",
                        ),
                      ),
                    ),
                    Gaps.v10,
                    Text(
                      "${constraints.maxWidth}This is a very long caption for my tiktok that I'm upload just now currently",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        fontSize: Sizes.size16,
                        fontWeight: FontWeight.bold,
                      ),
                      maxLines: 2,
                    ),
                    Gaps.v8,
                    if (constraints.maxWidth < 200 ||
                        constraints.maxWidth > 250)
                      DefaultTextStyle(
                        style: TextStyle(
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w600,
                        ),
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 12,
                              backgroundImage: NetworkImage(
                                  "https://avatars.githubusercontent.com/u/139418272?v=4"),
                            ),
                            Gaps.h4,
                            Expanded(
                              child: Text(
                                "My avatar is going to be very long",
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Gaps.h4,
                            FaIcon(
                              FontAwesomeIcons.heart,
                              size: Sizes.size16,
                              color: Colors.grey.shade600,
                            ),
                            Gaps.h2,
                            Text(
                              "2.5M",
                              style: TextStyle(
                                color: Colors.grey.shade600,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      )
                  ],
                ),
              ),
            ),
            for (var tab in tabs.skip(1))
              Center(
                child: Text(tab,
                    style: const TextStyle(
                      fontSize: Sizes.size16,
                    )),
              ),
          ],
        ),
      ),
    );
  }
}
