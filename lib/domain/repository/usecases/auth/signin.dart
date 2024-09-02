import 'package:dartz/dartz.dart';
import 'package:myapp/core/usecase/usecase.dart';
import 'package:myapp/data/models/auth/sign_user_req.dart';
import 'package:myapp/domain/repository/auth/auth.dart';
import 'package:myapp/service_locator.dart';

class SigninUseCase implements UseCase<Either, SigninUserReq> {
  @override
  Future<Either> call({SigninUserReq? params}) async {
    return await s1<AuthRepository>().signin(params!);
  }
}
