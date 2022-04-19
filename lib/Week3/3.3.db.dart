import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class data {
  Future<Database> dbs() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE emp (id INTEGER PRIMARY KEY, email TEXT, password TEXT)');
    });
    return database;
  }

  Future<void> datainsert(
      Database database, String Email, String Password) async {
    String qur = "insert into emp(email,password) values('$Email','$Password')";

    int count = await database.rawInsert(qur);
    print(count);
  }

  Future<List<Map>> viewdata(Database database) async {
    String qur = "Select * from emp";
    List<Map> lst = await database.rawQuery(qur);
    return lst;
  }

  Future<void> deleteUser(Database database, int userid) async {
    String qur ="delete from emp where id ='$userid'";
    await database.rawDelete(qur);
  }

  Future<void> dataupdate(Database database, int userid, String Email, String Password)
  async {
    String qur =  "update emp SET email='$Email',password='$Password' where id='$userid'";
    await database.rawUpdate(qur);
  }
}
