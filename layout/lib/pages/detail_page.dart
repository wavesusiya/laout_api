import 'package:flutter/material.dart';

class detail_page extends StatefulWidget {
  //const detail_page({Key? key}) : super(key: key);
  final v1, v2, v3, v4;
  detail_page(this.v1, this.v2, this.v3, this.v4);

  @override
  _detail_pageState createState() => _detail_pageState();
}

class _detail_pageState extends State<detail_page> {
  var _v1, _v2, _v3, _v4;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _v1 = widget.v1;
    _v2 = widget.v2;
    _v3 = widget.v3;
    _v4 = widget.v4;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("รายละเอียด")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [Text(_v1), Text(_v2), Image.network(_v3), Text(_v4)],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        //currentIndex: _currentInex,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "หน้าแรก"),
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: "คำนวณ"),
          BottomNavigationBarItem(
              icon: Icon(Icons.contact_mail), label: "ติดต่อเรา"),
        ],
        onTap: (index) {
          setState(() {
            print(index);
            //_currentInex = index;
          });
        },
      ),
    );
  }
}
