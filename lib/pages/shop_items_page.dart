import 'package:flutter/material.dart';
import 'item_reviews_page.dart';

class ShopItemsPage extends StatefulWidget
{
  @override
  _ShopItemsPageState createState() => _ShopItemsPageState();
}

class _ShopItemsPageState extends State<ShopItemsPage>
{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold
    (
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar
        (
          elevation: 0.0,
          backgroundColor: Colors.blue[900],
          leading: IconButton
          (
            color: Colors.black,
            onPressed: () => Navigator.of(context).pop(),
            icon: Icon(Icons.arrow_back, color: Colors.white),
          ),
          title: Text('Urgent Messages', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontFamily: 'Hack')),
        ),
      ),
      body: ListView
      (
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        children: <Widget>
        [
          BadShopItem(),
          BadShopItem(),
          BadShopItem()
        ],
      )
    );
  }
}

class BadShopItem extends StatelessWidget
{
  static List<String> names = ['Projjol Banerji', 'Sandra Flechas', 'Manuel Lombardero'];
  static List<String> tweets = ['Reallyy sadd ... #jetbluesucks', 'Stuck at the airport! @jetBlue', 'Pathetic service by @jetBlue'];
  static List<String> ratings = ['1.4', '1.7', '2.2'];
  static List<String> response = ["We're really sorry for this and are trying to fix it", "We're sorry you had this experience!", "Please let us try to make this better for you!"];
  var randomName = (names..shuffle()).first;
  var randomTweet = (tweets..shuffle()).first;
  var randomRatings = (ratings..shuffle()).first;
  var randomResponse = (response..shuffle()).first;

  @override
  Widget build(BuildContext context)
  {
    return Padding
    (
      padding: EdgeInsets.only(bottom: 16.0),
      child: Stack
      (
        children: <Widget>
        [
          /// Item card
          Align
          (
            alignment: Alignment.topCenter,
            child: SizedBox.fromSize
            (
              size: Size.fromHeight(172.0),
              child: Stack
              (
                fit: StackFit.expand,
                children: <Widget>
                [
                  /// Item description inside a material
                  Container
                  (
                    margin: EdgeInsets.only(top: 24.0),
                    child: Material
                    (
                      elevation: 2.0,
                      borderRadius: BorderRadius.circular(12.0),

                      color: Colors.lightBlue[300],
                      child: Container
                      ( 
                        // decoration: BoxDecoration
                        // (
                        //   gradient: LinearGradient
                        //   (
                        //     colors: [ Color(0xFFDA4453), Color(0xFF89216B) ]
                        //   )
                        // ),
                        child: Padding
                        (
                          padding: EdgeInsets.all(24.0),
                          child: Column
                          (
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>
                            [
                              /// Title and rating
                              Column
                              (
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>
                                [
                                  Text(randomName, style: TextStyle(color: Colors.white)),
                                  Row
                                  (
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: <Widget>
                                    [
                                      Text(randomRatings, style: TextStyle(color: Colors.amber, fontWeight: FontWeight.w700, fontSize: 34.0)),
                                      Icon(Icons.star, color: Colors.amber, size: 24.0),
                                    ],
                                  ),
                                ],
                              ),
                              /// Infos
                              Row
                              (
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>
                                [
                                  Text(randomTweet, style: TextStyle(color: Colors.white)),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  /// Item image
                  Align
                  (
                    alignment: Alignment.topRight,
                    child: Padding
                    (
                      padding: EdgeInsets.only(right: 16.0),
                      child: SizedBox.fromSize
                      (
                        size: Size.fromRadius(54.0),
                        child: Material
                        (
                          elevation: 20.0,
                          shadowColor: Color(0x802196F3),
                          shape: CircleBorder(),
                          child: Image.asset('res/profile.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              )
            ),
          ),
          /// Review
          Padding
          (
            padding: EdgeInsets.only(top: 160.0, right: 32.0,),
            child: Material
            (
              elevation: 12.0,
              color: Colors.white,
              borderRadius: BorderRadius.only
              (
                topRight: Radius.circular(20.0),
                bottomLeft: Radius.circular(20.0),
                bottomRight: Radius.circular(20.0),
              ),
              child: Container
              (
                margin: EdgeInsets.symmetric(vertical: 4.0),
                child: ListTile
                (
                  leading: CircleAvatar
                  (
                    backgroundColor: Colors.purple,
                    child: Text('AI'),
                  ),
                  title: Text('Auto Reply'),
                  subtitle: Text(randomResponse, maxLines: 2, overflow: TextOverflow.ellipsis),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}