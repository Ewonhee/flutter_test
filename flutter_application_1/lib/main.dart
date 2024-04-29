import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


void main() {
  runApp( MaterialApp(
      home: const MyApp()
      ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var a = 1;
  var total = 3;
  final List<String> name = ['김영숙', '홍길동', '피자집','비인가'];
  final List<int> like = [0, 0, 0, 0, 0];

  addone(){
    setState(() {
      total++;
    });
  }

  addlist(ad){
    setState(() {
      name.add(ad);
    });
  }
  

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Text(a.toString()),
          onPressed: (){
              showDialog(
                context: context,
                builder: (context) {
                  return Dialogs(state : a, addone : addone, addlist: addlist);
                },
              );

          },),
        appBar: AppBar(
                backgroundColor: Colors.blue,
                title : Text(total.toString()),
                leading : Icon(Icons.star),
                actions : const[ Icon(Icons.star), Icon(Icons.star) ]
              ),
        body: 
              Contact(name : name, like: like)
    );
  }
}


class Dialogs extends StatelessWidget {
  
  Dialogs({super.key,  this.state, this.addone, this.addlist});
  final state;
  final addlist;
  final addone;
  final inputData = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Dialog(
                    child: SizedBox(
                      width: 300,
                      height: 200,
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextField(
                              controller: inputData,
                            ),
                            SizedBox(height: 20),
                            Text(
                              '다이얼로그 내용이 여기에 들어갑니다.',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop(); // 취소 버튼을 누르면 다이얼로그가 닫힙니다.
                                  },
                                  child: Text(
                                    '취소',
                                    style: TextStyle(color: Colors.red),
                                  ),
                                ),
                                SizedBox(width: 8), // 버튼 사이에 간격을 추가합니다.
                                TextButton(
                                  onPressed: () {
                                    addlist(inputData.text);
                                    // 완료 버튼을 누를 때 실행될 동작을 추가하세요.
                                  },
                                  child: Text(
                                    '완료',
                                    style: TextStyle(color: Colors.blue),
                                  ),
              
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
  }
}









class Contact extends StatefulWidget {
  const Contact({super.key, required this.name, required this.like});
  final  List<String> name;
  final  List<int> like;

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
 

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.name.length,
      itemBuilder: (c, i) {
        return ListTile(
          leading: Icon(Icons.contact_mail),
          title: Row(
            children: [
              Text(widget.name[i]),
              SizedBox(width: 8),
              Text('${widget.like[i]}'),
            ],
          ),
          trailing:Row(
            mainAxisSize: MainAxisSize.min,
            children:[
            TextButton(onPressed: (){
            setState(() { 
              widget.like[i]++;
            });}, 
            child: Text('좋아요')),
            TextButton(onPressed: (){
              setState(() {
                widget.like[i]--;
              });
            }, child: Text('싫어요'))
            
            ],
            )
        );
      },
    );
  }
}

// stless

class Imagewidget extends StatelessWidget {
  const Imagewidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 120,
      child: Row(
        children: 
        [Image.asset('eiffel-tower-3349075_1280.jpg',height: 120,),
        Column(children: const[
          Text('캐논'),
          Text('성동구'),
          Text('2100원'),
          Row(children: [Icon(Icons.star),Text('4')])
        ],),],),
    );
  }
}