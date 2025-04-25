import 'package:mysql_client/mysql_client.dart';
class SqlConnection{
  Future<MySQLConnection> sqlConnect() async {
    final connection = await MySQLConnection.createConnection(
      host: '10.0.2.2',
      port: 3306,
      userName:'root',
      password: 'ted27@omondi',
      databaseName: 'ordering_app',
    );
    return connection;
  }
}
SqlConnection sqlConn=SqlConnection();




