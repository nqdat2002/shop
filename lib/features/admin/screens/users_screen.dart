import 'package:flutter/material.dart';
import 'package:shop/common/widgets/loader.dart';
import 'package:shop/features/admin/screens/add_product_screen.dart';
import 'package:shop/features/admin/services/admin_services.dart';
import 'package:shop/models/user.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  List<User>? users;
  final AdminServices adminServices = AdminServices();

  @override
  void initState() {
    super.initState();
    fetchAllUsers();
  }

  fetchAllUsers() async {
    users = await adminServices.fetchAllUsers(context);
    setState(() {});
  }

  void navigateToAddProduct() {
    Navigator.pushNamed(context, AddProductScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return users == null
        ? const Loader()
        : Scaffold(
            appBar: AppBar(
              title: const Text('User Accounts List'),
              centerTitle: true,
            ),
            body: ListView.builder(
              itemCount: users!.length,
              itemBuilder: (context, index) {
                final user = users![index];
                return ListTile(
                  title: Text(user.name),
                  subtitle: Text(user.email),
                  leading: const Icon(Icons.person),
                  trailing: user.type != 'admin'
                      ? const Text(
                          "User",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        )
                      : const Text(
                          "Admin",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                  onTap: () {
                    // Handle tap if needed
                  },
                );
              },
            ),
          );
  }
}
