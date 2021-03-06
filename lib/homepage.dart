


import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutterrestapi/models/mymodel.dart';
import 'package:http/http.dart' as http;

// import 'dart:convert' as convert;

class HomePage extends StatelessWidget {
   HomePage({ Key? key }) : super(key: key);


List<Autogenerated>postList=[];
Future<List<Autogenerated>>getPostapi()async{
final response=await http
      .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));

var mydata=jsonDecode(response.body.toString());
      if(response.statusCode==200){
for(Map i in mydata){
  postList.add(Autogenerated.fromJson(i));
}
return postList;
      }
      return postList;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          FutureBuilder(
            
            future:getPostapi(),
            builder: (context, snapshot){
             if(!snapshot.hasData){
               return Text('data');
             }
             else if (snapshot.hasError) {
               return Text('data................');
             }
             else{
               return Expanded(
                 child: ListView.builder(
                   itemCount: postList.length,
                   itemBuilder: (context, index) {
                   return Card(
                     child: Text('Title'+postList[index].title.toString()),
                   );
                 }),
               );
             }
            //  return Text('${snapshot.error}');
          })
        ],
      ),
    );
  }
}