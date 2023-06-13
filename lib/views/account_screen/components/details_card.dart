import 'package:emart_app/consts/consts.dart';

Widget detailsCard({
  width,
  height,
  String? title,
  String? count,
}) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      "count!".text.fontFamily(semibold).color(darkFontGrey).size(18).make(),
      2.heightBox,
      "title!".text.make(),
    ],
  )
      .box
      .white
      .rounded
      //.width(context.screenWidth / 3.2)
      //.height(context.screenHeight / 11)
      .width(width)
      .height(height)
      .padding(const EdgeInsets.all(5))
      .make();
}
