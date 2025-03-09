 import 'package:dielegende_store/core/shared/widgets/CustomFormTextField.dart';
import 'package:dielegende_store/core/utils/colors.dart';
import 'package:flutter/material.dart';

Widget buildDatePicker( TextEditingController dateController ,BuildContext context) {
    return CustomTextFormField(
        labelText: "Birth of Date",
        controller: dateController,
        inputType: TextInputType.datetime,
        suffix: Icons.calendar_today,
        suffixFun: () async {
          DateTime? pickedDate = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
            builder: (context, child) {
              return Theme(
                data: ThemeData.light().copyWith(
                  primaryColor: mainColor,
                  colorScheme: const ColorScheme.light(primary: mainColor),
                  buttonTheme:
                      const ButtonThemeData(textTheme: ButtonTextTheme.primary),
                ),
                child: child!,
              );
            },
          );

          if (pickedDate != null) {
            dateController.text = "${pickedDate.toLocal()}".split(' ')[0];
          }
        });
  }
