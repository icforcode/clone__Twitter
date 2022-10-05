// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:twitter_clone/home/tweet_page.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage(this.controller);
  final ScrollController controller;

  @override
  State<NotificationPage> createState() =>
      _NotificationPageState();
}

class _NotificationPageState
    extends State<NotificationPage> {
  final String _randomPic =
      "https://loremflickr.com/640/480/business";

  final String _fakeNotification1 = "Liked your tweet ";

  bool isHeaderClose = false;
  double lastOffset = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _shareButton,
      body: _listViewB,
    );
  }

  Widget get _shareButton => FloatingActionButton(
      onPressed: () {
        shareTweet();
      },
      child: const Icon(Icons.add));


  Widget get _listViewB => ListView.builder(
        itemCount: 25,
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
              Row(
                children: [
                  _listCardTitleNotification("User"),
                  const SizedBox(
                    width: 5,
                  ),
                  Text(
                    _fakeNotification1,
                    style: mainTextStyle,
                  ),
                  Icon(
                    Icons.favorite,
                    color: Theme.of(context).errorColor,
                  ),
                ],
              ),
            ],
          ),
        ),
      );
  Widget _listCardTitleNotification(String text) =>
      Text(text, style: titleTextStyle);

  final titleTextStyle = const TextStyle(
      letterSpacing: 1,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  final mainTextStyle = const TextStyle(
      letterSpacing: 1, fontSize: 18, color: Colors.black);

  void shareTweet() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TweetPage(),
        ));
  }
}
