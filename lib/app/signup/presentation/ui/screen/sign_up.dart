import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_integration_test_flutter/app/signup/presentation/state/sign_up_bloc.dart';
import 'package:login_integration_test_flutter/app/signup/presentation/ui/widget/custom_text_filed.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: bloc,
      child: Builder(builder: (context) {
        return Scaffold(
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Spacer(
                    flex: 6,
                  ),
                  BlocBuilder<SignUpBloc, SignUpState>(
                    builder: (context, state) {
                      return Center(
                        child: Stack(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          alignment: Alignment.center,
                          fit: StackFit.loose,
                          children: [
                            CircleAvatar(
                              backgroundColor: Colors.indigo,
                              radius: 50,
                              backgroundImage: state.statusImage.isSuccess
                                  ? FileImage(state.imageFile!.image!)
                                  : null,
                            ),
                            Positioned(
                                bottom: 0,
                                right: 0,
                                child: CircleAvatar(
                                  backgroundColor: Colors.white70,
                                  child: IconButton(
                                      key:
                                          const ValueKey('add_or_remove_image'),
                                      onPressed: () {
                                        if (state.statusImage.isSuccess) {
                                          bloc.add(ImageDeleted());
                                        } else {
                                          bloc.add(ImagePicked());
                                        }
                                      },
                                      icon: Icon(state.statusImage.isSuccess
                                          ? Icons.remove_circle_outline_outlined
                                          : Icons.add_a_photo_outlined),
                                      color: Colors.indigo),
                                ))
                          ],
                        ),
                      );
                    },
                  ),
                  const Spacer(),
                  const CustomTextField(
                    key: ValueKey('email_sign_up'),
                    hintText: 'email',
                    prefixIcon: Icons.email_outlined,
                  ),
                  const Spacer(),
                  const CustomTextField(
                    key: ValueKey('name_sign_up'),
                    hintText: 'name',
                    prefixIcon: Icons.person_pin_circle_outlined,
                  ),
                  const Spacer(),
                  const CustomTextField(
                    obscureText: true,
                    key: ValueKey('password_sign_up'),
                    hintText: 'password',
                    prefixIcon: Icons.vpn_key_outlined,
                  ),
                  const Spacer(),
                  const CustomTextField(
                    obscureText: true,
                    key: ValueKey('submit_password_sign_up'),
                    hintText: 'submit password',
                    prefixIcon: Icons.vpn_key_outlined,
                  ),
                  const Spacer(),
                  TextButton(
                      key: const ValueKey('pick_date_time'),
                      onPressed: () => showDatePicker(
                          context: context,
                          initialDate: DateTime(2000),
                          firstDate: DateTime(1920),
                          lastDate: DateTime.now()),
                      child: const Text('pick date ')),
                  const Spacer(flex: 2),
                  Row(
                    children: [
                      Expanded(
                        child: ElevatedButton(
                          key: const ValueKey('sign_up_button'),
                          style: ElevatedButton.styleFrom(
                              padding: const EdgeInsets.all(12),
                              primary: Colors.indigo),
                          onPressed: () {},
                          child: const Text('sign up'),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(
                    flex: 6,
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
