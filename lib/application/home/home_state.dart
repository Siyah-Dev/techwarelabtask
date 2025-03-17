import 'package:test1/domain/model/user_model.dart';

class HomeState {
  HomeState({required this.isLoading, required this.usersList});

  factory HomeState.intial() {
    return HomeState(isLoading: false, usersList: []);
  }

  final bool isLoading;
  final List<UserModel> usersList;

  HomeState copyWith({bool? isLoading, List<UserModel>? usersList}) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      usersList: usersList ?? this.usersList,
    );
  }
}
