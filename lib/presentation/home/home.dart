import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/application/home/home_controller.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  @override
  void initState() {
    Future.delayed(Duration(), () {
      if (mounted) {
        ref.read(homeController.notifier).fetchUsers(context);
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = ref.watch(homeController).isLoading;
    final usersList = ref.watch(homeController).usersList;
    return Scaffold(
      appBar: AppBar(title: Text("Users List")),
      body:
          isLoading
              ? Center(
                child: SizedBox(
                  height: 50,
                  width: 50,
                  child: CircularProgressIndicator(),
                ),
              )
              : ListView.builder(
                itemBuilder:
                    (context, index) => ListTile(
                      title: Text("${usersList[index].userId}"),
                      subtitle: Text(usersList[index].title),
                    ),
                itemCount: usersList.length,
              ),
    );
  }
}
