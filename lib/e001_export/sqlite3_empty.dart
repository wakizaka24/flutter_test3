import 'dart:collection';

class ResultSet with ListMixin<Row> {
  final List<List<Object?>> rows = [];

  @override
  Iterator<Row> get iterator => _ResultIterator(this);

  @override
  Row operator [](int index) => Row(this, rows[index]);

  @override
  void operator []=(int index, Row value) {
    throw UnsupportedError("Can't change rows from a result set");
  }

  @override
  int length = 0;
}

class _ResultIterator extends Iterator<Row> {
  final ResultSet result;
  int index = -1;

  _ResultIterator(this.result);

  @override
  Row get current => Row(result, result.rows[index]);

  @override
  bool moveNext() {
    index++;
    return index < result.rows.length;
  }
}

class Row {
  Row(ResultSet result, List<Object?> row);

  Row? operator [](Object? key) {
    throw UnimplementedError();
  }

  void operator []=(String key, Row value) {
  }
}

class Database {
  void execute(String s) {}

  prepare(String s) {}

  ResultSet select(String s, List<String> list) {
    return ResultSet();
  }

  void dispose() {}
}

mixin sqlite3 {
  static Database openInMemory() {
    return Database();
  }

  static Database open(String join) {
    return Database();
  }
}