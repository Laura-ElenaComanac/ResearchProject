import 'package:flutter/material.dart';
import 'package:projyproject/model/user.dart';
import 'package:projyproject/view_model/user_list_view_model.dart';
import 'package:provider/provider.dart';

class UsersListWidget extends StatefulWidget {
  final List<User> users;
  final Function deleteFunction;
  const UsersListWidget(this.users, this.deleteFunction, {Key? key})
      : super(key: key);

  @override
  _UsersListWidgetState createState() => _UsersListWidgetState();
}

class _UsersListWidgetState extends State<UsersListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: widget.users.length,
        itemBuilder: (context, index) {
          final user = widget.users[index];
          final struser = widget.users[index].toString();

          return Dismissible(
            confirmDismiss: (DismissDirection direction) async {
              return await showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Confirm"),
                    content: const Text(
                        "Are you sure you wish to delete this item?"),
                    actions: <Widget>[
                      TextButton(
                          onPressed: () => Navigator.of(context).pop(true),
                          child: const Text("DELETE")),
                      TextButton(
                        onPressed: () => Navigator.of(context).pop(false),
                        child: const Text("CANCEL"),
                      ),
                    ],
                  );
                },
              );
            },
            key: UniqueKey(),
            onDismissed: (direction) {
              widget.deleteFunction(index);
            },
            background: Container(color: Colors.red),
            child: StreamBuilder(builder: (context, snapshot) {
              return Column(children: [
                ListTile(
                  onTap: () {
                    Provider.of<UserListViewModel>(context, listen: false)
                        .setUser(user);
                  },
                  title: Text(struser),
                ),
              ]);
            }),
          );
        });
  }
}
