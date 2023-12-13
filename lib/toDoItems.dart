import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ToDoClass.dart';

class ToDoItems extends StatelessWidget {

   ToDoItems({Key? key, required this.todo, required this.onToDoChange,
     required this.onDeleteItem}) : super(key: key);


 // final todoslist= ToDo.toDoList();
  final ToDo todo;
  final onToDoChange;
  final onDeleteItem;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: (){
          onToDoChange(todo) ;
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor:Colors.white,
        leading: Icon( todo.isdone?Icons.check_box : Icons.check_box_outline_blank,color: Colors.blue,),
        title: Text(todo.todoText!,style: TextStyle(fontSize: 15,color: Colors.black,
        decoration: todo.isdone? TextDecoration.lineThrough:null),),
        trailing:
        // Container(
        //   padding: EdgeInsets.all(0),
        //   margin: EdgeInsets.symmetric(vertical: 12),
        //   height: 25,width: 25 ,
        //   decoration: BoxDecoration(
        //     color: Colors.redAccent,
        //       borderRadius: BorderRadius.circular(5),
        //   ),
        //   child:
          IconButton(
            color: Colors.redAccent,
            iconSize: 25,
            icon: Icon(Icons.delete_forever),
            onPressed: () {
              onDeleteItem(todo.id);
            },

          ),
        ),
     // ),
    );
  }
}
