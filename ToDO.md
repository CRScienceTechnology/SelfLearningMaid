1. **创建主应用程序**
   * 定义 `MyApp`类，继承自 `StatelessWidget`。
   * 在 `build`方法中返回 `MaterialApp`，并将 `DraggableFloatingBarTestPage`设置为首页。
2. **创建测试页面**
   * 定义 `DraggableFloatingBarTestPage`类，继承自 `StatelessWidget`。
   * 在 `build`方法中返回 `Scaffold`，包含一个 `AppBar`和一个 `Stack`。
   * 在 `Stack`中添加 `DraggableFloatingBar`组件，并传入工具栏子项（如 `IconButton`）。
3. **定义可拖动悬浮工具栏组件**
   * 定义 `DraggableFloatingBar`类，继承自 `StatefulWidget`。
   * 接受一个 `List<Widget>`类型的 `children`参数，用于存储工具栏子项。
4. **管理悬浮工具栏的状态**
   * 定义 `_DraggableFloatingBarState`类，继承自 `State<DraggableFloatingBar>`。
   * 初始化 `_offset`为 `Offset(0, 0)`，表示悬浮窗的位置。
   * 初始化 `_isDragging`为 `false`，表示当前是否正在拖动。
   * 初始化 `_width`为 `200`，表示悬浮窗的默认宽度。
5. **设置初始位置**
   * 在 `initState`方法中，使用 `WidgetsBinding.instance.addPostFrameCallback`获取屏幕尺寸。
   * 将悬浮窗初始位置设置为屏幕右侧中间。
6. **构建悬浮工具栏UI**
   * 使用 `Positioned`组件根据 `_offset`设置悬浮窗的位置。
   * 使用 `GestureDetector`组件监听拖动事件。
     * `onPanStart`：开始拖动时，将 `_isDragging`设置为 `true`。
     * `onPanUpdate`：拖动过程中，更新 `_offset`的位置，并进行边界检查。
     * `onPanEnd`：结束拖动时，将 `_isDragging`设置为 `false`。
   * 使用 `Opacity`组件根据 `_isDragging`状态调整悬浮窗的透明度。
   * 使用 `Container`组件构建悬浮窗的背景和样式。
   * 使用 `Column`组件布局悬浮窗的内容。
     * 添加一个拖动把手，用于指示拖动区域。
     * 使用 `Row`组件布局工具栏子项。
