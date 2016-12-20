// Copyright (c) 2016, Erik Rahtjen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2/router.dart';
import 'package:aqueduct_forum_frontend/forum_service.dart';

@Component(
    selector: 'login',
    styleUrls: const ['component.css'],
    templateUrl: 'component.html')

class LoginComponent {

  ForumService _service;
  Router _router;

  String username = "";
  String password = "";


  LoginComponent(ForumService service, Router router) {
    _service = service;
    _router = router;
  }

  void onLoginPressed() {
    print("Tryna Navigate");
    _router.navigate([
      'Welcome'
    ]);
  }
}
