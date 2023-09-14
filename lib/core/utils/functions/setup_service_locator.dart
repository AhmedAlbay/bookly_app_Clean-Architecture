import 'package:bookly/Features/home/data/data_source/home_local_data_source.dart';
import 'package:bookly/Features/home/data/data_source/home_remote_data_source.dart';

import 'package:bookly/Features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final getit = GetIt.instance;
void setupServiceLocator() {
  getit.registerSingleton(
    ApiService(
      Dio(),
    ),
  );
  getit.registerSingleton<HomeRepoImpl>(
    HomeRepoImpl(
        homeRemoteDataSource: HomeRemoteDataSourceImpl(
          getit.get<ApiService>(),
        ),
        homeLocalDataSource: HomeLocalDataSourceImpl()),
  );
}
