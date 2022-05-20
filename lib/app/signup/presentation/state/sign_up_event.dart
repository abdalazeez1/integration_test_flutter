part of 'sign_up_bloc.dart';

@immutable
abstract class SignUpEvent {}

class ImagePicked extends SignUpEvent {}

class ImageDeleted extends SignUpEvent {}
