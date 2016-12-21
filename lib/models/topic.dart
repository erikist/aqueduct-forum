import 'package:aqueduct_forum_frontend/models/identifiable.dart';
import 'package:aqueduct_forum_frontend/models/thread.dart';

class Topic implements Identifiable {
  int id;
  String title;

  List<Thread> threads;
}