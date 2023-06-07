import 'dart:convert';
import 'dart:io';

import 'package:api_calling/view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

void main(){
  runApp(MaterialApp(home: add_data(),));
  print("Hello");

}
class add_data extends StatefulWidget {
  const add_data({Key? key}) : super(key: key);

  @override
  State<add_data> createState() => _add_dataState();
}

class _add_dataState extends State<add_data> {
  TextEditingController name=TextEditingController();
  TextEditingController contact=TextEditingController();
  ImagePicker picker = ImagePicker();
  XFile ?photo;
  bool is_uploaded=false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add Contact Details"),),
      body: Column(children: [
        Card(child: TextField(controller: name,),),
        Card(child: TextField(controller: contact,),),
        ElevatedButton(onPressed: () async {
         photo = await picker.pickImage(source: ImageSource.camera);
         
         print(photo);
         is_uploaded=true;
         setState(() {});

        }, child: Text("Upload Images")),
        Container(width: 70,height: 70,child:

          (is_uploaded==true)?Image.file(File(photo!.path)):Icon(Icons.supervisor_account),),
        ElevatedButton(onPressed: () async {

          String _name,_contact,_images;
          _name=name.text;
          _contact=contact.text;
          _images=base64UrlEncode(await photo!.readAsBytes());
          print(_name);
          print(_contact);
          print(_images);
          print(photo!.path);

          var url = Uri.parse('https://demo2811.000webhostapp.com/api_calling/_connecation.php');
          var response = await http.post(url, body: {'name': '$_name', 'contact': '$_contact','images': '$_images'});
          print('Response status: ${response.statusCode}');
          print('Response body: ${response.body}');

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Add Sucess...")));

        }, child: Text("Add")),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return view_data();
          },));
          
        }, child: Text("View Data"))


      ],),
    );
  }
}
