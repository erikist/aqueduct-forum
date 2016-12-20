import 'package:angular2/core.dart';
import 'package:aqueduct_forum_frontend/models/user.dart';

@Injectable()
class ForumService {

  static User currentUser;

  void login(String username, String password) {
    currentUser = MockFactory.mock(user: currentUser, username: username);
  }
}

class MockFactory {
  static User mock({User user, String username, String gravitarUrl}) {
    user ??= new User();
    user.username = username ?? "erikist";
    user.gravitarUrl = gravitarUrl ?? "https://avatars2.githubusercontent.com/u/4492147";
    return user;
  }
}