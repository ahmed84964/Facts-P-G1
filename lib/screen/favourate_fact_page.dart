import 'package:flutter/material.dart';

class FavScreen extends StatelessWidget {
  const FavScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle:true,
        title: Text(
          "My Favorite Facts ",
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
        backgroundColor: Colors.indigoAccent,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context , index){
          return
            Container(
                margin: EdgeInsets.symmetric(vertical: 10),
                padding: EdgeInsets.only(left: 15 , top: 24 , bottom: 24),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.tealAccent,
                ),child:ListTile(
              title: Text("Fact"),
              subtitle: Text("Details"),
              trailing: Icon(Icons.delete),
            ));
        },
      ),
    );
  }
}