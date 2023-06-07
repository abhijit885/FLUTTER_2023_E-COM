import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/views/auth_screen/signup_screen.dart';
import 'package:emart_app/views/home_screen/home.dart';
import 'package:emart_app/widgets_common/applogo_widget.dart';
import 'package:emart_app/widgets_common/bg_wdget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:emart_app/widgets_common/our_button.dart';
import 'package:get/get.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthContoller());

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: Column(
          children: [
            (context.screenHeight * 0.1).heightBox,
            applogoWidget(),
            10.heightBox,
            "Login to $appname".text.fontFamily(bold).white.size(18).make(),
            10.heightBox,
            Obx(
              () => Column(
                children: [
                  customTextfield(
                      hint: emailHint,
                      title: email,
                      isPass: false,
                      controller: controller.emailController),
                  5.heightBox,
                  customTextfield(
                      hint: passwordHint,
                      title: password,
                      isPass: true,
                      controller: controller.passwordController),

                  Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                          onPressed: () => {}, child: forgetPass.text.make())),
                  5.heightBox,
                  //ourButton().box.width(context.screenWidth - 40).make(),
                  // await controller.loginMethod(context: context).then((value) => {
                  //      if (value != null) {
                  //           VxToast.show(context,msg:loggedin);
                  //           Get.to(() => const Home());
                  //      }
                  //      });
                  controller.isLoading.value
                      ? const CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(redColor),
                        )
                      : ourButton(
                          color: redColor,
                          title: login,
                          textColor: whiteColor,
                          onPress: () async {
                            controller.isLoading(true);
                            await controller
                                .loginMethod(context: context)
                                .then((value) {
                              if (value != null) {
                                VxToast.show(context, msg: loggedin);
                                Get.to(() => const Home());
                              } else {
                                controller.isLoading(false);
                              }
                            });
                          },
                        ).box.width(context.screenWidth - 40).make(),
                  15.heightBox,
                  createNewAccount.text.color(fontGrey).make(),
                  10.heightBox,
                  ourButton(
                      color: lightGolden,
                      title: signup,
                      textColor: whiteColor,
                      onPress: () {
                        Get.to(() => const SignupScreen());
                      }).box.width(context.screenWidth - 40).make(),
                  10.heightBox,
                  loginWith.text.color(fontGrey).make(),
                  10.heightBox,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                        3,
                        (index) => Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: CircleAvatar(
                                backgroundColor: lightGrey,
                                radius: 25,
                                child: Image.asset(
                                  socialIconList[index],
                                  width: 30,
                                ),
                              ),
                            )),
                  )
                ],
              )
                  .box
                  .white
                  .rounded
                  .padding(const EdgeInsets.all(16))
                  .width(context.screenWidth - 50)
                  .shadowSm
                  .make(),
            )
          ],
        ),
      ),
    ));
  }
}
