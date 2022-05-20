import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../common/bloc_core/bloc_status.dart';
import '../../domain/entities/image_file.dart';

part 'sign_up_event.dart';
part 'sign_up_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  SignUpBloc() : super(const SignUpState()) {
    on<SignUpEvent>((event, emit) async {
      if (event is ImagePicked) {
        await onPickImage(event, emit);
      }
      if (event is ImageDeleted) {
        emit(state.copyWith(
            statusImage: const BlocStatus.initial(), imageFile: null));
      }
    });
  }
  Future<void> onPickImage(ImagePicked event, Emitter emit) async {
    emit(state.copyWith(statusImage: const BlocStatus.loading()));
    // final File? image = await pickImage();
    final pickedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    final imageFile = pickedImage != null ? File(pickedImage.path) : null;
    // print('pick image   ${image?.path}');
    if (imageFile != null) {
      emit(state.copyWith(
          imageFile: ImageFile(image: imageFile),
          statusImage: const BlocStatus.success()));
    }
  }
}

final bloc = SignUpBloc();
