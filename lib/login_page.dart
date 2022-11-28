import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:instagram_cc/tab_page.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  bool _isPasswordVisible = false;
  bool _isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(height: 120.0),
                  Center( //인스타그램 로고
                    child: Image.asset(
                      'image/instagram_logo.png',
                      width: 200.0,
                    ),
                  ),
                  SizedBox(height: 30.0),
                  Padding( //아이디랑 비밀번호 입력
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        TextFormField(
                            controller: controller1,
                            decoration: InputDecoration(
                                labelText: '전화번호, 사용자 이름 또는 이메일',
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey)))),
                        SizedBox(height: 20.0),
                        TextFormField(
                            controller: controller2,
                            obscureText: !_isPasswordVisible,
                            decoration: InputDecoration(
                                labelText: '비밀번호',
                                suffixIcon: IconButton(
                                  icon: Icon(_isPasswordVisible
                                      ? Icons.visibility
                                      : Icons.visibility_off),
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordVisible = !_isPasswordVisible;
                                    });
                                  },
                                ),
                                filled: true,
                                fillColor: Colors.grey[100],
                                border: OutlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.grey)))),
                      ],
                    ),
                  ),
                  Padding( //비밀번호 찾기 버튼
                    padding: EdgeInsets.only(right: 12.0),
                    child: Container(
                      alignment: Alignment.bottomRight,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          '비밀번호를 잊으셨나요?',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15.0),
                  Padding( //로그인 버튼
                    padding: EdgeInsets.only(left: 20.0, right: 20.0),
                    child: Column(
                      children: [
                        ElevatedButton(
                          child: Text(
                            '로그인',
                            style:
                                TextStyle(fontSize: 18.0, color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                              primary: Colors.blue[10],
                              elevation: 0.0,
                              minimumSize: Size(370.0, 50.0)),
                          onPressed: () {
                            if (controller1.text == 'username' &&
                                controller2.text == 'password') {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext) => TabPage()));
                            } else {
                              print('wrong');
                            }
                          },
                        ),
                        SizedBox(height: 20.0),
                        Divider(
                          color: Colors.grey,
                          height: 30.0,
                          thickness: 1.0,
                        ),
                        TextButton( //페이스북으로 로그인
                            onPressed: () async {
                              FacebookAuth.instance.login(permissions: [
                                "public_profile",
                                "email"
                              ]).then((value) {
                                FacebookAuth.instance
                                    .getUserData()
                                    .then((userData) {
                                  setState(() {
                                    _isLoggedIn = true;
                                  });
                                });
                              });
                              if (_isLoggedIn == true) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext) => TabPage()));
                              }
                            },
                            child: Text(
                              'Facebook으로 로그인',
                              style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold),
                            )),
                      ],
                    ),
                  ),
                  SizedBox(height: 40.0),
                  Divider(
                    color: Colors.grey,
                    height: 20.0,
                    thickness: 1.0,
                  ),
                  Row( //가입하기 부분
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('계정이 없으신가요?'),
                      TextButton(
                        child: Text(
                          '가입하기',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {},
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
