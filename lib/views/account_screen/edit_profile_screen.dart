import 'dart:io';

import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/widgets_common/bg_wdget.dart';
import 'package:emart_app/widgets_common/custom_textfield.dart';
import 'package:get/get.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;
  const EditProfileScreen({Key? key, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();
    controller.nameController.text = data['name'];
    controller.passwordController.text = data['password'];
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
      ),
      body: Center(
        child: Obx(
          () => Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              controller.profileImagePath.isEmpty
                  ? Image.asset(
                      imgProfile2,
                      width: 80,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make()
                  : Image.file(
                      File(controller.profileImagePath.value),
                      width: 80,
                      fit: BoxFit.cover,
                    ).box.roundedFull.clip(Clip.antiAlias).make(),
              20.heightBox,
              OutlinedButton(
                  style: OutlinedButton.styleFrom(
                      side: const BorderSide(color: redColor)),
                  onPressed: () {
                    controller.changeImage(context);
                  },
                  child: "Change Profile Image"
                      .text
                      .fontFamily(bold)
                      .red500
                      .make()),
              customTextfield(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false,
              ),
              customTextfield(
                controller: controller.passwordController,
                hint: password,
                title: password,
                isPass: true,
              ),
              40.heightBox,
              SizedBox(
                width: context.screenWidth - 40,
                child: OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(color: redColor)),
                    onPressed: () async {},
                    child: "Save".text.fontFamily(bold).red500.make()),
              ),
            ],
          ),
        ),
      )
          .box
          .white
          .shadowSm
          .padding(const EdgeInsets.all(30))
          .margin(const EdgeInsets.only(top: 50, left: 8, right: 8))
          .roundedSM
          .make(),
    ));
  }
}
