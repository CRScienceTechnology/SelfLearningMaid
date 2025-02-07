
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
  const MultiTabPage({super.key});

  @override
  Widget build(BuildContext context) 
  {
    return const MaterialApp(
      home: DefaultTabController(
        length: 20,// 标签页的最大可容纳数
        animationDuration: Duration(milliseconds: 10),
        child: TabBar
            (
              isScrollable: true, // 根据tab大小进行自适应紧凑排列
              tabs: [
                Tab(icon: Icon(Icons.directions_car)),
                Tab(icon: Icon(Icons.directions_transit)),
                Tab(icon: Icon(Icons.directions_bike)),
              ],
              
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