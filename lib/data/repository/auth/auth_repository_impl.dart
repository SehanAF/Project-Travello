import 'package:dartz/dartz.dart';
import 'package:myapp/data/models/auth/create_user_req.dart';
import 'package:myapp/data/models/auth/sign_user_req.dart';
import 'package:myapp/data/sources/auth/auth_firebase_service.dart';
import 'package:myapp/domain/repository/auth/auth.dart';
import 'package:myapp/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserReq signinUserReq) async {
    return await s1<AuthFireBaseService>().signin(signinUserReq);
  }

  Future<Either> signup(CreateUserReq createUserReq) async {
    return await s1<AuthFireBaseService>().signup(createUserReq);
  }
}
