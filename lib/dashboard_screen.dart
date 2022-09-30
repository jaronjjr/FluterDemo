import 'package:flutter/material.dart';
import 'dart:convert' as convert;

import 'package:http/http.dart' as http;
import 'user_list_response.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Dashboard'),
      ),
      backgroundColor: Colors.white,
      body: Container(
        child: getApiData(),
      ),
    );
  }

  getApiData() {
    return FutureBuilder<UserListResponse?>(
        future: callGetApi(),
        builder: (context, AsyncSnapshot<UserListResponse?> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return ListView.builder(
                itemCount: snapshot.data?.data?.length ?? 0,
                itemBuilder: (context, index) {
                  return Container(
                      color: Colors.amber.shade100,
                      margin: EdgeInsets.all(5.0),
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        children: [
                          Container(
                              child: Image.network(
                                  snapshot.data?.data?[index].avatar ?? '')),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Text(
                                  '${snapshot.data?.data?[index].firstName ?? ''} ${snapshot.data?.data?[index].lastName ?? ''}',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Text(
                                  '${snapshot.data?.data?[index].email ?? ''}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ));
                });
          } else {
            return Center(child: Text('Loading...'));
          }
        });
  }

  Future<UserListResponse?> callGetApi() async {
    var url = Uri.parse('https://reqres.in/api/users?page=1&per_page=20');

    var response = await http.get(url);

    if (response.statusCode == 200) {
      var jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      return UserListResponse.fromJson(jsonResponse);
    } else {
      return null;
    }
  }
}