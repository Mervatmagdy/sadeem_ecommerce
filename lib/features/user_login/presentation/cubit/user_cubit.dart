import 'package:ecommerce/features/user_login/presentation/cubit/user_states.dart';
import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/usecases/user_login.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserInitialState());
  eitherFailureOrUser({
    required String username,
    required String password,
  }) async {
    emit(UserLoadingState());
    final failureOrUser = await UserLogin().call(username: username,password: password);
    failureOrUser.fold((failure) {
      emit(UserFailureState(failure.errMessage));
    }, (user) {
      emit(UserSuccessState(user));
    });
  }
}
