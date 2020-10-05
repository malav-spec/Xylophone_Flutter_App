
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:async';
//import 'package:step_progress_indicator/step_progress_indicator.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    precacheImage( AssetImage('images/tab_image.png'),context);

    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFFB01810),
        scaffoldBackgroundColor: Colors.white,
      ),
      home: ContentPage(),
    );
  }
}

class ContentPage extends StatefulWidget {


  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<ContentPage> {

  Future<void> _launchInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header-key': 'my_header_val'},
      );
    } else {
      throw 'Could not launch $url';
    }
  }

  Padding createButton(String func, String text){

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ButtonTheme(
        buttonColor: Color(0xFFB01810),
        minWidth: 200,
        child: RaisedButton(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: new BorderRadius.circular(18),
              side: BorderSide(color: Colors.black)),
          onPressed: () {
            setState(() {
              String url = '$func';
              _launchInBrowser(url);
            });
          },
          child: Text(
            '$text',
            style: TextStyle(
                fontFamily: 'Lato', fontSize: 18, color: Colors.white),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    precacheImage( AssetImage('images/tab_image.png'),context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Align(
            alignment: Alignment.center,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 98,
                  ),

                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image(
                      image: AssetImage('images/Vuecam Logo[2686].png'),
                    ),
                  ),
                  SizedBox(
                    child: Divider(
                      color: Colors.black54,
                    ),
                    width: 300,
                    height: 20,
                  ),

                  createButton('https://vuecam.in/', 'Home'),

                  createButton('https://connect.beta_vuecam.in/', 'Sign in'),

                  createButton('https://beta_vuecam.in/', 'Sign up'),

                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      buttonColor: Color(0xFFB01810),
                      minWidth: 200,
                      child: RaisedButton(
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(18),
                            side: BorderSide(color: Colors.black)),
                        onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ContactUS()));
                        },
                        child: Text(
                          'Contact Us',
                          style: TextStyle(
                              fontFamily: 'Lato', fontSize: 17, color: Colors.white),
                        ),
                      ),
                    ),
                  ),

                  SizedBox(
                    height: 80,
                  ),
                  Image.asset(
                    'images/tab_image.png',
                    alignment: Alignment.bottomCenter,
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ContactUS extends StatefulWidget {
  static const String routeName = "/ContactUS";

  @override
  _ContactUSState createState() => _ContactUSState();
}

class _ContactUSState extends State<ContactUS> {
  Future<void> _makePhoneCall(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not call $url';
    }
  }

  void showNoMailAppsDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Open Mail'),
          content: Text('No mail app found'),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }

  void sendMail(String email) async {
    var url = "mailto: $email";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not send mail';
    }
  }

  void _launchMapsUrl(double lat, double lon) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lon';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Row createCallButton(String number){
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Icon(Icons.phone,
          color: Color(0xFFB01810),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ButtonTheme(
            minWidth: 200,
            buttonColor: Color(0xFFB01810),
            child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18),
                    side: BorderSide(color: Colors.black)),
                child: Text(
                  '$number',
                  style: TextStyle(fontSize: 17, color: Colors.white),
                ),
                onPressed: () {
                  setState(() {
                    _makePhoneCall('tel:$number');
                  });
                }),
          ),
        ),
      ],
    );
  }

  TextEditingController controllerEmail = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Contact Us',
          style: TextStyle(color: Color(0xFFB01810), fontSize: 25),
        ),
        iconTheme: new IconThemeData(color: Color(0xFFB01810), size: 25),
        backgroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Card(
                  elevation: 0,
                  color: Colors.white,
                  child: ListTile(
                    title: Text(
                      '" We are always here to help you. Feel free to contact us anytime "',
                      style: TextStyle(
                          fontFamily: 'Katibeh',
                          fontSize: 40,
                          color: Colors.black),
                    ),
                  ),
                ),
              ),

              createCallButton('+91 7949037000'),

              createCallButton('+91 9601430845'),

              createCallButton('+91 9819662449'),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.email,
                    color: Color(0xFFB01810),
                    size: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonTheme(
                      minWidth: 200,
                      buttonColor: Color(0xFFB01810),
                      child: RaisedButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(18),
                              side: BorderSide(color: Colors.black)),
                          child: Text(
                            'enquiry@yellowspree.in',
                            style: TextStyle(fontSize: 17, color: Colors.white),
                          ),
                          onPressed: () {
                            sendMail('enquiry@yellowspree.in');
                          }),
                    ),
                  ),
                ],
              ),
              Row(

                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on,
                    color: Color(0xFFB01810),
                    size: 30,
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ButtonTheme(
                        minWidth: 200,
                        height: 50,
                        buttonColor: Color(0xFFB01810),
                        child: RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: new BorderRadius.circular(18),
                                side: BorderSide(color: Colors.black)),
                            child: Text(
                              'YellowSpree Technologies LLP. , 203 Binori Ambit, Thaltej, Ahmedabad- 380069', overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 13, color: Colors.white),
                            ),
                            onPressed: () {
                              _launchMapsUrl(23.0534571, 72.5178788);
                            }),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
