import 'package:database_sqlite/view.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main()
{
  runApp(MaterialApp(debugShowCheckedModeBanner: false,home: Home(),));
}
class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  static Database ?database;

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  initState() {
    super.initState();
    // Add listeners to this class
    getsql();
  }

  getsql()
async {
  // Get a location using getDatabasesPath
  var databasesPath = await getDatabasesPath();
  String path = join(databasesPath, 'demo.db');

  Home.database = await openDatabase(path, version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await db.execute(
            'CREATE TABLE test (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT,contact TEXT)');
      });

}
TextEditingController t1=TextEditingController();
TextEditingController t2=TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Sqlite"),),
      body: Column(children: [
        TextField(controller: t1,),
        TextField(controller: t2,),
        ElevatedButton(onPressed: () {
          String name=t1.text;
          String contact=t2.text;

          String sql="insert into test values(null,'$name','$contact')";
          Home.database!.rawInsert(sql);
          setState(() {

          });
          print(sql);
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
