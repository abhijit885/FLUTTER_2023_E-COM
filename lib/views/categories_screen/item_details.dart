import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/consts/lists.dart';
import 'package:emart_app/widgets_common/our_button.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.title});
  final String? title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: lightGrey,
      appBar: AppBar(
        title: title!.text.fontFamily(bold).color(darkFontGrey).make(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.share,
                color: darkFontGrey,
              )),
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border, color: darkFontGrey)),
        ],
      ),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: EdgeInsets.all(8),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  VxSwiper.builder(
                      aspectRatio: 16 / 9,
                      autoPlay: true,
                      height: 350,
                      enlargeCenterPage: true,
                      itemCount: secondSliderList.length,
                      itemBuilder: (context, index) {
                        //wrape with velocityX
                        return Image.asset(
                          imgP5,
                          width: double.infinity,
                          fit: BoxFit.fitWidth,
                        )
                            .box
                            .rounded
                            .clip(Clip.antiAlias)
                            .margin(const EdgeInsets.symmetric(horizontal: 8))
                            .make();
                      }),
                  //5.heightBox,
                  title!.text
                      .size(25)
                      .color(darkFontGrey)
                      .fontFamily(semibold)
                      .make(),
                  5.heightBox,
                  VxRating(
                    onRatingUpdate: (value) {},
                    normalColor: textfieldGrey,
                    selectionColor: golden,
                    count: 5,
                    size: 25,
                    stepInt: true,
                  ),
                  5.heightBox,
                  "\$600".text.fontFamily(bold).color(redColor).size(22).make(),
                  10.heightBox,
                  Row(
                    children: [
                      Expanded(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          "Seller"
                              .text
                              .white
                              .fontFamily(semibold)
                              .color(darkFontGrey)
                              .make(),
                        ],
                      )),
                      const CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Icon(
                          Icons.message_rounded,
                          color: darkFontGrey,
                        ),
                      ),
                    ],
                  )
                      .box
                      .height(60)
                      .color(textfieldGrey)
                      .padding(const EdgeInsets.symmetric(horizontal: 16))
                      .make(),
                  20.heightBox,
                  //color section
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: "Color: ".text.color(textfieldGrey).make(),
                          ),
                          Row(
                            children: List.generate(
                                4,
                                (index) => VxBox()
                                    .size(40, 40)
                                    .roundedFull
                                    .color(Vx.randomPrimaryColor)
                                    .margin(const EdgeInsets.symmetric(
                                        horizontal: 2))
                                    .make()),
                          )
                        ],
                      )
                    ],
                  ),
                  //Quantity section
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child:
                                "Quentity: ".text.color(textfieldGrey).make(),
                          ),
                          Row(children: [
                            IconButton(
                                onPressed: () {},
                                icon: const Icon(Icons.remove)),
                            "0"
                                .text
                                .fontFamily(bold)
                                .color(redColor)
                                .size(22)
                                .make(),
                            IconButton(
                                onPressed: () {}, icon: const Icon(Icons.add)),
                          ]),
                        ],
                      )
                    ],
                  ),
                  10.heightBox,
                  //Total Price
                  Column(
                    children: [
                      Row(
                        children: [
                          SizedBox(
                            width: 200,
                            child: "Total Price: "
                                .text
                                .color(textfieldGrey)
                                .make(),
                          ),
                          Row(children: [
                            "\$0.00"
                                .text
                                .fontFamily(bold)
                                .color(redColor)
                                .size(22)
                                .make(),
                          ]).box.white.shadowMd.make(),
                        ],
                      ),
                      10.heightBox,
                      //description section
                      "description"
                          .text
                          .size(25)
                          .color(darkFontGrey)
                          .fontFamily(bold)
                          .make(),
                      10.heightBox,
                      "descriptiondescriptiondescriptiondescriptiondescriptiondescriptiondescription"
                          .text
                          .size(15)
                          .color(darkFontGrey)
                          .fontFamily(semibold)
                          .make(),
                      10.heightBox,
                      ListView(
                        shrinkWrap: true,
                        children: List.generate(
                          itemDetailsButtonList.length,
                          (index) => ListTile(
                            title: itemDetailsButtonList[index]
                                .text
                                .fontFamily(semibold)
                                .color(darkFontGrey)
                                .make(),
                            trailing: const Icon(Icons.arrow_forward),
                          ),
                        ),
                      ),
                      10.heightBox,
                      //Product May Also Like...
                      productMayAlsoLike.text
                          .align(TextAlign.start)
                          .fontFamily(bold)
                          .size(25)
                          .make(),
                      10.heightBox,
                      SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                              children: List.generate(
                            4,
                            (index) => Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.asset(
                                  imgP1,
                                  width: 150,
                                  fit: BoxFit.cover,
                                ),
                                10.heightBox,
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
                                .padding(const EdgeInsets.all(8))
                                .margin(const EdgeInsets.symmetric(
                                  horizontal: 4,
                                ))
                                .make(),
                          ))),
                    ],
                  ),
                ],
              ),
            ),
          )),
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ourButton(
                color: redColor,
                onPress: () {},
                textColor: whiteColor,
                title: "Add to Cart"),
          )
        ],
      ),
    );
  }
}
