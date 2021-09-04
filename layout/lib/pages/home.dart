import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:layout/pages/detail_page.dart';
import 'package:http/http.dart' as http;
import 'dart:async';

class HomePage extends StatefulWidget {
  //const HomePage({ Key? key }) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Computer knowlege"),
        ),
        body: Padding(
            padding: const EdgeInsets.all(10),
            child: FutureBuilder(
              builder: (context, AsyncSnapshot snapshot) {
                //var data = json.decode(snapshot.data.toString());
                return ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return MyBox(
                        snapshot.data[index]['title'],
                        snapshot.data[index]['subtitle'],
                        snapshot.data[index]['imges'],
                        snapshot.data[index]['detail']);
                  },
                  itemCount: snapshot.data.length,
                );
              },
              future: getData(),
              // future:
              //     DefaultAssetBundle.of(context).loadString('assets/data.json'),
            )),
        bottomNavigationBar: BottomNavigationBar(
          //currentIndex: _currentInex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.calculate), label: "คำนวณ"),
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "หน้าแรก"),
            BottomNavigationBarItem(
                icon: Icon(Icons.contact_mail), label: "ติดต่อเรา"),
          ],
          onTap: (index) {
            setState(() {
              print(index);
              //_currentInex = index;
            });
          },
        ));
  }

  Widget MyBox(String title, String subtitle, String imges, String detail) {
    var v1, v2, v3, v4;
    v1 = title;
    v2 = subtitle;
    v3 = imges;
    v4 = detail;
    return Container(
      margin: EdgeInsets.all(20),
      padding: EdgeInsets.all(20),
      //color: Colors.blue[100],
      height: 180,
      decoration: BoxDecoration(
          //color: Colors.blue[50],
          borderRadius: BorderRadius.circular(20),
          image:
              DecorationImage(image: NetworkImage(imges), fit: BoxFit.cover)),

      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(fontSize: 25, color: Colors.white),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            subtitle,
            style: TextStyle(fontSize: 18, color: Colors.white),
          ),
          SizedBox(
            height: 20,
          ),
          TextButton(
              onPressed: () {
                print("next page");
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => detail_page(v1, v2, v3, v4)));
              },
              child: Text("อ่านต่อ"))
        ],
      ),
    );
  }

  Future getData() async {
    //https://raw.githubusercontent.com/wavesusiya/laout_api/main/data.json
    var url = Uri.https(
        'raw.githubusercontent.com', '/wavesusiya/laout_api/main/data.json');
    var response = await http.get(url);
    var result = json.decode(response.body);
    return result;
  }
}
