import 'package:var_dashboard/services/database_services.dart';

class BankChallengeRepo {
  final DatabaseServices databaseServices;

  BankChallengeRepo({required this.databaseServices});
  Future<void> addData({
    required String path,
    required Map<String, dynamic> data,
  }) async {
    await databaseServices.addData(path: path, data: data);
  }
}
