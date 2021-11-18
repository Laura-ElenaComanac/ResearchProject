import 'package:flutter/material.dart';
import 'package:projyproject/model/user.dart';
import 'package:projyproject/repository/fake_repo.dart';
import 'package:projyproject/shared/menu_bottom.dart';
import 'package:projyproject/shared/menu_drawer.dart';
import 'package:projyproject/main.dart';
import 'package:projyproject/view_model/user_list_view_model.dart';
import 'package:projyproject/widgets/users_list_widget.dart';
import 'package:rxdart/rxdart.dart';
import 'dart:async';
import 'package:provider/provider.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({Key? key}) : super(key: key);

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  @override
  Widget build(BuildContext context) {
    List<User> users = Provider.of<UserListViewModel>(context).users;

    return Scaffold(
        appBar: AppBar(
          title: const Text('Projy'),
          backgroundColor: Colors.purple,
        ),
        drawer: MenuDrawer(),
        bottomNavigationBar: MenuBottom(),
        body: UsersListWidget(users, (int index) {
          Provider.of<UserListViewModel>(context, listen: false)
              .deleteUser(users[index].id);
        }));
  }
}
