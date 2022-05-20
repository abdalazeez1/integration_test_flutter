import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    this.hintText,
    this.obscureText = false,
    this.prefixIcon,
  }) : super(key: key);
  final String? hintText;
  final IconData? prefixIcon;
  final bool obscureText;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: [
        BoxShadow(
            offset: const Offset(0, 8),
            blurRadius: 6,
            color: Colors.black.withOpacity(.05),
            spreadRadius: .1),
        BoxShadow(
            offset: const Offset(0, 20),
            blurRadius: 15,
            color: Colors.black.withOpacity(.1),
            spreadRadius: 0.1),
      ]),
      child: TextFormField(
        obscureText: obscureText,
        decoration: InputDecoration(
            hintStyle: Theme.of(context).textTheme.caption,
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                    color: Colors.indigo,
                  )
                : null,
            filled: true,
            fillColor: Colors.white,
            border: InputBorder.none,
            hintText: hintText,
            contentPadding: const EdgeInsets.only(
                left: 14.0, bottom: 8.0, right: 14, top: 8),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(
                10,
              ),
            )),
      ),
    );
  }
}

class OutLinedTextField extends StatelessWidget {
  const OutLinedTextField({Key? key, this.hintText, this.prefixIcon})
      : super(key: key);
  final IconData? prefixIcon;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextFormField(
        enabled: false,
        decoration: InputDecoration(
            prefixIcon: prefixIcon != null
                ? Icon(
                    prefixIcon,
                  )
                : null,
            filled: true,
            hintText: hintText,
            contentPadding:
                const EdgeInsets.only(left: 14.0, bottom: 8.0, right: 14),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey.withOpacity(.2),
              ),
              borderRadius: BorderRadius.circular(
                10,
              ),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey.withOpacity(.2)),
              borderRadius: BorderRadius.circular(
                10,
              ),
            )),
      ),
    );
  }
}
