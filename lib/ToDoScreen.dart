import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/toDoItems.dart';

import 'ToDoClass.dart';

class ToDoList extends StatefulWidget {
   ToDoList({Key? key}) : super(key: key);
  
  final todosList =  ToDo.toDoList();

  @override

  State<ToDoList> createState() => _ToDoListState();
}
TextEditingController todoController = TextEditingController();

class _ToDoListState extends State<ToDoList> {
  //get todoList => null;

  List<ToDo> searched=[];

  void _handelToDoChange(ToDo todo)
  {
    setState(() {
      todo.isdone= !todo.isdone;
    });
  }

  void deleteToDoItems (String id)
  {
    setState(() {
      widget.todosList.removeWhere((element) => element.id==id);
    });
  }

  void addTodoItems(String todo)
  {
    setState(() {
      widget.todosList.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(),
          todoText: todo));
    });
    todoController.clear();
  }

  void runFilter(String entred)
  {
    List<ToDo> result=[];
    if(entred.isEmpty)
      {
        result=widget.todosList;
      }
    else{
      result=widget.todosList.where((element) => element.
      todoText!.toLowerCase().contains(entred.toLowerCase())).toList();
    }
    setState(() {
      searched=result;
    });
  }

  @override
  void initState(){
    searched=widget.todosList;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      appBar: _buildAppBar(),
      body: Stack(
      children:[
      Container(
        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 15
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.circular(20)
              ),
              child: TextFormField(
                onChanged: (value)=>runFilter(value),
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.all(0),
                  prefixIcon: Icon(Icons.search,color: Colors.black,size: 20,),
                  prefixIconConstraints: BoxConstraints(
                    maxHeight: 20,minWidth: 30,
                  ),
                  border: InputBorder.none,
                  hintText: "Search"
                ),
              ),
            ),
            Expanded(child: ListView(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 20,bottom: 30),
                  child: Text("All ToDos",style: TextStyle(fontSize: 30,fontWeight:FontWeight.w500),),
                ),
                for(ToDo td in searched.reversed)
                ToDoItems(todo: td,onToDoChange: _handelToDoChange,
                onDeleteItem: deleteToDoItems,),
              ],
            ),),
          ],
        ),
      ),Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            children: [
              Expanded(child: Container(
                margin: EdgeInsets.only(bottom: 20,right: 20,left: 20),
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white,),
                child: TextField(
                  controller: todoController,
                  decoration: InputDecoration(
                    hintText: 'Add new item',
                    border: InputBorder.none,



                  ),
                ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20,right: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(60, 60)
                  ),
                  child: Text('+',style: TextStyle(fontSize: 40,fontWeight: FontWeight.bold),),
                  onPressed: (){
                        addTodoItems(todoController.text);
                    print("it is pressed");
                  },
                ),
              )
            ],
          ),
        )
      ],
      ),

    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.black12,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

          Container(height: 40,width: 40,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Icon(Icons.person_pin,size: 30,)
              //Image.asset('assets/images/imaage.jpg')
             ),
          ),
          Icon(Icons.menu,color: Colors.black,size: 30,),
        ],
      ),
    );
  }
}
