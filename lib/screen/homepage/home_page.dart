import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5.0),
            Container( //앱바 부분
              child: Row(
                children: [
                  Padding(padding: EdgeInsets.only(left: 10.0)),
                  Image.asset(
                    'image/instagram_logo.png',
                    height: 40.0,
                  ),
                  SizedBox(width: 135.0),
                  appbarAction(Icons.add_box_outlined),
                  appbarAction(Icons.favorite_border_rounded),
                  appbarAction(Icons.flight_takeoff),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container( //스토리 부분
              height: 90.0,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Padding(padding: EdgeInsets.fromLTRB(15.0, 0.0, 0.0, 0.0)),
                  storyCircle('apeach1.jpg'),
                  SizedBox(width: 15.0),
                  storyCircle('jordy1.jpg'),
                  SizedBox(width: 15.0),
                  storyCircle('ryan1.jpg'),
                  SizedBox(width: 15.0),
                  storyCircle('apeach2.jpg'),
                  SizedBox(width: 15.0),
                  storyCircle('jordy2.jpeg'),
                  SizedBox(width: 15.0),
                  storyCircle('angmond1.jpg'),
                  SizedBox(width: 15.0),
                  storyCircle('apeach3.jpg'),
                ],
              ),
            ),
            Divider(
              thickness: 0.8,
              color: Colors.grey,
            ),
            Container( //피드 부분
              height: 434.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  homeFeed('jordy1.jpg', 'apeach_pineapple.jpg'),
                  SizedBox(height: 10.0),
                  homeFeed('angmond1.jpg', 'apeach_grape.jpg'),
                  SizedBox(height: 10.0),
                  homeFeed('jordy2.jpeg', 'apeach_apple.jpg'),
                  SizedBox(height: 10.0),
                  homeFeed('apeach2.jpg', 'apeach_cherry.jpg'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

IconButton appbarAction(icon) { //앱바 부분 아이콘
  return IconButton(
    onPressed: () {},
    icon: Icon(icon, size: 30.0),
  );
}

Column storyCircle(image) { //스토리 사진
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('image/$image'),
        radius: 30.0,
      ),
      SizedBox(height: 5.0),
      Text('2da00_'),
    ],
  );
}

Container homeFeed(pimage, fimage) { //피드 정보
  return Container(
    height: 580.0,
    child: Column(
      children: [
        Row(
          children: [
            Padding(padding: EdgeInsets.all(5.0)),
            CircleAvatar(
              backgroundImage: AssetImage('image/$pimage'),
            ),
            SizedBox(width: 10.0),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('2da00_',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    textAlign: TextAlign.start),
                Text('Fairfield by Marriot Busan Songdo Beach'),
              ],
            ),
            SizedBox(width: 50.0),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.more_horiz),
            )
          ],
        ),
        SizedBox(height: 5.0),
        Image.asset('image/$fimage'),
        SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.favorite_outline,
              size: 35.0,
            ),
            SizedBox(width: 20.0),
            Icon(
              Icons.chat_bubble_outline,
              size: 35.0,
            ),
            SizedBox(width: 20.0),
            Icon(
              Icons.flight_takeoff,
              size: 35.0,
            ),
            SizedBox(width: 200.0),
            Icon(
              Icons.bookmark_border,
              size: 35.0,
            ),
          ],
        ),
        SizedBox(height: 10.0),
        Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  SizedBox(width: 20.0),
                  Text(
                    '2da00_',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text('내 게시물')
                ],
              ),
              Row(
                children: [
                  SizedBox(width: 20.0),
                  Text(
                    '댓글 달기',
                    textAlign: TextAlign.start,
                  )
                ],
              ),
            ],
          ),
        )
      ],
    ),
  );
}
