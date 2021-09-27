import 'package:flutter/material.dart';
import 'package:flutter_application_1/utils/routes.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String name = "";
  bool changebutton = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        // appBar: AppBar(),
        // body: Center(child: Container(child: Text("Hello $days $name"))),
        // drawer: Drawer(),
        child: SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            "assets/images/undraw_secure_login_pdn4.png",
            fit: BoxFit.cover,
            // height: 500,
          ),
          Text("Login Here $name",
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32),
            child: Column(children: [
              TextFormField(
                  decoration: InputDecoration(
                      labelText: "Username", hintText: "Enter Username"),
                  onChanged: (value) {
                    name = value;
                    setState(() {});
                  }),
              TextFormField(
                  obscureText: true,
                  decoration: InputDecoration(
                      labelText: "Password", hintText: "Enter Password")),
              SizedBox(height: 20),
              Material(
                color: Colors.deepPurple,
                child: InkWell(
                    onTap: () async {
                      setState(() {
                        changebutton = true;
                      });
                      await Future.delayed(Duration(seconds: 1));
                      await Navigator.pushNamed(context, MyRoutes.homeroute);
                      setState(() {
                        changebutton = false;
                      });
                    },
                    child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        width: changebutton ? 50 : 150,
                        height: 40,
                        color: Colors.deepPurple,
                        alignment: Alignment.center,
                        child: changebutton
                            ? Icon(Icons.done, color: Colors.white)
                            : Text(
                                "Login",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                        decoration: BoxDecoration(
                            shape: changebutton
                                ? BoxShape.circle
                                : BoxShape.rectangle))
                    // borderRadius:
                    //     BorderRadius.circular(changebutton ? 20 : 8))),
                    ),
              )
              // ElevatedButton(
              //     onPressed: () {
              //       Navigator.pushNamed(context, MyRoutes.homeroute);
              //     },
              //     child: Text("Login"))
            ]),
          ),
        ],
      ),
    ));
  }
}
