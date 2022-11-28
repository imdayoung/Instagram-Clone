import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

PickedFile? _image;
var globalProfileImage = _image;

var name = '이다영';
var userName = '2da00_';
var website = '';
var descript = '';

final TextEditingController namecontroller = TextEditingController(text: '이다영');
final TextEditingController usernamecontroller =
    TextEditingController(text: '2da00_');
final TextEditingController websitecontroller = TextEditingController();
final TextEditingController descriptcontroller = TextEditingController();

class ProfileEditPage extends StatefulWidget {
  const ProfileEditPage({Key? key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  /*카메라로 사진을 찍는 함수*/
  Future<void> getImageFromCamera() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.camera);
    setState(() {
      _image = image;
    });
  }

  /*갤러리에 접근해서 사진을 고르는 함수*/
  Future<void> getImageFromGallery() async {
    var image =
        await ImagePicker.platform.pickImage(source: ImageSource.gallery);
    setState(() {
      _image = image;
    });
  }

  var change; //프로필의 변화가 있는 지 확인할 변수

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 5.0),
              Container(
                height: 40.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    /*앱바 취소 버튼*/
                    TextButton(
                        onPressed: () {
                          if (change == true) {
                            showDialog<String>(
                              context: context,
                              barrierDismissible: false,
                              builder: (BuildContext context) => AlertDialog(
                                title: Text('저장되지 않은 변경 내용',
                                    textAlign: TextAlign.center,
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold)),
                                content: Container(
                                  height: 152,
                                  child: Column(children: [
                                    Text('저장되지 않은 변경 내용이 있습니다.\n 취소하시겠어요?',
                                        textAlign: TextAlign.center),
                                    SizedBox(height: 10),
                                    Divider(
                                      height: 0,
                                      thickness: 1.5,
                                      color: Colors.grey[300],
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          change = false;
                                          Navigator.pop(context);
                                          Navigator.pop(context);
                                        },
                                        child: Text('예',
                                            style:
                                                TextStyle(color: Colors.blue)),
                                        style: TextButton.styleFrom(
                                            minimumSize: Size(2, 2))),
                                    Divider(
                                      height: 0,
                                      thickness: 1.5,
                                      color: Colors.grey[300],
                                    ),
                                    TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: Text('아니요',
                                            style:
                                                TextStyle(color: Colors.black)))
                                  ]),
                                ),
                              ),
                            );
                          } else {
                            Navigator.pop(context);
                          }
                        },
                        child: Text(
                          '취소',
                          style: TextStyle(color: Colors.black, fontSize: 17.0),
                        )),
                    SizedBox(width: 100.0),
                    /*앱바 부분 타이틀*/
                    Text(
                      '프로필 편집',
                      style: TextStyle(
                          fontSize: 17.0, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(width: 100.0),
                    /*앱바 확인 버튼*/
                    TextButton(
                        onPressed: () {
                          setState(() {
                            name = namecontroller.text;
                            userName = usernamecontroller.text;
                            website = websitecontroller.text;
                            descript = descriptcontroller.text;
                            globalProfileImage = _image;
                          });
                          Navigator.pop(context);
                        },
                        child: Text(
                          '완료',
                          style: TextStyle(
                              fontSize: 17.0, fontWeight: FontWeight.bold),
                        )),
                  ],
                ),
              ),
              Divider(
                color: Colors.grey[400],
                thickness: 0.5,
              ),
              Container(
                child: Column(
                  children: [
                    SizedBox(height: 10.0),
                    /*현재 내 프로필 사진*/
                    ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: _image == null
                          ? Image.asset('image/apeach1.jpg',
                              fit: BoxFit.cover, width: 100, height: 100)
                          : Image.file(File(_image!.path),
                              fit: BoxFit.cover, width: 100, height: 100),
                    ),
                    /*어떤 방식으로 프로필 사진을 변경할 지 선택*/
                    TextButton(
                        onPressed: () {
                          showModalBottomSheet(
                              isScrollControlled: true,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.vertical(
                                      top: Radius.circular(16.0))),
                              context: context,
                              builder: (context) {
                                return Container(
                                  height: 336.0,
                                  child: DraggableScrollableSheet(
                                    initialChildSize: 1.0,
                                    maxChildSize: 1.0,
                                    minChildSize: 0.3,
                                    builder: (BuildContext context,
                                        ScrollController scrollController) {
                                      return Column(
                                        children: [
                                          ListTile(
                                            title: Text(
                                              '프로필 사진 바꾸기',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                          Divider(
                                            color: Colors.grey[400],
                                            thickness: 0.5,
                                            height: 0.0,
                                          ),
                                          ListTile(
                                            title: Text('현재 사진 삭제',
                                                textAlign: TextAlign.center),
                                            onTap: () {},
                                          ),
                                          Divider(
                                            color: Colors.grey[400],
                                            thickness: 0.5,
                                            height: 0.0,
                                          ),
                                          ListTile(
                                            title: Text('Facebook에서 가져오기',
                                                textAlign: TextAlign.center),
                                            onTap: () {},
                                          ),
                                          Divider(
                                            color: Colors.grey[400],
                                            thickness: 0.5,
                                            height: 0.0,
                                          ),
                                          ListTile(
                                            title: Text('사진 찍기',
                                                textAlign: TextAlign.center),
                                            onTap: getImageFromCamera,
                                          ),
                                          Divider(
                                            color: Colors.grey[400],
                                            thickness: 0.5,
                                            height: 0.0,
                                          ),
                                          ListTile(
                                            title: Text('라이브러리에서 선택',
                                                textAlign: TextAlign.center),
                                            onTap: getImageFromGallery,
                                          ),
                                          Divider(
                                            color: Colors.grey[400],
                                            thickness: 0.5,
                                            height: 0.0,
                                          ),
                                          ListTile(
                                            title: Text(
                                              '취소',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 14.0,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            onTap: () {},
                                          ),
                                        ],
                                      );
                                    },
                                  ),
                                );
                              });
                        },
                        child: Text(
                          '프로필 사진 바꾸기',
                          style: TextStyle(
                              fontSize: 15.0, fontWeight: FontWeight.bold),
                        )),
                    profileTextField(
                        context: context,
                        property: '이름',
                        controller: namecontroller,
                        tap: 'name'),
                    profileTextField(
                        context: context,
                        property: '사용자 이름',
                        controller: usernamecontroller,
                        tap: 'username'),
                    profileTextField(
                        context: context,
                        property: '웹사이트',
                        controller: websitecontroller),
                    profileTextField(
                        context: context,
                        property: '소개',
                        controller: descriptcontroller,
                        tap: 'descript'),
                    profileButton(context, '프로페셔널 계정으로 전환'),
                    profileButton(context, '개인정보 설정'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /*프로필 편집 하단 버튼*/
  Container profileButton(BuildContext context, String name) {
    return Container(
      child: Row(
        children: [
          SizedBox(width: 10.0),
          TextButton(
              onPressed: () {},
              child: Text(
                name,
                style: TextStyle(color: Colors.blue),
              ))
        ],
      ),
    );
  }

  /*프로필 텍스트 필드*/
  Container profileTextField(
      {@required required BuildContext context,
      @required required String property,
      @required required controller,
      String? tap}) {
    return Container(
      width: ((MediaQuery.of(context).size.width) * 0.9),
      height: 60,
      child: TextField(
        onTap: () {
          if (tap == name) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => NameEditPage()));
          } else if (tap == userName) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => UsernameEditPage()));
          } else if (tap == descript) {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => DescriptEditPage()));
          }
        },
        onChanged: (text) {
          change = true;
        },
        controller: controller,
        style: TextStyle(fontSize: 15),
        keyboardType: TextInputType.name,
        decoration: InputDecoration(
            labelText: property,
            labelStyle: TextStyle(color: Colors.grey),
            floatingLabelBehavior: FloatingLabelBehavior.auto,
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: Colors.grey))),
      ),
    );
  }
}

