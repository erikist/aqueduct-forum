// Copyright (c) 2016, Erik Rahtjen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/angular2.dart';
import 'package:angular2/src/router/route_config/route_config_impl.dart';
import 'package:aqueduct_forum_frontend/components/login/component.dart';
import 'package:angular2/router.dart';
import 'package:aqueduct_forum_frontend/components/welcome/component.dart';
import 'package:aqueduct_forum_frontend/forum_service.dart';
import 'package:aqueduct_forum_frontend/models/user.dart';

@Component(
    selector: 'forum',
    styleUrls: const ['component.css'],
    templateUrl: 'component.html',
    providers: const[ForumService, ROUTER_PROVIDERS],
    directives: const [ROUTER_DIRECTIVES])

@RouteConfig(const [
  const Route(path: '/login', name: 'Login', component: LoginComponent),
  const Route(path: '/welcome', name: 'Welcome', component: WelcomeComponent)
])

class AppComponent {
  ForumService _service;

  AppComponent(ForumService service) {
    _service = service;
  }
}
