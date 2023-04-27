import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'Home.dart';
import 'login.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  void initState() {
    super.initState();
  }

  final _formkey = GlobalKey<FormState>();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _phonecontroller = TextEditingController();
  TextEditingController _passwordcontroller = TextEditingController();

  @override
  void dispose() {
    _namecontroller.dispose();
    _emailcontroller.dispose();
    _phonecontroller.dispose();
    _passwordcontroller.dispose();

    super.dispose();
  }

  var name, email, phone, password;

  Widget buildName() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Name',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _namecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.person,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Your Name',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildEmail() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Email',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _emailcontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.emailAddress,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.email,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Email',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildPhone() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Phone Number',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _phonecontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            autofocus: true,
            keyboardType: TextInputType.phone,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.phone_android,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Your Phone Number',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }

  Widget buildPassword() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          'Password',
          style: TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 10),
        Container(
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                    color: Colors.black26, blurRadius: 6, offset: Offset(0, 2))
              ]),
          height: 60,
          child: TextFormField(
            controller: _passwordcontroller,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
              }
              return null;
            },
            obscureText: true,
            style: TextStyle(color: Colors.black87),
            decoration: InputDecoration(
                border: InputBorder.none,
                contentPadding: EdgeInsets.only(top: 14),
                prefixIcon: Icon(
                  Icons.lock,
                  color: Color(0xff145DA0),
                ),
                hintText: 'Password',
                hintStyle: TextStyle(
                  color: Colors.black38,
                )),
          ),
        )
      ],
    );
  }


  Widget buildregesterBtn(context) {
    return Container(
      alignment: Alignment.center,
      child: ElevatedButton(
        onPressed: () async {
          try {
            if (_formkey.currentState!.validate()) {
              UserCredential userCredential =
                  await FirebaseAuth.instance.createUserWithEmailAndPassword(
                email: _emailcontroller.text,
                password: _passwordcontroller.text,
              );

              Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                return Home();
              }));
            } else {
              return;
            }
          } on FirebaseAuthException catch (e) {
            if (e.code == 'weak-password') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('this password is too weak')),
              );
            } if (e.code == 'email-already-in-use') {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('this email already exist')),
              );
            }
          } catch (e) {
            print(e);
            print("done");
          }
        },
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(Colors.white),
          padding: MaterialStateProperty.all(
              EdgeInsets.symmetric(horizontal: 50, vertical: 10)),
          shape: MaterialStateProperty.all(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(27))),
        ),
        child: Text(
          'Sign Up',
          style: TextStyle(
            color: Colors.blue[900],
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
  Widget buildloginBtn(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,  children: [
      Text("If you have an account ?? ",style: TextStyle ( fontSize: 18,color: Colors.white,)),
      GestureDetector(
          onTap: (){Navigator.pushNamed(context, "/login");},
          child: Text(" Login", style:TextStyle(
            color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,

          )
            ,)),  ],);
  }

  Widget buildText(){
    return Row(
      children: [
        Expanded(
          child:
            Divider(
              height: 9,
              thickness: 2,
              color: Colors.white,
            ),
        ),Text(
          " OR ",
          style: TextStyle(
              fontSize:25,
              color: Colors.white,
              fontWeight: FontWeight.bold,
          ),
        ),
        Expanded(
          child:
          Divider(
            height: 9,
            thickness: 2,
            color: Colors.white,
          ),
        ),
      ],


    );
  }
  Widget buildIcons(){
    return Container(
      margin: EdgeInsets.only(bottom: 44),
      child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
        children: [

      Container(
        padding: EdgeInsets.all(13),
        decoration: BoxDecoration(
            color: Color.fromARGB(255, 66, 113, 193),
            shape: BoxShape.circle,
            border: Border.all(color: Colors.blueAccent, width: 0 )
        ),
        child: SvgPicture.asset(
        "assets/icons/facebook.svg",
          color: Colors.white,
          height: 44,
        ),
      ),
          SizedBox(width: 22,),      Container(
        padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.red, width: 1 )
            ),        child: SvgPicture.asset(
        "assets/icons/google-plus.svg",
            color: Colors.white,
            height: 44,
          ),
          ),
          SizedBox(width: 22,),
          Container(
        padding: EdgeInsets.all(13),
            decoration: BoxDecoration(
              color: Colors.lightBlue,
          shape: BoxShape.circle,
                border: Border.all(color: Colors.blue, width: 1 )
      ),        child: SvgPicture.asset(
        "assets/icons/twitter.svg",
            color: Colors.white,
            height: 44,
          ),
          ),
        ],
      ),
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: Center(
          child: GestureDetector(
        child: Stack(
          children: <Widget>[
            Center(child: Image.asset(
               'assets/images/7.png',
              height: 200,
              width: 200,
            )),
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
                  ])),
              child: Form(
                key: _formkey,
                child: SingleChildScrollView(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  child: Column(
                    children: <Widget>[
                      SizedBox(height: 1),
                      const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 40,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 5),
                      buildName(),
                      SizedBox(height: 5),
                      buildPhone(),
                      SizedBox(height: 5),
                      buildEmail(),
                      SizedBox(height: 5),
                      buildPassword(),
                      SizedBox(height:20),
                      buildregesterBtn(context),
                      SizedBox(height: 5,),
                      buildloginBtn(context),
                      SizedBox(height: 5),
                      buildText(),
                      SizedBox(height: 15),
                      buildIcons()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
