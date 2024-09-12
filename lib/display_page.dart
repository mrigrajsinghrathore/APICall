

import 'package:api_for_list/api_model.dart';
import 'package:api_for_list/api_service.dart';
import 'package:flutter/material.dart';

class DisplayPage extends StatefulWidget {
  const DisplayPage({super.key});

  @override
  State<DisplayPage> createState() => _DisplayPageState();
}

class _DisplayPageState extends State<DisplayPage> {
  List<PostWithModel> postWithModel = [];
  bool isLoading = false;
  _fatchData() {
    isLoading = true;
    ApiService().getPostWithModel().then((value){
      setState(() {
        postWithModel = value!;
        isLoading = false;

      });
    });
  }
  @override
  void initState() {
    _fatchData();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("APICall"),
        centerTitle: true,
      ),
      body: isLoading == true ?
          Center(child: CircularProgressIndicator(),) :


              ListView.builder(
              itemCount: postWithModel.length,
              itemBuilder: (context, i){
                return Card(
                  margin: EdgeInsets.all(8),
                  child: ListTile(
                    leading: Text(postWithModel[i].id.toString(),style: TextStyle(color: Colors.black,fontSize: 15)),
                    title: Text(postWithModel[i].title.toString(),style: TextStyle(color: Colors.indigo,fontSize: 15,fontWeight: FontWeight.bold)),
                    subtitle: Text(postWithModel[i].body.toString(),style: TextStyle(color: Colors.deepPurpleAccent,fontSize: 15)),
                  ),
                );
              })


    );
  }
}
