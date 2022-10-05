import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweetPage extends StatefulWidget {
  const TweetPage({Key? key}) : super(key: key);

  @override
  State<TweetPage> createState() => _TweetPageState();
}

class _TweetPageState extends State<TweetPage> {
  final String _profilePicUrl =
      "https://avatars.githubusercontent.com/u/48881290?v=4";


  final int _tweetMinLine = 5;
  final int _tweetMaxLine = 15;



  bool isHeaderClose = false;
  double lastOffset = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: _backtoHomeTitle(),
          iconTheme: const IconThemeData(
            color: CupertinoColors.activeBlue,
          )),
      body: _tweetCard,
    );
  }

  Text _backtoHomeTitle() {
    return Text(
      "Home",
      style: _titleTextStyle.copyWith(
          fontWeight: FontWeight.w600,
          color: CupertinoColors.activeBlue),
    );
  }

  Widget get _shareButton =>
      TextButton(onPressed: () {}, child: const Text("Tweet"));

  Widget get _tweetCard => SafeArea(
        child: Card(
          child: ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(_profilePicUrl),
            ),
            title: Wrap(
              runSpacing: 10,
              direction: Axis.horizontal,
              children: [
                _listCardTitle("Add Your Tweet "),
                _tweetPlace,
                _shareButtonRow()
              ],
            ),
          ),
        ),
      );

  Expanded _shareButtonRow() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _tweetShareWithPhoto,
          _tweetShareWithVideo,
          _tweetShareWithSound,
          _shareButton,
        ],
      ),
    );
  }

  Widget get _tweetPlace => TextField(
        decoration: const InputDecoration(
          hintText: "#What's happening?",
        ),
        maxLength: 120,
        minLines: _tweetMinLine,
        maxLines: _tweetMaxLine,
      );

  Widget _listCardTitle(String text) =>
      Text(text, style: _titleTextStyle);

  Widget get _tweetShareWithPhoto => ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.add_a_photo,
          color: CupertinoColors.activeBlue,
        ),
        label: const Text(
          "",
          style:
              TextStyle(color: CupertinoColors.activeBlue),
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0, primary: Colors.transparent),
      );

  Widget get _tweetShareWithVideo => ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.video_collection_sharp,
          color: CupertinoColors.activeBlue,
        ),
        label: const Text(
          "",
          style:
              TextStyle(color: CupertinoColors.activeBlue),
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0, primary: Colors.transparent),
      );

  Widget get _tweetShareWithSound => ElevatedButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.library_music,
          color: CupertinoColors.activeBlue,
        ),
        label: const Text(
          "",
          style:
              TextStyle(color: CupertinoColors.activeBlue),
        ),
        style: ElevatedButton.styleFrom(
            elevation: 0, primary: Colors.transparent),
      );

  final _titleTextStyle = const TextStyle(
      letterSpacing: 1,
      fontSize: 20,
      fontWeight: FontWeight.w400,
      color: Colors.black);
}
