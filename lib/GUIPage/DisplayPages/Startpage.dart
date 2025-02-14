// 原生组件库
// ignore_for_file: non_constant_identifier_names

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



  // 窗口标签页的总个数
  int _bodypageamount=1;
  // 窗口当前所在标签页的索引
  int _bodypageIndex=0;

  // Notice：列表类为0索引方法，同时Tab索引也是从0开始




  // 顶部导航栏body更新函数
  void _onItemTapped(int index) {
    setState(() 
    {
      _selectedIndex = index;
    });
    //setState方法逻辑执行完毕，会重新绘制界面
  }



  // 标签页所对应的页面存储列表
  List<Widget> bodywidgets=[
    const Body1(),   // 启动主程序所进入的首页
    const Body2(),   // 新建标签页的功能选择页面
  ];
  // 点击标签页的页面切换函数
  void bodywidgets_onItemTapped(int index) {
    setState(() 
    {
      _bodypageIndex = index;
      print(_bodypageIndex); // Test：测试MultiTabPage的Tab widget的onTap方法结果是否影响父widget
    });
  }
  


  // 新增标签页增加对应body的实现
  void onAddTab()
  {
    setState(() {
      bodywidgets.add(const Body2());          // 添加父widget新的标签页所展示的内容
                                               // 添加子widget的标签页wiget
      _bodypageIndex = bodywidgets.length - 1; // 跳转到新添加的标签页      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // Notice：传入一个类中函数的方法，通过类名.方法名()进行调用
        flexibleSpace: MultiTabPage(
          multitab_tapfunc:(int index) // 点一般击标签的行为
          {
            bodywidgets_onItemTapped(index);
          },
          tab_body_widgets: bodywidgets,
          onAddTab_func:()             // 点击新增标签的行为
          {
            onAddTab();
          },)
          ,
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




// TODO:2025.2.8 完成点击MultiTabPage中的Tabwidget就能实现跳转到Body.dart写好的相应页面的功能-->修复将函数传入类的实现

// 总结：实现步骤
// 1.在Startpage.dart中定义一个bodywidgets_onItemTapped函数，用于实现点击Tabwidget时，实现跳转到Body.dart中相应的页面
// 2.在Startpage.dart定义bodywidgets的泛型列表，用于存储Body.dart中各个页面的widget，因为点击后实现切换页面实际上是父widget的body元素发生改变
// 3.在MultiTabPage.dart中写final ValueChanged<int> multitabPage_tapfunc_，然后在子wedget的传参函数增添required this.multitabPage_tapfunc_
// 4.在MultiTabPage.dart中的TabBarWidget中的onTap点击回调中传入 (index) {bodywidgets_onItemTapped(index);}
// 总结：核心要点
// 1. void _onItemTapped(int index) 函数中具体实现逻辑放入setState(() {})中，实现页面的刷新

// 总结：核心知识
// 1.setState(() {})
// 状态管理：
// setState方法会告诉Flutter框架，组件的状态已经发生变化，需要重新构建UI。
// 如果不使用setState，Flutter框架不会知道状态已经改变，因此不会重新构建UI，导致界面无法反映最新的状态。
// 响应式编程：
// Flutter采用响应式编程模型，setState是实现响应式的关键。
// 通过调用setState，可以确保UI与状态保持同步，用户界面能够及时反映数据的变化。
// 性能优化：
// setState会触发局部重建，而不是整个应用的重建，从而提高性能。
// 通过最小化需要重建的部分，Flutter可以更高效地更新UI。
// 2.multitabPage_tapfunc_:(int index){bodywidgets_onItemTapped(index);
// 此处是在父组件中构建状态改变函数，然后将其传入子组件中，子组件中调用该函数，然后改变父组件管理的变量，这样子做比起
// 在子组件中写状态改变函数，然后在父组件中调用子组件中的函数，实现状态改变，会更方便。也更好明白变量作用域关系
// 如果为后者方式，则需要在子组件中去影响父组件的变量跨域，这样会破坏封装性，并且会增加代码复杂度

