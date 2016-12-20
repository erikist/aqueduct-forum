import 'dart:convert';
import 'package:aqueduct_forum_frontend/models/post.dart';
import 'package:aqueduct_forum_frontend/models/thread.dart';
import 'package:aqueduct_forum_frontend/models/topic.dart';


class MockDataService implements _DataService {

  JSONDeserializationEngine deserializationEngine = new JSONDeserializationEngine();

  /*For Mocking Topics*/
  static var GENERAL_TOPIC_ID = 1;
  static var GENERAL_TOPIC_STRING = '{ "id" : $GENERAL_TOPIC_ID, "title" : "General" }';
  static var RANDOM_TOPIC_ID = 2;
  static var RANDOM_TOPIC_STRING = '{ "id" : $RANDOM_TOPIC_ID, "title" : "Random" }';
  static var TOPICS_STRING = '[$GENERAL_TOPIC_STRING , $RANDOM_TOPIC_STRING]';

  /*For Mocking Threads*/
  static var GENERAL_THREADS_STRING = '[$THREAD_1_STRING]';
  static var THREAD_1_ID = 1;
  static var THREAD_1_TITLE = 'Girl goes apeshit over Aqueduct", "authorId';
  static var THREAD_1_STRING = '{"id" : $THREAD_1_ID, "title" : "$THREAD_1_STRING", "authorId" : 1, "topicId" : $GENERAL_TOPIC_ID, "createDate" : "${new DateTime.now().toIso8601String()}"}';

  /*For Mocking Posts*/
  static var THREAD_1_POSTS_STRING = '[$POST_1_STRING]';
  static var POST_1_ID = 1;
  static var POST_1_STRING = '{ "id" : $POST_1_ID, "authorId" : 1, "threadId" : $THREAD_1_ID, "body" : "$POST_1_BODY", "createDate" : "${new DateTime.now().subtract(new Duration(days: 2)).toIso8601String()}" }';
  static var POST_1_BODY = "Has anyone else noticed that Joe doesn't wear shoes? Did Ludwig eat them?";

  @override
  List<Post> getPostsForThread(Thread thread) {
    if (thread.id == THREAD_1_ID) {
      return deserializationEngine.postsFromJSON(THREAD_1_POSTS_STRING);
    }

    return [];
  }

  @override
  List<Thread> getThreadsForTopic(Topic topic) {
    if (topic.id == GENERAL_TOPIC_ID) {
      return deserializationEngine.threadsFromJSON(GENERAL_THREADS_STRING);
    }

    return [];
  }

  @override
  List<Topic> getTopics() {
    return deserializationEngine.topicsFromJSON(TOPICS_STRING);
  }
}

class JSONDeserializationEngine {
  _JSONDecoder<Post> postDecoder = new _PostDecoder();
  _JSONDecoder<Topic> topicDecoder = new _TopicDecoder();
  _JSONDecoder<Thread> threadDecoder = new _ThreadDecoder();

  List<Post> postsFromJSON(String postsJson) => postDecoder._fromList(JSON.decode(postsJson));
  List<Thread> threadsFromJSON(String threadsJson) => threadDecoder._fromList(JSON.decode(threadsJson));
  List<Topic> topicsFromJSON(String topicsJson) => topicDecoder._fromList(JSON.decode(topicsJson));
}

class _PostDecoder extends _JSONDecoder<Post> {
  @override
  Post _fromMap(Map jsonMap) {
    return new Post()
      ..id = jsonMap['id']
      ..authorId = jsonMap['authorId']
      ..threadId = jsonMap['threadId']
      ..body = jsonMap['body']
      ..createDate = DateTime.parse(jsonMap['createDate']);
  }
}

class _TopicDecoder extends _JSONDecoder<Topic> {
  @override
  Topic _fromMap(Map jsonMap) {
    return new Topic()
      ..id = jsonMap['id']
      ..title = jsonMap['title'];
  }
}

class _ThreadDecoder extends _JSONDecoder<Thread> {
  @override
  Thread _fromMap(Map jsonMap) {
    return new Thread()
      ..id = jsonMap['id']
      ..title = jsonMap['title']
      ..authorId = jsonMap['authorId']
      ..topicId = jsonMap['topicId']
      ..createDate = DateTime.parse(jsonMap['createDate']);
  }
}

abstract class _JSONDecoder<T> {
  T _fromMap(Map jsonMap);
  List<T> _fromList(List jsonMapList) {
    var objectList = <T>[];
    for (Map jsonMap in jsonMapList) {
      objectList.add(_fromMap(jsonMap));
    }
    return objectList;
  }
}

abstract class _DataService {
  List<Topic> getTopics();
  List<Thread> getThreadsForTopic(Topic topic);
  List<Post> getPostsForThread(Thread thread);
}