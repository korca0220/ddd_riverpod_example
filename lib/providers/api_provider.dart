import 'package:ddd_riverpod_example/infrastructure/api_service/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiProvider = Provider((ref) => ApiService());
