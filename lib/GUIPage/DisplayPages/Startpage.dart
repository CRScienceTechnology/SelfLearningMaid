// 原生组件库
import 'package:AISL_Maid/GUIPage/AuxililaryPage/Body.dart';
import 'package:flutter/material.dart';
// 自写组件库
import 'package:AISL_Maid/GUIPage/DisplayPages/Searchpage.dart';
import 'package:AISL_Maid/GUIPage/DisplayPages/Connectpage.dart';
import 'package:AISL_Maid/GUIPage/AuxililaryPage/MultiTabPage.dart';
import 'package:AISL_Maid/GUIPage/AuxililaryPage/Body.dart';

// 图标
import 'package:phosphor_flutter/phosphor_flutter.dart';




/*初始页面及其衍生的页面*/

class Startpage extends StatefulWidget 
{
  const Startpage({super.key}); // 
  @override
  State<Startpage> createState() => _StartpageState(); // 创建子类的State
}

class _StartpageState extends State<Startpage> // 创建页面的State
{

  // 底部导航栏的索引
  int _selectedIndex=0;
  // 底部导航栏的widget的存储泛型列表
  List<Widget> widgets=
  [
    Searchpage(),
    Connectpage(),
  ];

  // 窗口主体布局的索引
  int _bodypageIndex=0;
  // 窗口主体布局widget的存储泛型列表
  List<Widget> bodywidgets=[
    const Body1(),
    const Body2(),
    const Body3(),
  ];
  // Notice：列表类为0索引方法，同时Tab索引也是从0开始


  //利用点击函数进行页面的刷新
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void bodywidgets_onItemTapped(int index) {
    setState(() 
    {
      _bodypageIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: MultiTabPage(bodywidgets_onItemTapped: (int value) {  },),
        backgroundColor: const Color.fromARGB(255, 97, 171, 206).withGreen(230),
        actions: [
          //设置原型的头像
          // IconButton(onPressed: ()=>print("nihao"), icon:),
          // CircleAvatar(
          //   backgroundImage: NetworkImage(r"C:\Users\程煜博\Desktop\VCG211492076912.jpg"),
          //   radius: 20.0, // 设置头像半径
          //
          // ),
          
          //设置右上角的头像
          InkWell(
            onTap: () 
            {
              // 点击头像时执行的操作
              print('头像被点击了！');
            },
            borderRadius: BorderRadius.circular(100.0), // 圆形边界
            onHover: (bool value) 
            {
            },
            child: const CircleAvatar(
              backgroundImage: AssetImage('picture/head.jpg'),
              radius: 20.0,
            ),

          )
        ],
      ),
      // 抽屉菜单布局
      drawer: Drawer(//抽屉
          child: Column(
            children: [
              //drawer的元素的填充
              DrawerHeader(child: Icon(
                  Icons.ac_unit)
              ),
              ListTile(
                  leading: Icon(Icons.account_balance_sharp),
                  title: Text("Startpage"),
                  onTap: (){
                    //点击函数
                    Navigator.pushNamed(context, '/Startpage');
                    // Navigator.pop(context);
                    print("点击");
                  }
              ),
              ListTile(
                  leading: Icon(Icons.account_tree_outlined),
                  title: Text("Resource"),
                  onTap: (){
                    //点击函数
                    Navigator.pushNamed(context, '/tabview/Resourcepage');
                    // Navigator.of(context).pop();
                    print("点击");
                  }
              ),
              ListTile(
                  leading: Icon(
                    PhosphorIcons.gear(PhosphorIconsStyle.fill),
                    size: 32.0,
                  ),
                  title: Text("Setting"),
                  onTap: (){
                    Navigator.pushNamed(context, '/tabview/Settingpage');
                    // Navigator.pop(context);
                    print("点击");
                  }
              )
            ],
          )
      ),
      // 窗口主体布局
      body: bodywidgets.elementAt(_bodypageIndex),
    );
  }
}




// TODO:2025.2.8 完成点击MultiTabPage中的Tabwidget就能实现跳转到Body.dart写好的相应页面的功能
