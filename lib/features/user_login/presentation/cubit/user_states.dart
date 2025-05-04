import '../../domain/entities/user_entity.dart';

abstract class UserStates{}
class UserLoadingState extends UserStates{
  final String loadMessage='loading....';
}
class UserInitialState extends UserStates{

}
class UserSuccessState extends UserStates{
  final UserEntity user;
  UserSuccessState(this.user);
}
class UserFailureState extends UserStates{
  final String failureMessage;
  UserFailureState(this.failureMessage);

}