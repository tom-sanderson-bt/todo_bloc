import 'package:uuid/uuid.dart';

const uuid = Uuid();

class Todo {
  final String id;
  final String title;
  final bool isCompleted;

  Todo({
    id,
    required this.title,
    this.isCompleted = false,
  }) : id = id ?? uuid.v4();
}
