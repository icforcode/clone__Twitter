// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'follower_page.dart';

class MessagePage extends StatefulWidget {
  const MessagePage(this.controller);
  final ScrollController controller;

  @override
  State<MessagePage> createState() => _MessagePageState();
}

class _MessagePageState extends State<MessagePage> {
  final String _randomPic = "https://loremflickr.com/640/480";
  final String _fakeMessage = "send a message ";

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
        sendmessage();
      },
      child: const Icon(Icons.send_outlined));


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
          title: _userMessageView(),
        ),
      );

  Column _userMessageView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Wrap(
          runSpacing: 10,
          direction: Axis.horizontal,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    _listCardTitle("User "),
                    Text(
                      _fakeMessage,
                      style: mainTextStyle,
                    ),
                    const Icon(
                      Icons.mark_chat_unread_outlined,
                      color: CupertinoColors.activeBlue,
                    ),
                  ],
                ),
              ],
            )
          ],
        ),
        const Text(
          "Hi,What's going on today?",
          style: TextStyle(
              fontSize: 12, fontStyle: FontStyle.italic),
        ),
      ],
    );
  }

  Widget _listCardTitle(String text) =>
      Text(text, style: titleTextStyle);

  final titleTextStyle = const TextStyle(
      letterSpacing: 1,
      fontSize: 18,
      fontWeight: FontWeight.bold,
      color: Colors.black);

  final mainTextStyle = const TextStyle(
      letterSpacing: 1, fontSize: 18, color: Colors.black);

  void sendmessage() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const FollowerPage(),
        ));
  }
}
