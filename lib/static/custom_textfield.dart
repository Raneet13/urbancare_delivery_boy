import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:urbancare_delivery_boy/static/app_color.dart';

import 'show_toast/showTost_msg.dart';

Widget CustomTextField(
    {String? labelTest,
    String? hintText,
    bool? obscure,
    Icon? prefix,
    Widget? suffix,
    TextInputType? keyboard,
    List<TextInputFormatter>? inputFormatter,
    TextEditingController? controller,
    dynamic val}) {
  return Column(
    mainAxisSize: MainAxisSize.min,
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 8),
        child: Text(labelTest??""),
      ),
      SizedBox(height: 5,),
      SizedBox(
        height: 55,
        child: TextFormField(
            obscureText: obscure ?? false,
            keyboardType: keyboard,
            inputFormatters: inputFormatter,
            
            validator: val != null
                ? (value) {
                    if (value == null || value.isEmpty) {
                      return "";
                    } else if (val == "contact") {
                      if (value.length == 10) {
                        return null;
                      } else {
                        ShowToast(msg: "Phone number is incorrect");
                        return "";
                      }
                    } else if (val == "email") {
                      final bool emailValid = RegExp(
                              r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value);
                      if (emailValid) {
                        return null;
                      } else {
                        ShowToast(msg: "Email is incorrect");
                        return "";
                      }
                    } else {
                      return null;
                    }
                  }
                : null,
            cursorColor: Colo.black,
            controller: controller,
            // autofocus: true,
            decoration: InputDecoration(
              isDense: true,
              hintText: "${hintText ?? ""}",
              alignLabelWithHint: true,
              floatingLabelBehavior: FloatingLabelBehavior.auto,
              floatingLabelAlignment: FloatingLabelAlignment.start,
              border: OutlineInputBorder(),
              filled: true,
              // isDense: true,
              fillColor: Colors.white,
              // fillColor: controller != null
              //     ? controller!.text.isEmpty
              //         ? Colors.red.shade200
              //         : Colors.white
              //     : Colo.white,
              prefixIcon: prefix,
              suffixIcon: suffix,
              // helperText: "",
              // helperStyle: TextStyle(height: 0),
              // contentPadding: EdgeInsets.only(
              //   bottom: 5,
              //   left: 20,
              // ),
              // labelText: '${labelTest ?? ""}',
              // labelStyle: TextStyle(color: Colo.black, height: 0,backgroundColor: Colors.transparent),
              // label: Transform.translate(
              //   offset: Offset(-40, 0),
              //   child: SizedBox(
              //     height: 50,
              //     child: Text('${labelTest ?? ""}'),
              //   ),
              // ),
              contentPadding:
                  EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
              // border: OutlineInputBorder(
              //   borderRadius: BorderRadius.circular(50.0),
              //   borderSide: BorderSide.none,
              // ),

              enabledBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(14)), // Square corners
                  borderSide: BorderSide(
                      color: Colo.primaryColor, width: 2, style: BorderStyle.solid)),
              focusedBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(14)), // Square corners
                  borderSide: BorderSide(
                      color: Colo.primaryColor, width: 2, style: BorderStyle.solid)),
              errorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(14)), // Square corners
                  borderSide: BorderSide.none),
              focusedErrorBorder: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.all(Radius.circular(8)), // Square corners
                  borderSide: BorderSide.none),
              errorStyle: TextStyle(height: 0, fontSize: 0.01),
            )),
      ),
      // SizedBox(
      //   height: 30,
      // )
    ],
  );
}
