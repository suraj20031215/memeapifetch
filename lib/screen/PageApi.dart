import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:lottie/lottie.dart';
class APICall extends StatefulWidget {
  const APICall({super.key});

  @override
  State<APICall> createState() => _APICallState();
}

class _APICallState extends State<APICall> {
  List<Map<String,dynamic>> myvar=[];
  bool loaded=false;
  Future<void> callApi()async{
    http.Response resp=await http.get(Uri.parse('https://api.imgflip.com/get_memes'));

    if(resp.statusCode==200){
      Map<String,dynamic> data=json.decode(resp.body);
      print(data);
      var mydata=data['data']['memes'];
      print(mydata);
      setState(() {
        loaded=true;
        myvar=List<Map<String, dynamic>>.from(mydata);
        // print(myvar.length);
      });
      // data['memes']
    }else{
      print('error');
    }
  }
  @override
  void initState() {
    // TODO: implement initState

    super.initState();
    callApi();

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Center(child: Text('MEMES')),),
      body: !loaded?Center(child: Lottie.asset(width: 40,height: 40,'assets/icons/loading.json')):
      ListView.builder(itemBuilder: (context, index) {
        return Container(child: Column(
          children: [
           // Text(myvar[index]['name']),
            SizedBox(
                width: double.infinity,
                height: 300,
                child: Image.network(myvar[index]['url'],fit: BoxFit.fill)),
            Row(
              children: [
                Text(myvar[index]['name'],textScaleFactor: 1.2,),
              ],
            ),
          ],
        ));
      },itemCount: myvar.length,)
    );
  }
}
