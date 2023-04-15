import 'main.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';



class homepage extends StatefulWidget {
  const homepage({Key? key}) : super(key: key);

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  SharedPreferences? loginData;
  String? userName;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initial();
  }

  void initial() async {
    loginData = await SharedPreferences.getInstance();
    setState(() {
      userName = loginData!.getString('username');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green.shade800,
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.menu),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 35
                         , backgroundImage: NetworkImage('https://th.bing.com/th/id/R.5a480652b93233346d5940345fab9790?rik=hJ1CAPU2uLA2SA&riu=http%3a%2f%2f1.bp.blogspot.com%2f-FnFtfwmfNAM%2fVZgSzOagCgI%2fAAAAAAAAA5c%2fsmfXuf2jioY%2fs1600%2fCute-Baby-Girl-Wallpapers-36.jpg&ehk=nlT4%2fi8YzoUypQnexHXKL6DxwSKyY9sg2id%2b0lBYud8%3d&risl=&pid=ImgRaw&r=0'),
                        ),
                        IconButton(
                          icon: Icon(Icons.logout_rounded),
                          color: Colors.white,
                          onPressed: () {

                            loginData!.setBool('login', true);
                            Navigator.pushReplacement(context,
                                new MaterialPageRoute(builder: (context) => Home()));
                          },
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Text('Hi   $userName',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),
                SizedBox(width: 10.0),
                Text('',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontSize: 25.0))
              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery.of(context).size.height - 190.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                SizedBox(height: 150,),



              ],
            ),
          )
        ],
      ),




     /* Padding(
        padding: const EdgeInsets.all(26.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Text(
                'WELCOME TO PROTO CODERS POINT  $userName',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                loginData!.setBool('login', true);
                Navigator.pushReplacement(context,
                    new MaterialPageRoute(builder: (context) => Home()));
              },
              child: Text('LogOut'),
            )
          ],
        ),
      ),*/
    );
  }
}

