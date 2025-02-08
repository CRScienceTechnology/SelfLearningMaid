
//主程序-多标签页
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


class MultiTabPage extends StatelessWidget 
{
  final ValueChanged<int> bodywidgets_onItemTapped;      // 用ValueChanged<int>泛型来快速创建回调函数                 
  // ignore: non_constant_identifier_names
  const MultiTabPage({required this.bodywidgets_onItemTapped, super.key}); 
  //required关键字表示该参数必须传入；this表示当前类中的属性；
  //this.bodywidgets_onItemTapped表示要传入复合当前类中复合泛型ValueChanged<int>

  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      home: DefaultTabController // 
      (
        length: 20,// 标签页的最大可容纳数
        animationDuration: const Duration(milliseconds: 10),
        child: TabBar
            (
              isScrollable: true, // 根据tab大小进行自适应紧凑排列
              tabs: const [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
                Tab(icon: Icon(Icons.add_box_outlined),)
              ],
              onTap: 
              //(index) => print(index),     // 获取被点击的Tab的索引
              (index) {bodywidgets_onItemTapped(index);print(index);} // 调用回调函数更新索引
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