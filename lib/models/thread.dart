import 'package:aqueduct_forum_frontend/models/identifiable.dart';
import 'package:aqueduct_forum_frontend/models/post.dart';
import 'package:aqueduct_forum_frontend/models/topic.dart';

class Thread implements Identifiable {
  String title;
  int id;
  int authorId;
  int topicId;
  DateTime createDate;
  DateTime lastUpdatedDate;

  Topic topic;
  List<Post> posts;
}