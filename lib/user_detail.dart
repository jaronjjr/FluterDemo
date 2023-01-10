import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:sample_test1/user_list_response.dart';

class UserDetailScreen extends StatefulWidget {
  UserData userdata;
  UserDetailScreen({super.key, required this.userdata});

  @override
  State<UserDetailScreen> createState() => _UserDetailScreenState();
}

class _UserDetailScreenState extends State<UserDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: const Text('User Detail'),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Image.network(
                widget.userdata.avatar ?? '',
                fit: BoxFit.contain,
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Text(
                  '${widget.userdata.firstName ?? ''} ${widget.userdata.lastName ?? ''}',
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  '${widget.userdata.email ?? ''}',
                  style: const TextStyle(fontSize: 18),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
