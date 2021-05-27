import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
class Demo extends StatefulWidget {
  @override
  _DemoState createState() => _DemoState();
}

class _DemoState extends State<Demo> {
  var data = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(onPressed:fetchDataFromServer, child: Text('Fetch data'),),
            Text(data)
          ],
        ))
      ),
    );
  }
  fetchDataFromServer() async{
    data= await fetch();
    setState(() {
      
    });
  }

  Future<String> fetch()async {
    try{
      var url = Uri.parse("${env["VAR_NAME"]}/example");
      var response =  await get(url);
      return response.body;

    }catch(error){
      print(error.toString());
      return error.toString();
    }

  }
}
