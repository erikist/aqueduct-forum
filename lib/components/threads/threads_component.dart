// Copyright (c) 2016, Erik Rahtjen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:aqueduct_forum_frontend/forum_service.dart';
import 'package:aqueduct_forum_frontend/models/data_coordinator.dart';
import 'package:aqueduct_forum_frontend/models/thread.dart';
import 'package:aqueduct_forum_frontend/models/topic.dart';

@Component(
    selector: 'login',
    styleUrls: const ['threads_component.css'],
    templateUrl: 'threads_component.html')

class ThreadsComponent implements OnInit {

  DataCoordinator _coordinator;
  Router _router;
  RouteParams _routeParams;

  Topic topic;
  List<Thread> threads;

  ThreadsComponent(DataCoordinator coordinator, Router router, RouteParams routeParams) {
    _coordinator = coordinator;
    _router = router;
    _routeParams = routeParams;
  }

  @override
  ngOnInit() {
    var _id = _routeParams.get('topic_id');
    var id = int.parse(_id ?? '', onError: (_) => null); //TODO: improve this
    topic = _coordinator.getTopicById(id);

    threads = _coordinator.getThreadsByTopic(topic);
  }
}
