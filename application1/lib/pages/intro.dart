import 'dart:async';
import 'dart:ui';
import 'package:application1/pages/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class intro extends StatefulWidget {
  const intro({Key? key}) : super(key: key);

  @override
  State<intro> createState() => _introState();
}


class _introState extends State<intro> {

  @override
  void initState() {

    super.initState();
    Timer(
        Duration(seconds: 4),
            ()=>Navigator.pushReplacement(context,
            MaterialPageRoute(builder:
                (context) =>
                Login()
            )
        )
    );
  }
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.lightBlue,

      body: AnnotatedRegion<SystemUiOverlayStyle>(

        value: SystemUiOverlayStyle.light,

        child: GestureDetector(
          child: Stack(

            children: <Widget>[
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Color(0x668AB6F9),
                          Color(0x99C13979),
                          Color(0xcc5C2C90),
                          Color(0xff2A2E74),
                        ]
                    )
                ),
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 80
                  ),
                  child: Column(
                    children: <Widget>[
                      Center(child: Image.asset('assets/images/7.png', height: 300,width: 300,)),
                      SizedBox(height: 60),
                      Text(
                        'Store Sales',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height:50,
                               ),
                         CircularProgressIndicator(
                            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                     ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
