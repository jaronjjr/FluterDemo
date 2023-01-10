import 'package:flutter/material.dart';
import 'package:sample_test1/dashboard_screen.dart';
import 'package:sample_test1/splash_screen.dart';
import 'package:sample_test1/user_detail.dart';

import 'package:sample_test1/user_list_response.dart';

void main() {
  runApp(const MyHome());
}

class MyHome extends StatefulWidget {
  const MyHome({Key? key}) : super(key: key);

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        if (settings.name == 'user_detail') {
          // Cast the arguments to the correct
          // type: ScreenArguments.
          final userdata = settings.arguments as UserData;

          // Then, extract the required data from
          // the arguments and pass the data to the
          // correct screen.
          return MaterialPageRoute(
            builder: (context) {
              return UserDetailScreen(userdata: userdata);
            },
          );
        }
        return null;
      },
      routes: {
        '/': (context) => SplashUIPage(),
        'dash': (context) => DashboardScreen(),
        // 'user_detail': (context) {

        //   return UserDetailScreen(userdata: userdata);
        // }
      },
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome',
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(
              height: 25,
            ),
            usernameWidget(),
            SizedBox(
              height: 10,
            ),
            passwordWidget(),
            SizedBox(
              height: 50,
            ),
            loginBtn()
          ],
        ),
      ),
    );
  }

  usernameWidget() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: const TextField(
        decoration: InputDecoration(
            hintText: 'Enter your email',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.black, width: 3.0))),
      ),
    );
  }

  passwordWidget() {
    return Container(
      margin: const EdgeInsets.all(10.0),
      child: const TextField(
        decoration: InputDecoration(
            hintText: 'Enter your dob (dd/MM/yyyy)',
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
                borderSide: BorderSide(color: Colors.black, width: 3.0))),
      ),
    );
  }

  loginBtn() {
    return ElevatedButton(
        onPressed: () {
          Navigator.pushNamed(context, 'dash');
        },
        child: Container(
          padding: EdgeInsets.all(8.0),
          color: Colors.blue,
          child: Text(
            'Login',
            style: TextStyle(fontSize: 16.0),
          ),
        ));
  }
}
