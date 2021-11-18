import 'package:flutter/cupertino.dart';
import 'package:projyproject/model/user.dart';
import 'package:projyproject/repository/fake_repo.dart';

class UserListViewModel with ChangeNotifier {
  final List<User> _users = FakeRepo.getUsers();
  User? _user;

  User? get user {
    return _user;
  }

  void updateUser(User user) {
    FakeRepo.update(user);
    notifyListeners();
  }

  void setUser(User user) {
    _user = user;
    notifyListeners();
  }

  List<User> get users {
    return _users;
  }

  void addUser(User user) {
    FakeRepo.save(user);
    notifyListeners();
  }

  void deleteUser(String index) {
    FakeRepo.delete(index);
    notifyListeners();
  }
}
