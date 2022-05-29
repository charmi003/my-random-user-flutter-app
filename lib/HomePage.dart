import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';


class HomePage extends StatefulWidget {
  const HomePage({ Key? key }) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool isLoading=true;
  List users=[];
  final String url='https://randomuser.me/api/?results=50';


  @override
  void initState() {
    super.initState();
    getData();
  }

  Future getData() async{
    var response=await http.get(Uri.parse(url)); 
    setState(() {
      var obj=json.decode(response.body);
      users=obj['results'];
      isLoading=false;      
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:Text('Random Users')
      ),
      body: isLoading
      ? Center(child: CircularProgressIndicator())
      : ListView.builder(
        itemCount: users.length,
        itemBuilder: (BuildContext context,idx) => Card(
          child:Row(
            children: [
              Container(
                margin:EdgeInsets.all(20.0),
                child: CircleAvatar(
                  radius: 35, // Image radius
                  backgroundImage: NetworkImage(users[idx]['picture']['thumbnail']),
                )
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(users[idx]['name']['first'] + ' ' + users[idx]['name']['last'], style:TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                    const Padding(padding: EdgeInsets.all(3)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Icon(Icons.location_city),
                          Text('  '+users[idx]['location']['country']),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(3)),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          Icon(Icons.email_rounded),
                          Text('  '+users[idx]['email']),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          )
        ),
      )


      
    );
  }
}