// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:twitter_clone/home/search_page.dart';

import 'home_page.dart';
import 'message_page.dart';
import 'notification_page.dart';

// ignore: use_key_in_widget_constructors
class TabbarView extends StatefulWidget {
  @override
  _TabbarViewState createState() => _TabbarViewState();
}

class _TabbarViewState extends State<TabbarView> {
  bool isHeaderClose = false;
  final String _profilePicUrl =
      "https://avatars.githubusercontent.com/u/48881290?v=4";

  late ScrollController scrollController;
  double lastOffset = 0;

  @override
  void initState() {
    super.initState();

    scrollController = ScrollController();

    scrollController.addListener(() {
      if (kDebugMode) {
        print(scrollController.offset);
      }
      if (scrollController.offset <= 0) {
        isHeaderClose = false;
      } else if (scrollController.offset >=
          scrollController.position.maxScrollExtent) {
        isHeaderClose = true;
      } else {
        isHeaderClose = scrollController.offset > lastOffset
            ? true
            : false;
      }

      setState(() {
        lastOffset = scrollController.offset;
      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 0,
      child: Scaffold(
        bottomNavigationBar: _bottomAppBar,
        body: Column(
          children: <Widget>[
            _containerAppbar,
            _tabbarViews
          ],
        ),
      ),
    );
  }

  Widget get _tabbarViews => Expanded(
        child: TabBarView(
          children: <Widget>[
            HomeView(scrollController),
            SearchPage(scrollController),
            NotificationPage(scrollController),
            MessagePage(scrollController),
          ],
        ),
      );

  Widget get _bottomAppBar => BottomAppBar(
        shape: const CircularNotchedRectangle(),
        child: _tabbarItems,
      );
  Widget get _centerAppBarWidget => currentIndex == 1
      ? _searchTextField
      : const Text("Home", style: titleTextStyle);

  Widget get _searchTextField => TextField(
      maxLines: 1,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(0),
        hintText: "Search Twitter",
        prefixIcon: const Icon(
          Icons.search,
          color: Colors.grey,
        ),
        filled: true,
        focusedBorder: outlineInputBorder,
        border: outlineInputBorder,
      ));
  Widget get _emptyWidht => const SizedBox(
        width: 20,
      );
  Widget get _containerAppbar => AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: isHeaderClose
            ? 0
            : MediaQuery.of(context).size.height * .10,
        child: _appBar,
      );
  Widget get _appBar => AppBar(
        elevation: 0,
        title: _appBarItems,
        centerTitle: false,
        actions: <Widget>[
          IconButton(
            icon: const Icon(
              Icons.stream_sharp,
              color: CupertinoColors.activeBlue,
              size: 35,
            ),
            onPressed: () {},
          )
        ],
      );

  OutlineInputBorder get outlineInputBorder =>
      OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(25));

  Widget get _tabbarItems => TabBar(
        isScrollable: false,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        tabs: const <Widget>[
          Tab(icon: Icon(Icons.home)),
          Tab(icon: Icon(Icons.search)),
          Tab(icon: Icon(Icons.notifications_active)),
          Tab(icon: Icon(Icons.mail)),
        ],
      );

  Widget get _appBarItems => Row(
        children: <Widget>[
          CircleAvatar(
              backgroundImage:
                  NetworkImage(_profilePicUrl)),
          _emptyWidht,
          Expanded(child: _centerAppBarWidget),
          _emptyWidht,
        ],
      );
}

const titleTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 20,
    fontWeight: FontWeight.w600,
    color: Colors.black);
