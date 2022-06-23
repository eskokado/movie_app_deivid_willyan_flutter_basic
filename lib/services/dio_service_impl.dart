import 'package:dio/dio.dart';
import 'package:movieapp/services/dio_service.dart';

class DioServiceImpl implements DioService {
  @override
  Dio getDio() {
    return Dio(
      BaseOptions(
        baseUrl: 'https://api.themoviedb.org/4/',
        headers: {
          'contenty-type': 'application/json;charset=utf-8',
          'authorization':
              'Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJkZGJkYTg5OTAyMjAxNmZhYmNmYWE2YTI5NWY5MjE0YiIsInN1YiI6IjYyYjM2OTg3YzJiY2M2MDA5M2I5NWMyYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.CAab5-oubcmbAgguXaNOzoshrUy6FW3clyyzHr_iDW0',
        },
      ),
    );
  }
}
