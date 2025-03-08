//TODO:2025.2.17 实现应用悬浮工具栏的测试单元


// 总结：创建步骤
// 1. **创建主应用程序**
//    1.1 定义 `MyApp`类，继承自 `StatelessWidget`。
//    1.2 在 `build`方法中返回 `MaterialApp`，并将 `DraggableFloatingBarTestPage`设置为首页。
// 2. **创建测试页面**
//    2.1 定义 `DraggableFloatingBarTestPage`类，继承自 `StatelessWidget`。
//    2.2 在 `build`方法中返回 `Scaffold`，包含一个 `AppBar`和一个 `Stack`。
//    2.3 在 `Stack`中添加 `DraggableFloatingBar`组件，并传入工具栏子项（如 `IconButton`）。
// 3. **定义可拖动悬浮工具栏组件**
//    3.1 定义 `DraggableFloatingBar`类，继承自 `StatefulWidget`。
//    3.2 接受一个 `List<Widget>`类型的 `children`参数，用于存储工具栏子项。
// 4. **管理悬浮工具栏的状态**
//    4.1 定义 `_DraggableFloatingBarState`类，继承自 `State<DraggableFloatingBar>`。
//    4.2 初始化 `_offset`为 `Offset(0, 0)`，表示悬浮窗的位置。
//    4.3 初始化 `_isDragging`为 `false`，表示当前是否正在拖动。
//    4.4 初始化 `_width`为 `200`，表示悬浮窗的默认宽度。
// 5. **设置初始位置**
//    5.1 在 `initState`方法中，使用 `WidgetsBinding.instance.addPostFrameCallback`获取屏幕尺寸。
//    5.2 将悬浮窗初始位置设置为屏幕右侧中间。
// 6. **构建悬浮工具栏UI**
//    6.1 使用 `Positioned`组件根据 `_offset`设置悬浮窗的位置。
//    6.2 使用 `GestureDetector`组件监听拖动事件。
//       6.2.1 `onPanStart`：开始拖动时，将 `_isDragging`设置为 `true`。
//       6.2.2 `onPanUpdate`：拖动过程中，更新 `_offset`的位置，并进行边界检查。
//       6.2.3 `onPanEnd`：结束拖动时，将 `_isDragging`设置为 `false`。
//    6.3 使用 `Opacity`组件根据 `_isDragging`状态调整悬浮窗的透明度。
//    6.4 使用 `Container`组件构建悬浮窗的背景和样式。
//    6.5 使用 `Column`组件布局悬浮窗的内容。
//       6.5.1 添加一个拖动把手，用于指示拖动区域。
//       6.5.2 使用 `Row`组件布局工具栏子项。



import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DraggableFloatingBarTestPage(),
    );
  }
}

class DraggableFloatingBarTestPage extends StatelessWidget {
  const DraggableFloatingBarTestPage({super.key});

  @override
  Widget build(BuildContext context)
   {
    return Scaffold(
      appBar: AppBar(title: const Text('Draggable Floating Bar Test')),
      body: Stack(
        children: [
          // 其他内容...
          DraggableFloatingBar(
            children: [
              IconButton(icon: const Icon(Icons.star), onPressed: () {}),
              IconButton(icon: const Icon(Icons.share), onPressed: () {}),
              IconButton(icon: const Icon(Icons.settings), onPressed: () {}),
            ],
          )
        ],
      ),
    );
  }
}




class DraggableFloatingBar extends StatefulWidget {
  final List<Widget> children; // 工具栏子项
  
  const DraggableFloatingBar({super.key, required this.children});

  @override
  State<DraggableFloatingBar> createState() => _DraggableFloatingBarState();
}

class _DraggableFloatingBarState extends State<DraggableFloatingBar> {
  Offset _offset = const Offset(0, 0); // 悬浮窗位置
  bool _isDragging = false; // 拖动状态
  final double _width = 200; // 悬浮窗默认宽度

  // 初始化悬浮窗位置和状态
  @override
  void initState() {
    super.initState();
    // 初始位置设置为屏幕右侧中间
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final size = MediaQuery.of(context).size;
      setState(() {
        _offset = Offset(
          size.width - _width - 20,
          size.height / 2 - 30,
        );
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: _offset.dx,
      top: _offset.dy,
      child: GestureDetector
        (
        // 拖动开始时，将 _isDragging 设置为 true
        onPanStart: (details) 
        {
          setState(() => _isDragging = true);
        },

        // 拖动过程中，更新 _offset 的位置，并进行边界检查
        onPanUpdate: (details) 
        {
          final newOffset = _offset + details.delta;
          final screenSize = MediaQuery.of(context).size;
          
          // 边界检查
          setState(() {
            _offset = Offset(
              newOffset.dx.clamp(0, screenSize.width - _width),
              newOffset.dy.clamp(0, screenSize.height - 60),
            );
          });
        },

        // 拖动结束时，将 _isDragging 设置为 false
        onPanEnd: (_) {
          setState(() => _isDragging = false);
        },


        // 构建悬浮窗UI
        child: Opacity(
          opacity: _isDragging ? 0.8 : 1.0,
          child: Container(
            width: _width,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.9),
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 10,
                  spreadRadius: 2,
                )
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // 拖动把手
                // Container(
                //   height: 30,
                //   decoration: BoxDecoration(
                //     color: Colors.blue[100],
                //     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                //   ),
                //   child: Center(
                //     child: Container(
                //       width: 40,
                //       height: 4,
                //       // decoration: BoxDecoration(
                //       //   color: Colors.blueGrey,
                //       //   borderRadius: BorderRadius.circular(2),
                //       // ),
                //     ),
                //   ),
                // ),
                // 工具栏内容
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: widget.children,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

