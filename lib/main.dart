// 引入第三方包组件
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

// 引入自己写的界面组件
import 'package:AISL_Maid/GUIPage/DisplayPages/Settingpage.dart';
import 'package:AISL_Maid/GUIPage/DisplayPages/Resourcepage.dart';
import 'package:AISL_Maid/GUIPage/DisplayPages/Startpage.dart';



/*
1. maid.dart只负责布局实现应用，实际的UI组件实现应该都放在GUIPAGE下，做到解耦
*/
void main() {
  runApp(MyApp());
}


// 主程序
class MyApp extends StatelessWidget 
{
  MyApp({super.key});
  // 配置页面路由树
  // key: 路由名称，value: 路由对应的页面
  Map<String, WidgetBuilder> routes = 
  {
    '/tabview/Settingpage': (context) => Settingpage(),
    '/tabview/Resourcepage': (context) => Resourcepage(),
    '/Startpage': (context) => Startpage(),
    // '/Startpage/Questionpage': (context) => Questionpage(),
  };

  
  
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //全局样式设置器
      theme: ThemeData(
        useMaterial3: true,

        // //统一的设置padding的样?
        // inputDecorationTheme: InputDecorationTheme(
        //   contentPadding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        // ),
        // Define the default brightness and colors.
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blueAccent.shade100,
          brightness: Brightness.light    //该变主题的样式，Brightness.dark,
        ),

        // Define the default `TextTheme`
        textTheme: TextTheme(
          displayLarge: const TextStyle(
            fontSize: 72,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: GoogleFonts.oswald(
            fontSize: 30,
            fontStyle: FontStyle.italic,
          ),
          bodyMedium: GoogleFonts.merriweather(),
          displaySmall: GoogleFonts.pacifico(),
        ),
      ),
      home: Startpage(), // 主页
      routes: routes,
    );
  }
}













