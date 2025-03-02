

import 'package:sqflite/sqflite.dart'as sql;



class SQL_Function {
  //create database
  static Future<sql.Database> OpenDb() async {
    return sql.openDatabase('mycontact', version: 1,
        onCreate: (sql.Database db, int version) async {
          await createTable(db);
        });
  }


  //create Table
  static Future<void> createTable(sql.Database db) async {
    await db.execute( 'CREATE TABLE contact (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, cname TEXT, cnumber TEXT)');
  }

  //INSERT NEW DATA TO DB

  static Future<int> addnewContact(String name, String number) async {
    final db = await SQL_Function.OpenDb();
    final data = {"cname":name,"cnumber":number};
    final id = await db.insert("contact", data);
    return id ;
  }
//read all data from db
  static Future<List<Map<String,dynamic>>> readcontact() async{
    final db = await SQL_Function.OpenDb();
    return db.query("contact",orderBy: 'id');
  }

  static Future <int> updatecontactt(int id, String name, String num) async {
    final db = await SQL_Function.OpenDb();
    final updatedata = {
      'cname': name,
      'cnumber': num,


    };

    final updateid = db.update(
        'contact', updatedata, where: 'id=?', whereArgs: [id]);
    return updateid;
  }

  static Future<void> deletecontactt(int id) async{
    final db = await SQL_Function.OpenDb();
    try {
      await db.delete('contact', where: 'id=?',whereArgs: [id]);
    }catch(e){
      print("somthing went wrong $e");
    }
  }}