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
    templateUrl: 'topics_component.html',
    directives: const [BS_TABLE_DIRECTIVES])
class TopicsComponent implements OnInit {
  DataCoordinator _coordinator;

  List<Topic> topics = [];

  num page = 1;
  num itemsPerPage = 10;
  num maxSize = 5;
  num totalPages;
  num length = 0;

  TopicsComponent(DataCoordinator coordinator) {
    _coordinator = coordinator;
  }

  @override
  ngOnInit() {
    // TODO: implement ngOnInit
    topics.addAll(_coordinator.getTopics());
  }
}