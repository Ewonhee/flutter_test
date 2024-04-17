import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
            setState(() {
              a++;
            });
          },),
        appBar: AppBar(
                backgroundColor: Colors.blue,
                title : Text('앱제목'),
                leading : Icon(Icons.star),
                actions : const[ Icon(Icons.star), Icon(Icons.star) ]
              ),
        body: Contact()
    ),);
  }
}

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  var name = ['김영숙', '홍길동', '피자집'];
  var like = [0, 0, 0];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 3,
      itemBuilder: (c, i) {
        return ListTile(
          leading: Icon(Icons.contact_mail),
          title: Row(
            children: [
              Text(name[i]),
              SizedBox(width: 8),
              Text('${like[i]}'),
            ],
          ),
          trailing: TextButton(
            onPressed: () {
              setState(() {
                like[i]++;
              });
            },
            child: Text('좋아요'), // TextButton의 text 속성에 Text 대신 String 전달
          ),
        );
      },
    );
  }
}
