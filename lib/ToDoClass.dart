class ToDo {
  String? id;
  String? todoText;
  bool isdone;

  ToDo(
  {
    required this.id,
    required this.todoText,
    this.isdone=false
});
  static List<ToDo> toDoList(){
    return [

    ];


  }
}