import 'package:flutter/material.dart';
import 'package:flutter_keys_homework/my_data.dart';
class MyListDragAndDrop extends StatefulWidget {
  const MyListDragAndDrop({super.key});

  @override
  _MyListDragAndDropState createState() => _MyListDragAndDropState();
}

class _MyListDragAndDropState extends State<MyListDragAndDrop> {
  final List<MyData> _myDataList = [
    MyData(UniqueKey(), 'Sharif 1',"+998914419529",DateTime.now().toString()),
    MyData(UniqueKey(), 'Sharif 2',"+998931009529",DateTime.now().toString()),
    MyData(UniqueKey(), 'Sharif 3',"+998946248844",DateTime.now().toString()),
    MyData(UniqueKey(), 'Firdavs  1',"+998330380407",DateTime.now().toString()),
    MyData(UniqueKey(), 'Firdavs  2',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Aziz',"+998914419529",DateTime.now().toString()),
    MyData(UniqueKey(), 'Jaxon  (timon)',"+998931009529",DateTime.now().toString()),
    MyData(UniqueKey(), 'Jaxon (Pumba)',"+998906366788",DateTime.now().toString()),
    MyData(UniqueKey(), 'Alish ',"+998949067377",DateTime.now().toString()),
    MyData(UniqueKey(), 'Hayot',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Azizchon',"+998991234567",DateTime.now().toString()),
    MyData(UniqueKey(), 'Laziz',"+998991234567",DateTime.now().toString()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Key Example'),
        backgroundColor: Colors.red,
      ),
      body: ReorderableListView(
        children: _myDataList.map((MyData data) {
          return Dismissible(
            key: data.key,
            onDismissed: (direction) {
              setState(() {
                _myDataList.remove(data);
              });
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${data.name} removed'),
                  duration: const Duration(seconds: 2),
                ),
              );
            },
            background: Container(
              color: Colors.red, // Background color when swiped
              alignment: Alignment.centerRight,
              child: const Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(
                  Icons.delete,
                  color: Colors.red,
                ),
              ),
            ),
            child: ListTile(
              key: data.key,
              title: Text(data.name),
              subtitle: Text(data.phone),
            ),
          );
        }).toList(),
        onReorder: (int oldIndex, int newIndex) {
          setState(() {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final MyData item = _myDataList.removeAt(oldIndex);
            _myDataList.insert(newIndex, item);
          });
        },
      ),
    );
  }
}