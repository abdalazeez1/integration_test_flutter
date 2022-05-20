part of 'sign_up_bloc.dart';

class SignUpState extends Equatable {
  final BlocStatus statusImage;
  final ImageFile? imageFile;

  const SignUpState(
      {this.statusImage = const BlocStatus.initial(), this.imageFile});

  SignUpState copyWith({BlocStatus? statusImage, ImageFile? imageFile}) =>
      SignUpState(
          statusImage: statusImage ?? this.statusImage,
          imageFile: imageFile ?? this.imageFile);

  @override
  List<Object?> get props => [statusImage, imageFile];
}
