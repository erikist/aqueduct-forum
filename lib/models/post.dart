import 'package:aqueduct_forum_frontend/models/identifiable.dart';
import 'package:aqueduct_forum_frontend/models/thread.dart';
import 'package:aqueduct_forum_frontend/models/user.dart';

class Post implements Identifiable {
  int id;
  int threadId;
  int authorId;
  String body;
  DateTime createDate;

  Thread thread;
  User author;
}
