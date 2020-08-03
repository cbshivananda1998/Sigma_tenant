import 'package:flutter/material.dart';
import 'package:flutter_app/task_data.dart';
import 'package:flutter_app/widgets/dataTile.dart';
import 'package:provider/provider.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TagData>(
      builder: (context, tagData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = tagData.getAllData[index];
            return Tile(
              name: task.displayName,
              description: task.description,
              meta: task.metaTag,
            );
          },
          itemCount: tagData.dataCount,
        );
      },
    );
  }
}
