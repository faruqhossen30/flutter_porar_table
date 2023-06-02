import 'package:flutter/material.dart';
import 'package:flutter_porar_table/model/post_model.dart';
import 'package:flutter_porar_table/service/post_service.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({Key? key}) : super(key: key);

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    PostService().getPost();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post List"),
      ),
      body: FutureBuilder(
        future: PostService().getPost(),
        builder: (context, AsyncSnapshot snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView.builder(
              itemCount: snapshot.data.length??0,
              itemBuilder: (context, index){
                PostModel data = snapshot.data[index];
                return ListTile(
                  title: Text(data.title.toString()),
                );
              },
            );
          }
        },
      ),
    );
  }
}
