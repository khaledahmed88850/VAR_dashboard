import 'package:var_dashboard/services/database_services.dart';

class RiskChallengeRepo {
  final DatabaseServices databaseServices;

  const RiskChallengeRepo({required this.databaseServices});

  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await databaseServices.addData(path: path, data: data);
  }
}
