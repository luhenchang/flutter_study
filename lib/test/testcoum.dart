import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: '',
    theme: new ThemeData(
      primarySwatch: Colors.blue,
    ),
    home: new CoumLum(),
  ));
}

class CoumLum extends StatefulWidget {
  @override
  _State createState() => new _State();
}

class _State extends State<CoumLum> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(''),
      ),
      body: Container(
        alignment: Alignment.centerLeft,
        height:150.0,
        child: Card(
          margin: new EdgeInsets.all(10.0),
          color: Colors.white,
          elevation: 2.0,
            child: new Row(
              mainAxisAlignment:MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment:CrossAxisAlignment.center,
                  children: <Widget>[
                   Padding(padding: new EdgeInsets.only(top:30.0,left:30.0),child:Text('title',style: TextStyle(color: Colors.redAccent,fontSize:27.0),) ,),
                   Padding(padding: new EdgeInsets.only(top:10.0,left:30.0),child:Text('subject') ,),
                  ],
                ),
                Padding(padding: new EdgeInsets.only(top:16.0,left:60.0,bottom:50.0,right:10.0),child:Image.network(
                  'https://avatar-static.segmentfault.com/168/531/1685319841-58d33ed24b9ce_big64',width:65.0,height:65.0,),),

              ],
            ),
          ),
      ),
    );
  }
}
