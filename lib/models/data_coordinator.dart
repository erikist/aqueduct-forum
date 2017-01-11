import 'package:angular2/core.dart';
import 'package:aqueduct_forum_frontend/models/data_service.dart';
import 'package:aqueduct_forum_frontend/models/data_store.dart';
import 'package:aqueduct_forum_frontend/models/topic.dart';

@Injectable()
class DataCoordinator {
  DataService _service = new MockDataService(); //TODO: Switch to non mock data
  DataStore _store = new DataStore();

  List<Topic> getTopics() {
    if (_store.getTopicList().length == 0) {
      for (Topic topic in _service.fetchTopics()) {
        _store.storeTopic(topic);
      }
    }
    return _store.getTopicList().toList();
  }

  DataCoordinator();

  Topic getTopicById(int id) {
    return _store.getTopicList().toList().firstWhere((Topic topic) { return topic.id == id; });
  }
}