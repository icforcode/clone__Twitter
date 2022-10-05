// ignore_for_file: unused_field

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class FollowerPage extends StatefulWidget {
  const FollowerPage({Key? key}) : super(key: key);

  @override
  State<FollowerPage> createState() => _FollowerPageState();
}

class _FollowerPageState extends State<FollowerPage> {
  final String _randomPic = "https://loremflickr.com/640/480";
  final String _fakeMessage = "send a message ";

  bool isHeaderClose = false;
  double lastOffset = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Row(
            children: [
              _backtoHomeTitle(),
              _emptyWidht,
              _searchTextField,
            ],
          ),
          iconTheme: const IconThemeData(
            color: CupertinoColors.activeBlue,
          )),
      floatingActionButton: _sendButton,
      body: _listViewB,
    );
  }

  Widget get _emptyWidht => const SizedBox(
        width: 20,
      );

  Widget get _searchTextField => Container(
        alignment: Alignment.centerRight,
        width: 250,
        child: TextField(
            maxLines: 1,
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(0),
              hintText: "Search User",
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.grey,
              ),
              filled: true,
              focusedBorder: outlineInputBorder,
              border: outlineInputBorder,
            )),
      );

  OutlineInputBorder get outlineInputBorder =>
      OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.grey),
          borderRadius: BorderRadius.circular(25));
  Text _backtoHomeTitle() {
    return Text(
      "DM",
      style: _appbarTextStyle.copyWith(
          fontWeight: FontWeight.w600,
          color: CupertinoColors.activeBlue),
    );
  }

  Widget get _sendButton => FloatingActionButton(
      onPressed: () {},
      child: const Icon(Icons.send_outlined));

 
  Widget get _listViewB => ListView.builder(
        itemCount: 25,
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
                  ],
                ),
              ],
            )
          ],
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
}

const _appbarTextStyle = TextStyle(
    letterSpacing: 1,
    fontSize: 20,
    fontWeight: FontWeight.w400,
    color: Colors.black);
