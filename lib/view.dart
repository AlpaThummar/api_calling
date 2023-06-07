import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'mycontroller.dart';


class view_data extends StatefulWidget {
  const view_data({Key? key}) : super(key: key);

  @override
  State<view_data> createState() => _view_dataState();
}

class _view_dataState extends State<view_data> {

  get_date() async {

    var url = Uri.parse('https://demo2811.000webhostapp.com/api_calling/_view.php');
    var response = await http.get(url);
    
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
    
    List l=jsonDecode(response.body);
    return l;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get_date();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Data View"),),
      body: FutureBuilder(future: get_date(),builder: (context, snapshot) {
        if(snapshot.connectionState==ConnectionState.active ||snapshot.connectionState==ConnectionState.done){
          List list=snapshot.data as List;
          return ListView.builder(itemCount: list.length,itemBuilder: (context, index) {
            modal m=modal.fromJson(list[index]);
            return ListTile(trailing: CircleAvatar(backgroundImage: NetworkImage("https://demo2811.000webhostapp.com/${m.images}"),),title: Text("${m.name}"),subtitle: Text("${m.contact}"),);
          },);

        }else{
          CircularProgressIndicator();
                  }
        return Text("");
      },),

    );
  }
}
