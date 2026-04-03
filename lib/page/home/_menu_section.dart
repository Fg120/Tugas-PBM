import 'package:flutter/material.dart';
import 'package:flutter_application_1/routes/app_pages.dart';

class MenuSection extends StatelessWidget {
  const MenuSection({super.key});

  // array menu
  final List<Map<String, dynamic>> menuItems = const [
    {'icon': Icons.phone_android_outlined, 'label': 'Pulsa'},
    {'icon': Icons.local_offer_outlined, 'label': 'Promo'},
    {'icon': Icons.shopping_bag_outlined, 'label': 'Belanja'},
    {'icon': Icons.restaurant_menu_outlined, 'label': 'Makanan'},
    {'icon': Icons.directions_car_outlined, 'label': 'Transportasi'},
    {'icon': Icons.movie_outlined, 'label': 'Hiburan'},
  ];

  @override
  Widget build(BuildContext context) {
    void openMenu(String label) {
      if (label == 'Promo') {
        Navigator.pushNamed(context, AppRoutes.promo);
      } else if (label == 'Belanja') {
        Navigator.pushNamed(context, AppRoutes.cart);
      }
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: Colors.blueGrey.withValues(alpha: 0.1),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(16),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                for (int i = 0; i < menuItems.length; i++)
                  Container(
                    margin: EdgeInsets.only(
                      right: i == menuItems.length - 1 ? 0 : 12,
                    ),
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.05),
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        IconButton(
                          onPressed: () => openMenu(menuItems[i]['label'] as String),
                          iconSize: 28,
                          splashRadius: 24,
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          icon: Icon(
                            menuItems[i]['icon'],
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          menuItems[i]['label'],
                          style: const TextStyle(fontSize: 12),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
