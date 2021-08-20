import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DialogRoute1 extends StatefulWidget {
  DialogRoute1({Key? key}) : super(key: key);

  @override
  _DialogRoute1State createState() => _DialogRoute1State();
}

class _DialogRoute1State extends State<DialogRoute1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          ElevatedButton(
            child: Text('对话框1'),
            onPressed: () async {
              var deleteTree = await showDeleteConfirmDialog1();
              print(deleteTree);
            },
          ),
          ElevatedButton(
            child: Text("对话框2（复选框可点击）StatefulBuilder 局部刷新"),
            onPressed: () async {
              var delete = await showDeleteConfirmDialog2();
              if (delete == null) {
                print("取消删除");
              } else {
                print("同时删除子目录: $delete");
              }
            },
          ),
          ElevatedButton(
            child: Text("话框3（复选框可点击）markNeedsBuild "),
            onPressed: () async {
              var deleteTree = await showDeleteConfirmDialog3();
              if (deleteTree == null) {
                print("取消删除");
              } else {
                print("同时删除子目录: $deleteTree");
              }
            },
          ),
          ElevatedButton(
            child: Text("选择语言"),
            onPressed: () => changeLanguage(),
          ),
          ElevatedButton(
            child: Text("显示列表对话框"),
            onPressed: () => showListDialog(),
          ),
          ElevatedButton(
            child: Text("显示底部菜单列表(模态)"),
            onPressed: () async {
              int type = await _showModalBottomSheet();
              print(type);
            },
          ),
          ElevatedButton(
            child: Text("显示底部菜单列表(非模态)"),
            onPressed: () async {
              _showBottomSheet();
            },
          ),
          ElevatedButton(
            child: Text("显示Loading框"),
            onPressed: () async {
              showLoadingDialog();
            },
          ),
          ElevatedButton(
            child: Text("打开Material风格的日历选择框"),
            onPressed: () async {
              _showDatePicker1();
            },
          ),
          ElevatedButton(
            child: Text("打开iOS风格的日历选择框"),
            onPressed: () async {
              _showDatePicker2();
            },
          ),
        ],
      ),
    );
  }

  Future showDeleteConfirmDialog1() async {
    return showDialog(
      context: context,
      useRootNavigator: true,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Text("您确定要删除当前文件吗?"),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(false),
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(true),
              child: Text("删除"),
              style: TextButton.styleFrom(
                textStyle: TextStyle(
                  fontSize: 20.0,
                  color: Colors.red,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  Future showDeleteConfirmDialog2() async {
    bool _withTree = false;

    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("提示"),
          content: StatefulBuilder(
            builder: (BuildContext context, StateSetter setState) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text("您确定要删除当前文件吗?"),
                  Row(
                    children: [
                      Text("同时删除子目录？"),
                      Checkbox(
                        value: _withTree,
                        onChanged: (value) => {
                          setState(() {
                            _withTree = value!;
                          })
                        },
                      ),
                    ],
                  )
                ],
              );
            },
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text("取消"),
            ),
            TextButton(
              onPressed: () => Navigator.of(context).pop(_withTree),
              child: Text("删除"),
            ),
          ],
        );
      },
    );
  }

  Future showDeleteConfirmDialog3() async {
    bool _withTree = false;
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("提示"),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text("您确定要删除当前文件吗?"),
              Row(
                children: [
                  Text("同时删除子目录？"),
                  Builder(
                    builder: (context) {
                      return Checkbox(
                        value: _withTree,
                        onChanged: (value) {
                          (context as Element).markNeedsBuild();
                          _withTree = !_withTree;
                        },
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
          actions: <Widget>[
            TextButton(
              child: Text("取消"),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: Text("删除"),
              onPressed: () {
                // 执行删除操作
                Navigator.of(context).pop(_withTree);
              },
            ),
          ],
        );
      },
    );
  }

  Future changeLanguage() async {
    var i = await showDialog(
      context: context,
      builder: (context) {
        return SimpleDialog(
          title: Text('请选择语言'),
          children: [
            ElevatedButton(
              onPressed: () => Navigator.pop(context, 1),
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text('中文简体'),
              ),
            ),
            SimpleDialogOption(
              onPressed: () => {Navigator.pop(context, 2)},
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 6),
                child: Text('美国英语'),
              ),
            ),
          ],
        );
      },
    );

    if (i != null) {
      print("选择了：${i == 1 ? "中文简体" : "美国英语"}");
    }
  }

  Future showListDialog() async {
    var index = await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Column(
            children: [
              ListTile(title: Text("请选择")),
              Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Text("$index"),
                      onTap: () => Navigator.of(context).pop(index),
                    );
                  },
                  itemCount: 30,
                ),
              ),
            ],
          ),
        );
      },
    );
    if (index != null) {
      print("点击了：$index");
    }
  }

  Future _showModalBottomSheet() async {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
              onTap: () => Navigator.of(context).pop(index),
            );
          },
          itemCount: 30,
        );
      },
    );
  }

  // PersistentBottomSheetController
  Future _showBottomSheet() async {
    return showBottomSheet(
      context: context,
      builder: (context) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return ListTile(
              title: Text("$index"),
              onTap: () {
                print("$index");
                Navigator.of(context).pop();
              },
            );
          },
          itemCount: 30,
        );
      },
    );
  }

  Future showLoadingDialog() async {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return UnconstrainedBox(
          constrainedAxis: Axis.vertical,
          child: SizedBox(
            width: 280,
            child: AlertDialog(
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  CircularProgressIndicator(),
                  Padding(
                    padding: EdgeInsets.only(top: 26.0),
                    child: Text("正在加载，请稍后..."),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Future _showDatePicker1() async {
    var date = DateTime.now();
    return showDatePicker(
      context: context,
      initialDate: date,
      firstDate: date,
      lastDate: date.add(
        Duration(days: 365),
      ),
    );
  }

  Future _showDatePicker2() async {
    var date = DateTime.now();
    return showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return SizedBox(
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.dateAndTime,
            onDateTimeChanged: (DateTime value) {
              print(value);
            },
          ),
        );
      },
    );
  }
}
