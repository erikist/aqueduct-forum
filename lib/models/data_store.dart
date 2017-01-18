import 'package:aqueduct_forum_frontend/models/identifiable.dart';
import 'package:aqueduct_forum_frontend/models/post.dart';
import 'package:aqueduct_forum_frontend/models/thread.dart';
import 'package:aqueduct_forum_frontend/models/topic.dart';

class DataStore {
  _ModelStore<Topic> _topics = new _ModelStore<Topic>();
  _ModelStore<Post> _posts = new _ModelStore<Post>();
  _ModelStore<Thread> _threads = new _ModelStore<Thread>();

  void storeTopic(Topic topic) => _topics.store(topic);
  void storePost(Post post) => _posts.store(post);
  void storeThread(Thread thread) => _threads.store(thread);
  Topic retrieveTopic(int id) => _topics.retrieve(id);
  Post retrievePost(int id) => _posts.retrieve(id);
  Thread retrieveThread(int id) => _threads.retrieve(id);

  DataStore();

  List<Topic> getTopicList() {
    return _topics.all;
  }

  List<Thread> getThreadsByTopic(Topic topic) {
    return _threads.all.where((Thread thread) => thread.topicId == topic.id);
  }
}

class _ModelStore<T extends Identifiable> {
  Map<int, T> _store = {};

  List<T> get all {
    return _store.values.toList();
  }

  void store(T item) {
    _store[item.id] = item;
  }

  T retrieve(int id) {
    return _store[id];
  }

  _ModelStore();
}