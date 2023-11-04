import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gradient_app_bar/flutter_gradient_app_bar.dart';
import 'package:pokedex/home_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {


  final myController = TextEditingController();
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   flexibleSpace: ClipRRect(
      //     child: Container(
      //       decoration: BoxDecoration(
      //         image: DecorationImage(
      //           image: AssetImage("assets/images/icon2.png"),
      //           fit: BoxFit.fill,
      //         ),
      //       ),
      //     ),
      //   ),
      //   leading: Container(
      //     // color: Colors.red,
      //     width: width *0.5,
      //     child: IconButton(
      //       onPressed: () => SystemNavigator.pop(),
      //       icon: const Icon(Icons.arrow_back),
      //     ),
      //   ),
      // ),
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: [
            Colors.red,
            Colors.black,
            Colors.white,
          ],
              stops: [
                0.4,
                0.5,
                0.6,
              ],
              begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.only(top: 100,left: 8.0),
        child: Column(
          children: [
            Container(
              width: width*0.8,
              child: Text(
                'Enter Your Name',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width*0.9,
              child: TextField(
                controller: myController,
                decoration: InputDecoration(
                  border: UnderlineInputBorder(),
                  hintText: 'Ash Ketchum',
                ),
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: width*0.9,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.redAccent,
                ),
                  onPressed: (){
                    Navigator.push(context,MaterialPageRoute(builder: (context) => HomeScreen(
                      name:myController.text,
                    ),
                    ),
                    );
                  },
                  child: Text(
                    "Let's go",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    ),
                  )
              ),
            ),
          ],
        ),
      ),
    );
  }
}
