import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'tabbar_page.dart';
import 'tweet_page.dart';

// ignore: must_be_immutable
class HomeView extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  HomeView(this.controller);
  ScrollController controller;

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final String _randomPic = "https://picsum.photos/200/300";

  final String _fakeTweet =
      "Members of the Orange County Fire Rescue, the Orange County Sheriff’s Office and the National Guard guided residents and their pets through floodwaters during rescue efforts Thursday in Orange County, Florida ";

  final String _randomTweetPic =
      "https://loremflickr.com/320/240";

  bool isHeaderClose = false;
  double lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: _shareButton,
        body: _listViewB);
  }

  Widget get _shareButton => FloatingActionButton(
      onPressed: () {
        shareTweet();
      },
      child: const Icon(Icons.add));

  Widget get _listViewB => ListView.builder(
        itemCount: 10,
        controller: widget.controller,
        itemBuilder: (context, index) {
          return _listViewCard;
        },
      );

  Widget get _listViewCard => Card(
        child: ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(_randomPic),
          ),
          title: Wrap(
            runSpacing: 10,
            direction: Axis.horizontal,
            children: [
              _listCardTitle("Hello "),
              Text(_fakeTweet),
              _placeHolderField,
              _footerButtonRow,
            ],
          ),
        ),
      );

  Widget _listCardTitle(String text) =>
      Text(text, style: titleTextStyle);

  Widget _iconCommentLabel(String text) => Wrap(
        spacing: 5,
        children: [
          const Icon(
            Icons.comment_rounded,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget _iconReplyLabel(String text) => Wrap(
        spacing: 5,
        children: [
          const Icon(
            Icons.reply_all,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget _iconFavLabel(String text) => Wrap(
        spacing: 5,
        children: [
          const Icon(
            Icons.favorite,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget _iconShareLabel(String text) => Wrap(
        spacing: 5,
        children: [
          const Icon(
            Icons.share,
            color: CupertinoColors.inactiveGray,
          ),
          Text(text),
        ],
      );

  Widget get _footerButtonRow => Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _iconLabelCommentButton,
          _iconLabelREplyButton,
          _iconLabelFavButton,
          _iconLabelShareButton
        ],
      );

  Widget get _iconLabelCommentButton => InkWell(
        child: _iconCommentLabel("1"),
        onTap: () {},
      );

  Widget get _iconLabelREplyButton => InkWell(
        child: _iconReplyLabel("1"),
        onTap: () {},
      );

  Widget get _iconLabelFavButton => InkWell(
        child: _iconFavLabel("1"),
        onTap: () {},
      );

  Widget get _iconLabelShareButton => InkWell(
        child: _iconShareLabel("1"),
        onTap: () {},
      );

  Widget get _placeHolderField =>
      Image(image: NetworkImage(_randomTweetPic));

  void shareTweet() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TweetPage(),
        ));
  }
}
