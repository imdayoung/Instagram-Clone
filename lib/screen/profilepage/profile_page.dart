import 'package:flutter/material.dart';
import 'package:instagram_cc/screen/profilepage/profile_edit_page.dart';
import 'dart:io';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  late TabController controller;

  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(height: 5.0),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(padding: EdgeInsets.only(left: 15.0)),
                  /*앱바 부분 아이디*/
                  Container(
                    width: 300.0,
                    child: Text(
                      userName,
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30.0),
                    ),
                  ),
                  /*앱바 만들기 버튼*/
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.0))),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 450.0,
                                child: DraggableScrollableSheet(
                                  initialChildSize: 1.0,
                                  maxChildSize: 1.0,
                                  minChildSize: 0.3,
                                  builder: (BuildContext context,
                                      ScrollController scrollController) {
                                    return Column(
                                      children: [
                                        SizedBox(height: 15.0),
                                        Text(
                                          '만들기',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontSize: 18.0,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        Divider(
                                          thickness: 1.0,
                                          height: 18.0,
                                        ),
                                        listMenu(Icons.settings_sharp, '게시물'),
                                        listMenu(
                                            Icons.smart_display_outlined, '릴스'),
                                        listMenu(
                                            Icons.motion_photos_on_outlined,
                                            '스토리'),
                                        listMenu(Icons.motion_photos_on,
                                            '스토리 하이라이트'),
                                        listMenu(Icons.sensors, '라이브 방송'),
                                        listMenu(
                                            Icons.menu_book_outlined, '가이드'),
                                      ],
                                    );
                                  },
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.add_box_outlined,
                        size: 30.0,
                      )),
                  /*앱바 설정 버튼*/
                  IconButton(
                      onPressed: () {
                        showModalBottomSheet(
                            isScrollControlled: true,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(16.0))),
                            context: context,
                            builder: (context) {
                              return Container(
                                height: 450.0,
                                child: DraggableScrollableSheet(
                                  initialChildSize: 1.0,
                                  maxChildSize: 1.0,
                                  minChildSize: 0.3,
                                  builder: (BuildContext context,
                                      ScrollController scrollController) {
                                    return Column(
                                      children: [
                                        listMenu(Icons.settings_sharp, '설정'),
                                        listMenu(Icons.history, '보관'),
                                        listMenu(
                                            Icons.history_toggle_off, '내 활동'),
                                        listMenu(Icons.qr_code_scanner_rounded,
                                            'QR 코드'),
                                        listMenu(Icons.bookmark_border_outlined,
                                            '저장됨'),
                                        listMenu(Icons.list, '친한 친구'),
                                        listMenu(Icons.favorite_outline,
                                            '코로나19 정보 센터'),
                                      ],
                                    );
                                  },
                                ),
                              );
                            });
                      },
                      icon: Icon(
                        Icons.menu,
                        size: 30.0,
                      )),
                ],
              ),
            ),
            SizedBox(height: 10.0),
            Container(
              height: 540.0,
              child: ListView(
                scrollDirection: Axis.vertical,
                children: [
                  /*내 프로필이랑 정보*/
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Row(
                      
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: globalProfileImage == null
                              ? Image.asset('image/apeach1.jpg',
                                  fit: BoxFit.cover, width: 100, height: 100)
                              : Image.file(File(globalProfileImage!.path),
                                  fit: BoxFit.cover, width: 100, height: 100),
                        ),
                        SizedBox(width: 40.0),
                        myInfo('6', '게시물'),
                        SizedBox(width: 40.0),
                        myInfo('152', '팔로워'),
                        SizedBox(width: 40.0),
                        myInfo('160', '팔로잉'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.0),
                  /*이름이랑 소개*/
                  Container(
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 20.0, right: 20.0)),
                        Text(
                          name,
                          style: TextStyle(
                              fontSize: 16.0, fontWeight: FontWeight.bold),
                        ),
                        Text(descript),
                        Text(website),
                      ],
                    ),
                  ),
                  /*프로필 편집 버튼이랑 더보기 버튼*/
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileEditPage()));
                          },
                          style: ElevatedButton.styleFrom(
                            primary: Colors.white,
                            elevation: 0.0,
                            minimumSize: Size(320, 32.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(6.0),
                            ),
                            side: BorderSide(color: Colors.grey),
                          ),
                          child: Text(
                            '프로필 편집',
                            style: TextStyle(color: Colors.black),
                          )),
                      SizedBox(width: 8.0),
                      ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          primary: Colors.white,
                          elevation: 0.0,
                          minimumSize: Size(20.0, 32.0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6.0),
                          ),
                          side: BorderSide(color: Colors.grey),
                        ),
                        child: Icon(
                          Icons.expand_more,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  /*스토리 하이라이트*/
                  Container(
                    height: 80.0,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        Padding(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0)),
                        highlightLine('apeach2.jpg', '2021'),
                        SizedBox(width: 20.0),
                        highlightLine('jordy1.jpg', '2020'),
                        SizedBox(width: 20.0),
                        highlightLine('angmond1.jpg', '2019'),
                        SizedBox(width: 20.0),
                        highlightLine('apeach3.jpg', '2018'),
                        SizedBox(width: 20.0),
                        highlightLine('jordy2.jpeg', '2017'),
                        SizedBox(width: 20.0),
                        highlightLine('apeach1.jpg', '2016'),
                        SizedBox(width: 20.0),
                        Column(
                          children: [
                            FloatingActionButton(
                              elevation: 0.0,
                              backgroundColor: Colors.grey[100],
                              child: Icon(Icons.add, color: Colors.black),
                              onPressed: () {},
                            ),
                            Text('새로 만들기')
                          ],
                        ),
                      ],
                    ),
                  ),
                  /*탭바로 내가 올린 게시글과 내가 태그된 게시글 나누기*/
                  DefaultTabController(
                      length: 2,
                      child: SizedBox(
                        height: 460.0,
                        child: Column(
                          children: [
                            TabBar(
                              indicatorColor: Colors.black,
                              labelColor: Colors.black,
                              unselectedLabelColor: Colors.grey,
                              tabs: [
                                Tab(icon: Icon(Icons.apps_outlined)),
                                Tab(icon: Icon(Icons.assignment_ind_outlined))
                              ],
                            ),
                            Expanded(
                              child: TabBarView(
                                children: [
                                  GridView.count(
                                    crossAxisCount: 3,
                                    children: [
                                      Image.asset('image/jordy3.jpg'),
                                      Image.asset('image/angmond2.jpg'),
                                      Image.asset('image/jordy3.jpg'),
                                      Image.asset('image/angmond2.jpg'),
                                      Image.asset('image/jordy3.jpg'),
                                      Image.asset('image/angmond2.jpg'),
                                      Image.asset('image/jordy3.jpg'),
                                      Image.asset('image/angmond2.jpg'),
                                      Image.asset('image/jordy3.jpg'),
                                    ],
                                  ),
                                  GridView.count(
                                    crossAxisCount: 3,
                                    children: [
                                      Image.asset('image/angmond2.jpg'),
                                      Image.asset('image/jordy3.jpg'),
                                      Image.asset('image/angmond2.jpg'),
                                      Image.asset('image/jordy3.jpg'),
                                      Image.asset('image/angmond2.jpg'),
                                      Image.asset('image/jordy3.jpg'),
                                      Image.asset('image/angmond2.jpg'),
                                      Image.asset('image/jordy3.jpg'),
                                      Image.asset('image/angmond2.jpg'),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/*아래에서부터 올라오는 메뉴 아이콘과 글*/
ListTile listMenu(icon, text) {
  return ListTile(leading: Icon(icon), title: Text(text));
}

/*스토리 하이라이트 사진과 텍스트*/
Column highlightLine(image, text) {
  return Column(
    children: [
      CircleAvatar(
        backgroundImage: AssetImage('image/$image'),
        radius: 30.0,
      ),
      Text(text)
    ],
  );
}

/*내 정보*/
Column myInfo(num, text) {
  
  return Column(
    children: [
      Text(
        num,
        style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
      ),
      Text(
        text,
        style: TextStyle(fontSize: 15.0),
      ),
    ],
  );
}
