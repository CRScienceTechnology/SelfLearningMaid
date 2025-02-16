	import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}
 
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}
 
class _HomePageState extends State<HomePage> {
  final GlobalKey<OverlayState> overlayKey = GlobalKey<OverlayState>();
  OverlayEntry? overlayEntry;
 
  void _createOverlayEntry() {
    if (overlayEntry != null) return;
 
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        top: 100.0,
        left: 100.0,
        child: Draggable(
          feedback: Material(
            elevation: 4.0,
            child: Container(
              width: 200,
              height: 100,
              color: Colors.blueAccent,
              child: Center(
                child: Text('悬浮窗', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
          childWhenDragging: Container(),
          onDraggableCanceled: (velocity, offset) {
            setState(() {
              overlayEntry?.remove();
              overlayEntry = null;
            });
          }, child: null,
        ),
      ),
    );
 
    overlayKey.currentState?.insert(overlayEntry!);
  }
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('应用内悬浮窗示例')),
      body: Center(
        child: ElevatedButton(
          onPressed: _createOverlayEntry,
          child: Text('新建悬浮窗'),
        ),
      ),
      overlayKey: overlayKey,
    );
  }
}

//TODO:2025.2.17 实现应用内悬浮窗功能