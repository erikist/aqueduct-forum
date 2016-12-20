import 'dart:convert';
import 'dart:mirrors';
import 'package:aqueduct_forum_frontend/models/thread.dart';
import 'package:aqueduct_forum_frontend/models/user.dart';

class Post {
  int id;
  int threadId;
  int authorId;
  String body;
  DateTime createDate;

  Thread thread;
  User author;
}
