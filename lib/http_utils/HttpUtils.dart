import 'dart:async';
import 'dart:convert';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:flutter_app/http_utils/HttpUtils.dart';

//导入网络请求相关的包
import 'package:http/http.dart' as http;

class HttpUtils {
  HttpUtils(this.url, [this.parames]);

  var url;
  Map<String, String> parames;
  var list;
  Future<dynamic> get() async {
    //http://39.105.89.144:8081/TAS000010001?pageSize=1&currentPage=1
    //https://qy.healthinfochina.com:8080/DOC000010041?ishot=1&pageSize=10&currentPage=1
    /*
      var httpClient = new HttpClient();
  var uri = new Uri.http(
      'example.com', '/path1/path2', {'param1': '42', 'param2': 'foo'});
  var request = await httpClient.getUrl(uri);
  var response = await request.close();
  var responseBody = await response.transform(UTF8.decoder).join();
    * */
    print('url$url');
    await http.get(url).then((http.Response response) {
      var data = json.decode(response.body);
      list = data["data"]["datas"];
      print('list$list');
    });
    return list;
  }

  Future<dynamic> post() async {
    await http.post(url).then((http.Response respose) {
      var hh = respose.body;
      print('respose($hh)');
      var data = json.decode(respose.body);

      list =data["data"]["datas"];
      print('list$list');
    });
    return list;
  }
}
