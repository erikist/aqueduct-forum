import 'package:aqueduct_forum_frontend/models/post.dart';
import 'package:aqueduct_forum_frontend/models/topic.dart';
import 'package:aqueduct_forum_frontend/models/user.dart';

class Thread {
  String title;
  int id;
  int authorId;
  int topicId;
  DateTime createDate;
  DateTime lastUpdatedDate;

  Topic topic;
  List<Post> posts;
}