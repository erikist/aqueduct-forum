import 'package:aqueduct_forum_frontend/models/identifiable.dart';
import 'package:aqueduct_forum_frontend/models/thread.dart';

class Topic implements Identifiable {
  int id;
  String title;
  String description;
  String imageUrl;

  List<Thread> threads;
}