import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/services/firestore_services.dart';
import 'package:emart_app/controllers/auth_controller.dart';
import 'package:emart_app/controllers/profile_controller.dart';
import 'package:emart_app/views/account_screen/components/details_card.dart';
import 'package:emart_app/views/account_screen/edit_profile_screen.dart';
import 'package:emart_app/views/auth_screen/login_screen.dart';
// ignore: unnecessary_import
import 'package:flutter/material.dart';
import 'package:emart_app/widgets_common/bg_wdget.dart';
import 'package:get/get.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  @override
  Widget build(BuildContext context) {
    var controller = Get.put(ProfileController());

    return bgWidget(
        child: Scaffold(
      //   body: safeArea(
      body: StreamBuilder(
        stream: FirestoreServices.getUser(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation(redColor),
              ),
            );
          } else {
            //  var data = snapshot.data!.docs[0];
            // print('Response body: ${data}');
            return Column(
              children: [
                20.heightBox,
                const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Align(
                        alignment: Alignment.topRight,
                        child: Icon(
                          Icons.edit,
                          color: whiteColor,
                        ))).onTap(() {
                  Get.to(() => EditProfileScreen(
                      //  data: data,
                      ));
                }),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Image.asset(
                        imgProfile2,
                        width: 80,
                        fit: BoxFit.cover,
                      )
                          .box
                          .roundedFull
                          .clip(Clip.antiAlias)
                          .make()
                          .onTap(() {}),
                      10.widthBox,
                      Expanded(
                          child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // "${data["name"]}"
                          //     .text
                          //     .fontFamily(bold)
                          //     .white
                          //     .size(20)
                          //     .make(),
                          1.heightBox,
                          // "${data["email"]}"
                          //     .text
                          //     .fontFamily(semibold)
                          //     .white
                          //     .make(),
                        ],
                      )),
                      OutlinedButton(
                          style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: whiteColor)),
                          onPressed: () async {
                            await Get.put(AuthContoller()
                                .signoutMethod(context: context));
                            Get.offAll(() => const LoginScreen());
                          },
                          child: "Logout".text.fontFamily(bold).white.make())
                    ],
                  ),
                ),
                20.heightBox,
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    detailsCard(
                      //  count: data['cart_count'],
                      height: context.screenHeight / 11,
                      width: context.screenWidth / 3.4,
                      title: "in your cart",
                    ),
                    detailsCard(
                      //  count: data['wishlist_count'],
                      height: context.screenHeight / 11,
                      width: context.screenWidth / 3.4,
                      title: "in your wishlist",
                    ),
                    detailsCard(
                      //  count: data['order_count'],
                      height: context.screenHeight / 11,
                      width: context.screenWidth / 3.4,
                      title: "in your orders",
                    )
                  ],
                ),
                //40.heightBox,
                //button section
                ListView.separated(
                  shrinkWrap: true,
                  separatorBuilder: (context, index) {
                    return const Divider(color: Vx.black);
                  },
                  itemCount: profileButtonList.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ListTile(
                      leading: Image.asset(
                        profileButtonIcon[index],
                        width: 22,
                      ),
                      title: profileButtonList[index]
                          .text
                          .fontFamily(semibold)
                          .color(darkFontGrey)
                          .make(),
                    );
                  },
                )
                    .box
                    .white
                    .rounded
                    .margin(const EdgeInsets.all(12))
                    .padding(const EdgeInsets.symmetric(horizontal: 10))
                    // .shadowSm
                    .make()
                    .box
                    .color(redColor)
                    .make(),
              ],
            );
          }
        },
      ),
      //    ),//safeArea
    ));
  }
}
