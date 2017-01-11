// Copyright (c) 2016, Erik Rahtjen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular2/src/router/route_config/route_config_impl.dart';
import 'package:aqueduct_forum_frontend/components/login/component.dart';
import 'package:angular2/router.dart';
import 'package:aqueduct_forum_frontend/components/threads/threads_component.dart';
import 'package:aqueduct_forum_frontend/components/topics/topics_component.dart';
import 'package:aqueduct_forum_frontend/components/welcome/component.dart';
import 'package:aqueduct_forum_frontend/forum_service.dart';
import 'package:aqueduct_forum_frontend/models/data_coordinator.dart';
import 'package:aqueduct_forum_frontend/models/user.dart';

@Component(
    selector: 'forum',
    styleUrls: const ['component.css'],
    templateUrl: 'component.html',
    providers: const[ForumService, DataCoordinator],
    directives: const [ROUTER_DIRECTIVES])

@RouteConfig(const [
  const Route(path: '/login', name: 'Login', component: LoginComponent),
  const Route(path: '/topics', name: 'Topics', component: TopicsComponent, useAsDefault: true),
  const Route(path: '/topics/:topic_id', name: "Threads", component: ThreadsComponent),
  const Route(path: '/welcome', name: 'Welcome', component: WelcomeComponent)
])

class AppComponent {
  ForumService _service;
  DataCoordinator _coordinator;

  AppComponent(ForumService service, DataCoordinator coordinator) {
    _service = service;
    _coordinator = coordinator;
  }
}
