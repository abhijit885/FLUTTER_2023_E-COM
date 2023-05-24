import 'package:emart_app/consts/consts.dart';

Widget customTextfield({String? title, String? hint, controller}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      title!.text.color(redColor).fontFamily(semibold).size(16).make(),
      5.heightBox,
      TextFormField(
        decoration: const InputDecoration(
            //controller:controller,
            hintStyle: TextStyle(
              fontFamily: semibold,
              color: textfieldGrey,
            ),
            hintText: emailHint,
            isDense: true,
            fillColor: lightGrey,
            filled: true,
            border: InputBorder.none,
            focusedBorder:
                OutlineInputBorder(borderSide: BorderSide(color: redColor))),
      ),
    ],
  );
}
