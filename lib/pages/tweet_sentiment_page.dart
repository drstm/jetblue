import 'dart:async';
import 'dart:convert';
import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

Future<GetResponse> fetchGetResponse() async {
  final response =
      await http.get('https://jetblue-257201.appspot.com/jetblue');

  if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return GetResponse.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }
}

class TweetSentiment extends StatefulWidget{
  @override
  _TweetSentimentState createState() => _TweetSentimentState();
}

class _TweetSentimentState extends State<TweetSentiment>{
  Future<GetResponse> response;
  @override
  void initState(){
    super.initState();
    response = fetchGetResponse();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<GetResponse>(
            future: response,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Text(snapshot.data.finalScore.toString());
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              // By default, show a loading spinner.
              return CircularProgressIndicator();
            },
          ),
        ),
      ),
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