import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_wdget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class signupScreen extends StatefulWidget {
  const signupScreen({super.key});

  @override
  State<signupScreen> createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  bool? isCheck = false;
  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Join the $appname".text.fontFamily(bold).white.size(18).make(),
            10.heightBox,
            Column(
              children: [
                customTextfield(hint: name, title: name),
                5.heightBox,
                customTextfield(hint: emailHint, title: email),
                5.heightBox,
                customTextfield(hint: passwordHint, title: password),
                5.heightBox,
                customTextfield(hint: passwordHint, title: reTypePassword),
                Row(
                  children: [
                    Checkbox(
                      value: isCheck,
                      activeColor: redColor,
                      checkColor: whiteColor,
                      onChanged: (newValue) {
                        setState(() {
                          isCheck = newValue;
                        });
                      },
                    ),
                    //1.widthBox,
                    Expanded(
                      child: RichText(
                          text: const TextSpan(
                        children: [
                          TextSpan(
                              text: " I agree to the ",
                              style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: termAndCondition,
                              style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              )),
                          TextSpan(
                              text: " & ",
                              style: TextStyle(
                                fontFamily: regular,
                                color: fontGrey,
                              )),
                          TextSpan(
                              text: privacyPolicy,
                              style: TextStyle(
                                fontFamily: regular,
                                color: redColor,
                              )),
                        ],
                      )),
                    ),
                  ],
                ),
                ourButton(
                        //color: isCheck == true ? redColor : lightGrey,
                        title: signup,
                        textColor: whiteColor,
                        onPress: () {})
                    .box
                    .width(context.screenWidth - 40)
                    .make(),
                15.heightBox,
                //wraps in to a gesture detector of velocity X
                // RichText(
                //     text: const TextSpan(children: [
                //   TextSpan(
                //     text: alreadyHaveAccount,
                //     style: TextStyle(fontFamily: bold, color: fontGrey),
                //   ),
                //   TextSpan(
                //     text: " Login ",
                //     style: TextStyle(fontFamily: bold, color: redColor),
                //   ),
                // ]))
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    alreadyHaveAccount.text.color(fontGrey).make(),
                    login.text.color(redColor).make(),
                  ],
                ).onTap(() {
                  Get.back();
                }),
                15.heightBox,
              ],
            )
                .box
                .white
                .rounded
                .padding(const EdgeInsets.all(16))
                .width(context.screenWidth - 50)
                .shadowSm
                .make(),
          ],
        ),
      ),
    ));
  }
}
