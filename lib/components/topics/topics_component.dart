import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:aqueduct_forum_frontend/models/data_coordinator.dart';
import 'package:aqueduct_forum_frontend/models/topic.dart';
import 'package:ng_bootstrap/components/table/table_directives.dart';
import 'package:ng_bootstrap/components/tabsx/tabsx.dart';
import 'package:ng_bootstrap/components/pagination/pagination.dart';

@Component(
    selector: 'topics',
    styleUrls: const ['topics_component.css'],
    templateUrl: 'topics_component.html',)
class TopicsComponent implements OnInit {
  DataCoordinator _coordinator;
  Router _router;

  List<Topic> topics = [];

  TopicsComponent(DataCoordinator coordinator, Router router) {
    _coordinator = coordinator;
    _router = router;
  }

  @override
  ngOnInit() {
    // TODO: implement ngOnInit
    topics.addAll(_coordinator.getTopics());
  }

  void topicClicked(Topic topic) {
    _router.navigate([
      'Threads',
      {'topic_id': topic.id.toString()}
    ]);
  }
}