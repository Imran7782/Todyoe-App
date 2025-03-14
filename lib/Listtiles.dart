import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:today/main.dart';

class ListTiles extends StatefulWidget {

  @override
  State<ListTiles> createState() => _ListTilesState();
}

class _ListTilesState extends State<ListTiles> {
  late bool value = false;
  


  // void Toggel(bool? CheckboxStete) {
  //   setState(() {
  //     value = CheckboxStete!;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final index=Provider.of<Task>(context).ind;
    final text=Provider.of<Task>(context).tasks[index];
    return ListTile(
      
        onLongPress: () {
        Provider.of<Task>(context).delete(text);
        },
        title: Text(text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
                decoration:
                    value ? TextDecoration.lineThrough : TextDecoration.none,
                decorationStyle: TextDecorationStyle.solid)),
        trailing: Checkbox(
          value: value,
          onChanged: (bool? CheckboxStete) => setState(() {
            value=CheckboxStete!;
          }),));
  }
}

// class TaskCheckBox extends StatelessWidget {
//   final ValueChanged<bool?> onChanged;
//   final bool CheckboxStete;
//   TaskCheckBox(this.onChanged, this.CheckboxStete);
//   @override
//   Widget build(BuildContext context) {
//     return Checkbox(
//       value: CheckboxStete,
//       onChanged: onChanged,
//     );
//   }
// }
