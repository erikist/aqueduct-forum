// Copyright (c) 2016, Erik Rahtjen. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';

import 'package:angular2/platform/common.dart';
import 'package:angular2/src/router/router_providers.dart';
import 'package:aqueduct_forum_frontend/components/app/component.dart';

main() {
  bootstrap(AppComponent, [
    provide(Client, useFactory: () => new BrowserClient(), deps: []),
    ROUTER_PROVIDERS,
    provide(APP_BASE_HREF, useValue: '/'),
    provide(LocationStrategy, useClass: HashLocationStrategy)
  ]);
}
