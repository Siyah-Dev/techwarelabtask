import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/application/home/home_state.dart';
import 'package:test1/di/di.dart';
import 'package:test1/domain/repository/home_repo.dart';
import 'package:test1/utils/app_utils.dart';

class HomeController extends StateNotifier<HomeState> {
  HomeController(this._homerepo) : super(HomeState.intial());
  final Homerepo _homerepo;

  Future<void> fetchUsers(BuildContext context) async {
    state = state.copyWith(isLoading: true);
    final (res, err) = await _homerepo.fetchUsers();
    if (res != null) {
      state = state.copyWith(usersList: res, isLoading: false);
    } else {
      state = state.copyWith(isLoading: false);

      AppUtils.showSnackBar(context, err, Colors.red);
    }
  }
}

final homeController = StateNotifierProvider<HomeController, HomeState>((ref) {
  final homeRepository = ref.read(homeProvider);
  return HomeController(homeRepository);
});