/*이름 편집 페이지*/
class NameEditPage extends StatefulWidget {
  const NameEditPage({Key? key}) : super(key: key);

  @override
  _NameEditPageState createState() => _NameEditPageState();
}

class _NameEditPageState extends State<NameEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.clear, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, size: 40, color: Colors.blue[700]),
            onPressed: () {
              setState(() {});
            },
          ),
          SizedBox(width: 10)
        ],
        title: Text('이름'),
      ),
      body: Column(
        children: [
          TextField(
            decoration: InputDecoration(
              labelText: '이름',
              border: UnderlineInputBorder(
                  borderSide: BorderSide(
                color: Colors.blue,
              )),
            ),
            controller: namecontroller,
          ),
        ],
      ),
    );
  }
}

/*사용자 이름 편집 페이지*/
class UsernameEditPage extends StatefulWidget {
  const UsernameEditPage({Key? key}) : super(key: key);

  @override
  _UsernameEditPageState createState() => _UsernameEditPageState();
}

class _UsernameEditPageState extends State<UsernameEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.clear, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, size: 40, color: Colors.blue[700]),
            onPressed: () {
              setState(() {});
            },
          ),
          SizedBox(width: 10)
        ],
        title: Text('사용자 이름'),
      ),
      body: TextField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
          )),
        ),
        controller: usernamecontroller,
      ),
    );
  }
}

/*소개 편집 페이지*/
class DescriptEditPage extends StatefulWidget {
  const DescriptEditPage({Key? key}) : super(key: key);

  @override
  _DescriptEditPageState createState() => _DescriptEditPageState();
}

class _DescriptEditPageState extends State<DescriptEditPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        leading: IconButton(
          icon: Icon(Icons.clear, size: 40),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.check, size: 40, color: Colors.blue[700]),
            onPressed: () {
              setState(() {});
            },
          ),
          SizedBox(width: 10)
        ],
        title: Text('소개'),
      ),
      body: TextField(
        decoration: InputDecoration(
          border: UnderlineInputBorder(
              borderSide: BorderSide(
            color: Colors.blue,
          )),
        ),
        controller: descriptcontroller,
      ),
    );
  }
}
