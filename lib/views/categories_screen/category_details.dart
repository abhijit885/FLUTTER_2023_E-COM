import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/views/categories_screen/item_details.dart';
import 'package:emart_app/widgets_common/bg_wdget.dart';
import 'package:get/get.dart';

class CategoryDetails extends StatelessWidget {
  final String? title;
  const CategoryDetails({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return bgWidget(
        child: Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: title!.text.fontFamily(bold).make(),
      ),
      body: Container(
        padding: const EdgeInsets.all(8),
        child: Column(
          children: [
            SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    6,
                    (index) => "name"
                        .text
                        .fontFamily(semibold)
                        .color(darkFontGrey)
                        .makeCentered()
                        .box
                        .white
                        .rounded
                        .size(120, 60)
                        .margin(const EdgeInsets.symmetric(horizontal: 4))
                        .make(),
                  ),
                )),
            20.heightBox,
//Items Containers
            Expanded(
                child: GridView.builder(
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisExtent: 250,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: ((context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            imgP5,
                            width: 200,
                            height: 150,
                            fit: BoxFit.cover,
                          ),
                          "Laptop 8Gb/64Gb".text.make(),
                          10.heightBox,
                          "\$600"
                              .text
                              .fontFamily(bold)
                              .color(redColor)
                              .size(16)
                              .make(),
                        ],
                      )
                          .box
                          .white
                          .roundedSM
                          .outerShadowMd
                          .padding(const EdgeInsets.all(12))
                          .margin(const EdgeInsets.symmetric(
                            horizontal: 4,
                          ))
                          .make()
                          .onTap(() {
                        Get.to(() => const ItemDetails(title: "ItemDetails"));
                      });
                    })))
          ],
        ),
      ),
    ));
  }
}
