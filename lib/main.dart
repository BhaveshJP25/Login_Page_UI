import'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginPage(),
      theme:ThemeData(
        primarySwatch: Colors.orange
      )
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with SingleTickerProviderStateMixin{


  AnimationController _iconAnimationController;
  Animation<double> _iconAnimation;

  @override
  void initState(){
    super.initState();
    _iconAnimationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: 500)
    );
    _iconAnimation = CurvedAnimation(
      parent: _iconAnimationController,
      curve : Curves.easeOut,
    );
    _iconAnimation.addListener(() => this.setState(() { }));
    _iconAnimationController.forward();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Image(
            image: AssetImage("assets/Library.jpeg"),
            fit: BoxFit.cover,
            color: Colors.black87,
            colorBlendMode: BlendMode.darken,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlutterLogo(
                size : _iconAnimation.value *  100,
              ),

              Form(
              child:Theme(
                data: ThemeData(
                brightness: Brightness.dark,
                primarySwatch: Colors.teal,
                  inputDecorationTheme: InputDecorationTheme(
                    labelStyle: TextStyle(
                      color: Colors.teal,
                      fontSize: 20.0,
                    )
                  )
                ),
                child: Container(
                  padding: const EdgeInsets.all(60.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    
                    children: <Widget>[
                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter Email",

                        ),
                        keyboardType: TextInputType.emailAddress,
                      ),

                      TextFormField(
                        decoration: InputDecoration(
                          labelText: "Enter Password",

                        ),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 40.0),
                      ),
                      MaterialButton(
                        height: 40.0,
                        minWidth: 100.0,
                        color: Colors.teal,
                        textColor: Colors.white,
                         child: Text("Login"),
                        onPressed: () => {},
                        splashColor: Colors.blueGrey,
                      )
                    ],
                  ),
                ),
              )
              )
            ],
          )
        ],
      ),
    );
  }
}
