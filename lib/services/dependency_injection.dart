import 'package:get_it/get_it.dart';
import 'package:var_dashboard/data/repo/bank_challenge_repo.dart';
import 'package:var_dashboard/data/repo/password_challenge_repo.dart';
import 'package:var_dashboard/data/repo/risk_challenge_repo.dart';
import 'package:var_dashboard/services/database_services.dart';
import 'package:var_dashboard/services/firestore_services.dart';

GetIt getIt = GetIt.instance;
setupGetIt() {
  getIt.registerSingleton<DatabaseServices>(FirestoreServices());
  getIt.registerSingleton<PasswordChallengeRepo>(
    PasswordChallengeRepo(databaseServices: getIt<DatabaseServices>()),
  );
  getIt.registerSingleton<RiskChallengeRepo>(
    RiskChallengeRepo(databaseServices: getIt<DatabaseServices>()),
  );
  getIt.registerSingleton<BankChallengeRepo>(
    BankChallengeRepo(databaseServices: getIt<DatabaseServices>()),
  );
}
