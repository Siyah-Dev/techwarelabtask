import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:test1/domain/repository/home_repo.dart';
import 'package:test1/infrastructure/repository/home_repo_impl.dart';

final homeProvider = Provider<Homerepo>((ref) => HomeRepoImpl());
