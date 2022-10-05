// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';
import 'package:twitter_clone/custom/refreshindicatorCustomizated.dart';
import 'package:twitter_clone/home/tweet_page.dart';
import 'package:twitter_clone/model/ttModel.dart';
import 'package:intl/intl.dart';

class SearchPage extends StatefulWidget {
  const SearchPage(this.scrollController);
  final ScrollController scrollController;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final double _padding = 20;

  late ttModel _trenstopics;
  bool isRefresh = false;

  @override
  void initState() {
    // ignore: todo
    // TODO: implement initState
    super.initState();
    _trenstopics = ttModel(
        hastag: "#Champions League",
        location: "Trending in Turkey",
        tweets: "35.2K Tweets");
  }

  Future tempFuture() async {
    setState(() {
      isRefresh = !isRefresh;
    });
    await Future.delayed(const Duration(milliseconds: 500));
    setState(() {
      isRefresh = !isRefresh;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            shareTweet();
          },
          child: const Icon(Icons.add)),
      body: RefreshIndicatorCustomizated(
        onRefresh: tempFuture,
        child: ListView(
          children: [
            _refreshWidget,
            _emptyWidht,
            _trendTitleWidget,
            _listViewSeperated,
          ],
        ),
      ),
    );
  }

  Widget get _refreshWidget {
    // ignore: no_leading_underscores_for_local_identifiers
    dynamic _currentTime =
        DateFormat.jm().format(DateTime.now());
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      height: isRefresh ? 60 : 30,
      child: isRefresh
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text("Last Update: $_currentTime"),
            ),
    );
  }

  Widget get _divider => const Divider(
        height: 0,
        color: Colors.grey,
      );

  Widget get _listViewSeperated => ListView.separated(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 5,
        separatorBuilder: (context, index) => _divider,
        itemBuilder: (context, index) => listcard(context),
      );

  Card listcard(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      shape: const RoundedRectangleBorder(
        side: BorderSide(style: BorderStyle.none),
      ),
      child: listpadding(context),
    );
  }

  Padding listpadding(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: _padding),
      child: row(context),
    );
  }

  Row row(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          spacing: 5,
          children: [
            Text(
              _trenstopics.location!,
              style: Theme.of(context).textTheme.caption,
            ),
            Text(
              _trenstopics.hastag!,
              style: Theme.of(context)
                  .textTheme
                  .headline5
                  ?.copyWith(fontSize: 15),
            ),
            Text(_trenstopics.tweets!,
                style: Theme.of(context).textTheme.button),
          ],
        )),
        const Icon(Icons.arrow_drop_down)
      ],
    );
  }

  Widget get _trendTitleWidget => Card(
        color: Theme.of(context).scaffoldBackgroundColor,
        margin: const EdgeInsets.all(0),
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0),
          side: const BorderSide(
              color: Colors.grey, width: 0.5),
        ),
        child: Container(
            padding:
                EdgeInsets.symmetric(horizontal: _padding),
            alignment: Alignment.centerLeft,
            height: 50,
            child: Text(
              "Trends For You",
              style: Theme.of(context).textTheme.headline5,
            )),
      );

  Widget get _emptyWidht => const SizedBox(
        height: 10,
      );

  void shareTweet() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const TweetPage(),
        ));
  }
}
