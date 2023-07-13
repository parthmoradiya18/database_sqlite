import 'package:database_sqlite/main.dart';
import 'package:database_sqlite/view.dart';
import 'package:flutter/material.dart';

class edit extends StatefulWidget {
Map l;
edit(this.l);

  @override
  State<edit> createState() => _editState();
}

class _editState extends State<edit> {
  TextEditingController t1 = TextEditingController();
  TextEditingController t2=TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  t1.text=widget.l['name'];
  t2.text=widget.l['contact'];

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("UPdate"),),
      body: Column(children: [
        TextField(controller: t1,),
        TextField(controller: t2,),
        ElevatedButton(onPressed: () {
          String name=t1.text;
          String contact =t2.text;
          if(widget.l!=null)
            {
              String sql="update test set name='$name',contact='$contact' where id='${widget.l['id']}'";
              Home.database!.rawUpdate(sql);
              setState(() {

              });
            }

          setState(() {

          });
        }, child: Text("submit")),
        ElevatedButton(onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return view();
          },));
        }, child: Text("view"))


      ],),

    );
  }
}
