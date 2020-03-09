import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server/gmail.dart';
import 'package:uis_walking_routes/CardItemModel.dart';
import 'package:uis_walking_routes/Map/utiles/utiles.dart';
import 'package:uis_walking_routes/home_page.dart';

class FeedBack extends StatefulWidget {
  final String title;

  FeedBack({Key key, this.title}) : super(key: key);
  @override
  _FeedBackState createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  int _radioValue1;
  static bool checkboxValue1 = false;
  static bool checkboxValue2 = false;
  static bool checkboxValue3 = false;
  static bool checkboxValue4 = false;
  static bool checkboxValue5 = false;
  static bool checkboxValue6 = false;
  static bool checkboxValue7 = false;
  static bool checkboxValue8 = false;
  static bool checkboxValue9 = false;
  static bool checkboxValue10 = false;
  static bool checkboxValue11 = false;
  List<bool> boolArray = [
    checkboxValue1,
    checkboxValue2,
    checkboxValue3,
    checkboxValue4,
    checkboxValue5,
    checkboxValue6,
    checkboxValue7,
    checkboxValue8,
    checkboxValue9,
    checkboxValue10,
    checkboxValue11
  ];
  final emailAddressController = TextEditingController();
  final routFeedController = TextEditingController();
  final appFeedController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String feedbackRoute;
  String feedbackApp;

///////////////////////////// Add Email credentials //////////////////////////////////////////////////
  String senderEmail = 'uiswalkingroutesapp@gmail.com';
  String password = 'walkingrourtes123!';
  String subjectEmail = "Walking routes application";
  String userName = "UIS Walking App";

  
String receiverEmailAddress="adant2@uis.edu";// Kindly remove this if you want to send email to feedback's email address
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  Widget wrapInExpanded(Widget child, int flex) {
    return Expanded(
      child: child,
      flex: flex,
    );
  }

  void sendingMail(String gender, String recipientEmail, String route,
      String feedbackRoute, String feedbackApp) async {
    final smtpServer = gmail(senderEmail, password);

    final message = Message()
      ..from = Address(senderEmail, '$userName')
      ..recipients.add('$receiverEmailAddress')// kindly replace 'receiverEmailAddress' with recipientEmail if you need to send email to specific id
      ..subject = '$subjectEmail'
      ..text = 'This is the plain text.\nThis is line 2 of the text part.'
      ..html =
          "<h1>Walking Routes App detail</h1>\n<h2>Gender</h2>\n<p>$gender</p>\n<h2>Routes detail </h2>\n<p>$route</p>\n<h2>Feedback about route</h2>\n<p>$feedbackRoute</p>\n<h2>Feedback about App</h2>\n<p>$feedbackApp</p>\n<h2>Receiver Email Address</h2>\n<p>$recipientEmail</p>";

    try {
      final sendReport = await send(message, smtpServer);
      print('Message sent: ' + sendReport.toString());
    } on MailerException catch (e) {
      print('Message not sent.');
      for (var p in e.problems) {
        print('Problem: ${p.code}: ${p.msg}');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomSheet: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          IconButton(
            icon: Icon(Icons.send),
            onPressed: () {
              if (_formKey.currentState.validate()) {
                if (gender == null) {
                  Fluttertoast.showToast(msg: "Please Select Gender");
                  return;
                } else if (feedbackString().isEmpty) {
                  Fluttertoast.showToast(
                      msg: "Please Select atleast one route");
                  return;
                }
                sendingMail(
                    gender,
                    emailAddressController.text.trim(),
                    feedbackString(),
                    routFeedController.text,
                    appFeedController.text);
                Fluttertoast.showToast(
                    msg: "feedback sent to the admin successfully");
              }
            },
          )
        ],
      ),
      appBar: AppBar(
        title: Align(alignment: Alignment.center, child: Text(widget.title)),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                if (_formKey.currentState.validate()) {
                  if (gender == null) {
                    Fluttertoast.showToast(msg: "Please Select Gender");
                    return;
                  } else if (feedbackString().isEmpty) {
                    Fluttertoast.showToast(
                        msg: "Please Select atleast one route");
                    return;
                  }
                  sendingMail(
                      gender,
                      emailAddressController.text.trim(),
                      feedbackString(),
                      routFeedController.text,
                      appFeedController.text);
                  Fluttertoast.showToast(
                      msg: "feedback sent to the admin successfully");
                }
              }),
        ],
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 50),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Gender",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    new Radio(
                      value: 0,
                      activeColor: Colors.red,
                      groupValue: _radioValue1,
                      onChanged: (int val) => _handleRadioValueChange1(val),
                    ),
                    new Text(
                      'Male',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                    Radio(
                      value: 1,
                      activeColor: Colors.red,
                      groupValue: _radioValue1,
                      onChanged: (int val) => _handleRadioValueChange1(val),
                    ),
                    new Text(
                      'Female',
                      style: new TextStyle(fontSize: 16.0),
                    ),
                  ],
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        controller: emailAddressController,
                        autofocus: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Enter Email Address';
                          } else if (!Utiles.isEmail(value)) {
                            return 'Enter valid Email Address';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Email Address',
                        ),
                      ),
                      TextFormField(
                        controller: routFeedController,
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        maxLength: 200,
                        autofocus: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Feedback about the route';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Feedback about the route',
                        ),
                      ),
                      TextFormField(
                        keyboardType: TextInputType.text,
                        maxLines: 1,
                        controller: appFeedController,
                        maxLength: 200,
                        autofocus: false,
                        validator: (value) {
                          if (value.isEmpty) {
                            return 'Feedback about the App';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          hintText: 'Enter Feedback about the App',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  "Select your desired route",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 20,
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[0].cardTitle),
                  value: boolArray[0],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[0] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[1].cardTitle),
                  value: boolArray[1],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[1] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[2].cardTitle),
                  value: boolArray[2],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[2] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[3].cardTitle),
                  value: boolArray[3],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[3] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[4].cardTitle),
                  value: boolArray[4],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[4] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[5].cardTitle),
                  value: boolArray[5],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[5] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[6].cardTitle),
                  value: boolArray[6],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[6] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[7].cardTitle),
                  value: boolArray[7],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[7] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[8].cardTitle),
                  value: boolArray[8],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[8] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[9].cardTitle),
                  value: boolArray[9],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[9] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
                CheckboxListTile(
                  title: Text(Utiles.cardsList[10].cardTitle),
                  value: boolArray[10],
                  activeColor: Colors.red,
                  onChanged: (newValue) {
                    setState(() {
                      boolArray[10] = newValue;
                    });
                  },
                  controlAffinity:
                      ListTileControlAffinity.leading, //  <-- leading Checkbox
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  String feedbackString() {
    String routeName = "";
    for (int i = 0; i < boolArray.length; i++) {
      if (boolArray[i] == true)
        setState(() {
          routeName = routeName + Utiles.cardsList[i].cardTitle + "    |    ";
        });
    }
    return routeName;
  }

  String gender;
  void _handleRadioValueChange1(int value) {
    setState(() {
      if (value == 0) {
        _radioValue1 = 0;
        gender = "Male";
      } else if (value == 1) {
        _radioValue1 = 1;
        gender = "Female";
      }
    });
  }
}
