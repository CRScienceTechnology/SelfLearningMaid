// 原生组件库
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

// 自写组件库
import 'package:AISL_Maid/GUI/MainPages/Searchpage.dart';
import 'package:AISL_Maid/GUI/MainPages/Connectpage.dart';
import 'package:AISL_Maid/GUI/PartPage/MultiTabPage.dart';



/*
AI问答的Body界面
*/
class Body1 extends StatefulWidget 
{
  const Body1({super.key});

  @override
  State<Body1> createState() => _BodyState(); // State泛型类，调用泛型方法
                                              // State<Body1> 指定了这个 _BodyState() 对象是为 Body1 组件服务的。
}

class _BodyState extends State<Body1> // 状态管理逻辑和UI构建代码,此为State Widget，而非狭义单指状态管理逻辑
{
  

  int _selectedIndex=0;
  void _onItemTapped(int index)     //利用点击函数进行页面的刷新
  {
  setState(() 
    {
      _selectedIndex = index;
    });
  }
    List<Widget> widgets=
  [
    Searchpage(),
    Connectpage(),
  ];



  @override
  Widget build(BuildContext context) 
  {
    return Row(
        children:[
          Column(
            children: [
              MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(1.0)),
                child: Container(
                    margin: const EdgeInsets.only(top: 30,left: 10,bottom: 30,right: 10),
                    width: 60,
                    height: MediaQuery.of(context).size.height * 0.75,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.blue.shade100,
                          Colors.pink.shade100,
                          Colors.white
                        ],
                      ),
                      // borderRadius: BorderRadius.circular(20.0), // 圆角
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight:Radius.circular(20),
                          bottomLeft:Radius.circular(10),
                          bottomRight: Radius.circular(10)
                      ),
                      // 圆角
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: const Offset(0, 3), // 阴影偏移
                        ),
                      ],
                      // color: Colors.lightBlueAccent,
                    ),

                    child: Align(
                      alignment: Alignment.center,
                      child: ListView(
                        children: [
                          const Padding(padding: EdgeInsets.only(top: 10)),
                          Tooltip(
                            message: "搜索",
                            preferBelow: false, // 不优先在下方显示
                            child: IconButton(
                              icon: Icon(
                                PhosphorIcons.cat(),
                                size: 32.0,
                              ),
                              onPressed: () {
                                _onItemTapped(0);
                              },
                            ),
                          ),

                          ListTile(
                            title: const Text('AI',textAlign: TextAlign.center,style: TextStyle(

                            ),),
                            onTap: () {//点击事件
                              _onItemTapped(1);
                            },
                          ),
                          ListTile(
                            title: const Text('书桌',textAlign: TextAlign.center),
                            onTap: () {
                              _onItemTapped(2);
                              print('Item 2 tapped');
                            },
                          ),
                          // Add more items as needed
                        ],
                      ),
                    )
                ),
              ),
            ],
          ),
          //Notice:const Expanded错误，不能对Expanded Widget对象使用 
          Expanded(child: Center(
              child: widgets.elementAt(_selectedIndex))
          ),
        ],
      );
  }
}


/*新建标签页默认的Body界面*/
class Body2 extends StatefulWidget 
{
  const Body2({super.key});

  @override
  State<Body2> createState() => _Body2State();
}

class _Body2State extends State<Body2> 
{
  @override
  Widget build(BuildContext context) 
  {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              '这是一个空白页',
              style: TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // 添加按钮点击事件
              },
              child: const Text('点击我'),
            ),
          ],
        ),
      ),
    );
  }
}


class Body3 extends StatefulWidget 
{
  const Body3({super.key});

  @override
  State<Body3> createState() => _Body3State();
}
class _Body3State extends State<Body3> 
{
  @override
  Widget build(BuildContext context) 
  {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '这是一个空白页',
              style: TextStyle(fontSize: 24),
            )
          ]
        )
      )
    );
  }
}

class Body4 extends StatefulWidget 
{
  const Body4({super.key});

  @override
  State<Body4> createState() => _Body4State();
}
class _Body4State extends State<Body4> 
{
  @override
  Widget build(BuildContext context) 
  {
    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              '这是一个空白页',
              style: TextStyle(fontSize: 24),
            )
          ]
        )
      )
    );
  }
}