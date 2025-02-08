/*
*   在这里进行一些信息获取的与后端的交互
* 的操作，即类似于js的操作步骤,示例
* */
import 'package:http/http.dart' as http;
import 'dart:convert';



//提问加上返回信息
Future<String> getHello() async 
{
  final response = await http.get(Uri.parse('http://localhost:5000/hello'));
  if (response.statusCode == 200) {
    // 如果服务器返回200 OK，则打印响应体
    print(jsonDecode(response.body));
    return jsonDecode(response.body)['message'];
  } else {
    // 如果服务器返回错误
    print('Request failed with status: ${response.statusCode}.');
    return "";
  }
}

Future<void> sendData() async
 {
  //构造response类
  final response = await http.post(
    Uri.parse('http://localhost:5000/api_get'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'key': 'value',
    }),
  );
  if (response.statusCode == 200) 
  {
    print(jsonDecode(response.body));//正确解析的结果
  } else {
    print('Request failed with status: ${response.statusCode}.');
  }
}


