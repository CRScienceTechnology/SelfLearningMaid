
// ignore_for_file: non_constant_identifier_names

//主程序-多标签页
import 'package:AISL_Maid/GUI/PartPage/Body.dart';
import 'package:flutter/material.dart';

// class MultiTabPage extends StatefulWidget  // 从StatefulWidget延申Dom树节点
// {
//   const MultiTabPage({super.key, required this.title});
//   final String title;

//   @override
//   State<MultiTabPage> createState() => _TabpageState();

// }
// // 多标签页的实现
// class _TabpageState extends State<MultiTabPage> with SingleTickerProviderStateMixin {
  
//   late TabController _tabController;

//   @override
//   void initState() {
//     super.initState();
//     _tabController = TabController(length: 3, vsync: this);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('TabBar Example'),
//         ),
//         body: TabBarView(
//           controller: _tabController, // 使用 TabController 控制 TabBarView
//           children: const [
//             Center(child: Text('Tab 1')),
//             Center(child: Text('Tab 2')),
//             Center(child: Text('Tab 3')),
//           ],
//         ),
//         bottomNavigationBar: TabBar(
//           controller: _tabController, // TabBar 与 TabController 关联
//           tabs: const [
//             Tab(text: 'Tab 1'),
//             Tab(text: 'Tab 2'),
//             Tab(text: 'Tab 3'),
//           ],
//         ),
//       ),
//     );
//   }

//   @override
//   void dispose() {
//     _tabController.dispose();
//     super.dispose();
//   }
// }








class MultiTabPage extends StatefulWidget 
{
  final ValueChanged<int> multitab_tapfunc;      // 用ValueChanged<int>泛型来快速创建需要传入的回调函数 ，来改变父组件的变量 
  final List<Widget> tab_body_widgets;

  final VoidCallback onAddTab_func;                  
  const MultiTabPage({required this.multitab_tapfunc,required this.tab_body_widgets ,required this.onAddTab_func,super.key });
  @override

  // ignore: no_logic_in_create_state
  State<MultiTabPage> createState() => _MultiTabPage(multitab_tapfunc:(int index) {multitab_tapfunc(index);},tab_body_widgets: tab_body_widgets,onAddTab_func:(){onAddTab_func();},); 
  // Notice：该行起着一个承上启下的作用，维护父widget与子widget之间的通信

}
class _MultiTabPage extends State<MultiTabPage> 
{
  final ValueChanged<int> multitab_tapfunc;      // 用ValueChanged<int>泛型来快速创建需要传入的回调函数 ，来改变父组件的变量
  final List<Widget> tab_body_widgets; 

  final VoidCallback onAddTab_func;              // 新增回调函数    


  _MultiTabPage({required this.multitab_tapfunc, required this.tab_body_widgets, required this.onAddTab_func}); 
  //required关键字表示该参数必须传入；this表示当前类中的属性；
  //this.bodywidgets_onItemTapped表示要传入复合当前类中复合泛型ValueChanged<int>

  // 标签页的存储列表
  List<Widget> tabbarwidgets=[
    const Tab(icon: Icon(Icons.home)),
    const Tab(icon: Icon(Icons.add_box_outlined),)
  ];
  // 新建标签功能函数
  void addtab()
  {
    setState(() 
    {
      tabbarwidgets.insert(tabbarwidgets.length-1,const Tab(icon: Icon(Icons.directions_bike)));//往最后一个tab前面插入新标签 
      tab_body_widgets.insert(tabbarwidgets.length-1, Body2());// 给新增标签新建并且分配一个页面
      multitab_tapfunc(tabbarwidgets.length-1);// 切换到新增标签页
    });
  }
  


  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      home: DefaultTabController // 
      (
        length: tabbarwidgets.length,// 当前标签的最大数，动态匹配当前打开的标签页数量
        animationDuration: const Duration(milliseconds: 10),
        child: TabBar
            (
              isScrollable: true,  // 根据tab大小进行自适应紧凑排列
              tabs: tabbarwidgets, // 总共展示的标签
              onTap: 
              //(index) => print(index),                              // 获取被点击的Tab的索引
              (index) {
                if(tabbarwidgets[index]==tabbarwidgets.last)          // 判断被点击的标签是否为最后一个标签
                {
                  addtab();
                  print("add page");
                }else
                {
                  multitab_tapfunc(index);
                  print(index);
                  print(tabbarwidgets.length);
                }} // 构建匿名函数，调用回调函数更新索引
              
            ),
            
          // body: const TabBarView(
          //   children: [
          //     Icon(Icons.directions_car),
          //     Icon(Icons.directions_transit),
          //     Icon(Icons.directions_bike),
          //   ],
          // ),
      ),
    );
  }
}

// TODO:2025.2.14 实现点击最后一个Tab（新增标签页的功能）时新增一个标签页并跳转到该标签页的功能

// 分析：实现思路
// 构造一个点击函数，实现被点击实现三个动作：
// 新增一个tab widget
// 新增该tab widget对应的新建页bodywidget
// 切换到该新增的tab页面

// 分析：功能依赖
// 第一次实现采用在父widget实现新建页面内容函数，在本widget中实现新建标签函数
// 而在子widget中的addtab()功能函数中依次调用父widget的onAddTab()和本widget中tabbarwidgets.insert()
// 然后调用父widget的multitab_tapfunc更新当前选中的标签页索引
//
// 总结：实现步骤
// 1.在MultiTabpage.dart中创建tabbarwidgets的list泛型，用于存储已打开标签页widget
// 2.在MultiTabpage.dart中创建一个onAddTab_func函数，用于实现点击最后一个Tab（新增标签页的功能）时新增一个标签页并跳转到该标签页的功能
// 3.在StartPage.dart中onAddTab()函数实现增加新的body页，并且切换实现标签索引，在setState函数结束后通知UI层更新UI
// 
// 总结：踩坑知识
// 1.StatelessWidget组件无法使用setState()函数去动态的维护自身组件状态，因此无法实现动态的更新标签页
// 还有一点就是不能在类中创建变量，为此我换成了StatefulWidget组件。优先考虑使用Statefulwidget组件
// 