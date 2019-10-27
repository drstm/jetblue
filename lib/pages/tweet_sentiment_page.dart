import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;

class TweetSentiment extends StatefulWidget{
  @override
  _TweetSentimentState createState() => _TweetSentimentState();
}

class _TweetSentimentState extends State<TweetSentiment>{
  Future<GetResponse> response;
  List<Tweets> tweetList;
  double finalScore;
  bool isData = false;
  void fetchGetResponse() async {
  final response =
      await http.get('https://jetblue-257201.appspot.com/jetblue');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    GetResponse requestResponse = GetResponse.fromJson(json.decode(response.body));
    tweetList = requestResponse.tweetList;
    finalScore = requestResponse.finalScore;
    isData=true;
    setState(() {
      print('Data fetched from server');
    }); 
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}
  @override
  void initState(){
    super.initState();
    fetchGetResponse();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'User Satisfaction Score',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(90),
          child: AppBar(
          elevation: 2.0,
          backgroundColor: Colors.blue[900],
          title: Text('User Satisfaction Score',style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 25.0, fontFamily: 'Hack')),
        )),
        body: !isData ? new Center(
                child: new CircularProgressIndicator(),
              ): StaggeredGridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 12.0,
          mainAxisSpacing: 12.0,
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          children: <Widget>[
            _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text('Current Satisfaction Score', style: TextStyle(color: Colors.blueGrey[900])),
                      Text(finalScore.toString(), style: TextStyle(color: Colors.yellow[900], fontWeight: FontWeight.w700, fontSize: 34.0))
                    ],
                  )
                ]
              ),
            ),
          ),
          _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text(tweetList[0].tweet, style: TextStyle(color: Colors.blueGrey[900])),
                      Text(tweetList[0].sentiment.toString(), style: TextStyle(color: Colors.yellow[900], fontWeight: FontWeight.w700, fontSize: 15.0))
                    ],
                  )
                ]
              ),
            ),
          ),
          _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text(tweetList[5].tweet, style: TextStyle(color: Colors.blueGrey[900])),
                      Text(tweetList[5].sentiment.toString(), style: TextStyle(color: Colors.yellow[900], fontWeight: FontWeight.w700, fontSize: 15.0))
                    ],
                  )
                ]
              ),
            ),
          ),
          _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text(tweetList[9].tweet, style: TextStyle(color: Colors.blueGrey[900])),
                      Text(tweetList[9].sentiment.toString(), style: TextStyle(color: Colors.yellow[900], fontWeight: FontWeight.w700, fontSize: 15.0))
                    ],
                  )
                ]
              ),
            ),
          ),
          _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text(tweetList[7].tweet, style: TextStyle(color: Colors.blueGrey[900])),
                      Text(tweetList[7].sentiment.toString(), style: TextStyle(color: Colors.yellow[900], fontWeight: FontWeight.w700, fontSize: 15.0))
                    ],
                  )
                ]
              ),
            ),
          ),
          _buildTile(
            Padding
            (
              padding: const EdgeInsets.all(24.0),
              child: Row
              (
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>
                [
                  Column
                  (
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>
                    [
                      Text(tweetList[8].tweet, style: TextStyle(color: Colors.blueGrey[900])),
                      Text(tweetList[8].sentiment.toString(), style: TextStyle(color: Colors.yellow[900], fontWeight: FontWeight.w700, fontSize: 15.0))
                    ],
                  )
                ]
              ),
            ),
          )],
          staggeredTiles: [
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0),
          StaggeredTile.extent(2, 110.0)
        ]
        ),
      ),
    );
  }
  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
      elevation: 14.0,
      borderRadius: BorderRadius.circular(12.0),
      shadowColor: Color(0x802196F3),
      color: Colors.white,
      child: InkWell
      (
        // Do onTap() if it isn't null, otherwise do print()
        onTap: onTap != null ? () => onTap() : () { print('Not set yet'); },
        child: child
      )
    );
  }
}

class Tweets{
  final double sentiment;
  final String tweet;

  Tweets({this.sentiment, this.tweet});
  factory Tweets.fromJson(Map<String, dynamic> json){
    return Tweets(
      sentiment: json['score'],
      tweet: json['tweet']
      );
  } 
}

class GetResponse{
  final double finalScore;
  final List<Tweets> tweetList;

  GetResponse({this.finalScore,this.tweetList});
  factory GetResponse.fromJson(Map<String,dynamic> json){
    var list =  json['data'] as List;
    List<Tweets> tweetData = list.map((i)=>Tweets.fromJson(i)).toList();
    return GetResponse(
      finalScore: json['finalScore'],
      tweetList: tweetData
      );
  }
}