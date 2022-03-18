import 'package:adviqo_challenge/core/data_provider/api_client.dart';

/// Base class for all repo
/// Handle all common thing related to repo here
abstract class BaseRepo {
  final apiClient = ApiClient();
}