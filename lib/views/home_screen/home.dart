import 'package:emart_app/consts/consts.dart';
import 'package:emart_app/controllers/home_controllers.dart';
import 'package:emart_app/views/account_screen/home.dart';
import 'package:emart_app/views/cart_screen/cart_screen.dart';
import 'package:emart_app/views/categories_screen/categories.dart';
import 'package:emart_app/views/home_screen/home_screen.dart';
import 'package:get/get.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    var navbarItem = [
      BottomNavigationBarItem(
          icon: Image.asset(
            icHome,
            width: 26,
          ),
          label: home),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCategories,
            width: 26,
          ),
          label: categories),
      BottomNavigationBarItem(
          icon: Image.asset(
            icCart,
            width: 26,
          ),
          label: cart),
      BottomNavigationBarItem(
          icon: Image.asset(
            icProfile,
            width: 26,
          ),
          label: account),
    ];
    var navBody = [
      const HomeScreen(),
      const CategorieScreen(),
      const CartScreen(),
      const AccountScreen(),
    ];
    //init HomeController
    var controller = Get.put(HomeController());
    return Scaffold(
      body: Column(
        children: [
          Obx(() => Expanded(
              child: navBody.elementAt(controller.currentNavIndex.value))),
        ],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          currentIndex: controller.currentNavIndex.value,
          selectedItemColor: redColor,
          backgroundColor: whiteColor,
          items: navbarItem,
          type: BottomNavigationBarType.fixed,
          selectedLabelStyle: const TextStyle(fontFamily: semibold),
          onTap: (value) => {controller.currentNavIndex.value = value},
        ),
      ),
    );
  }
}
