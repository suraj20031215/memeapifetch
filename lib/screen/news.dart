import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../state/provider.dart';

class NewsApi extends StatefulWidget {
  const NewsApi({super.key});


  @override
  State<NewsApi> createState() => _NewsApiState();
}

class _NewsApiState extends State<NewsApi> {


var item=[];

bool loaded=false;
  Future<void> call()async{
    http.Response resp=await http.get(Uri.parse('https://newsapi.org/v2/everything?q=apple&from=2023-12-21&to=2023-12-21&sortBy=popularity&apiKey=3c9aa8d0efcf4b10b1107e929b5cec17'));

    if(resp.statusCode==200){
      print('sucess');
      Map<String, dynamic> data = json.decode(resp.body);
    var alldata=data['articles'];
      setState(() {
        loaded=true;
        item=List<Map<String, dynamic>>.from(alldata);
        print(alldata);
       print(alldata[0]['source']['name']);
      });

    }
    else{
      print('error');
    }

}
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    call();
  }

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return Scaffold(
     // backgroundColor: Theme.of(context).hoverColor,
      appBar: AppBar(
        title: Text('News Api'),
        actions: [

          InkWell(
              onTap: () {
                themeProvider.toggleTheme();
              },
              child: Icon(Icons.dark_mode))
        ],
      ),
      body: !loaded?const Center(child: Text('WAIT')):
      ListView.builder(itemBuilder: (context, index) {
        return Container(child: Column(
          children: [
            Container(
              child: Text(item[index]['title']

              ),
            ),

          ],
        )
        );
      },itemCount: item.length,)



    );
  }

}
