import 'package:flutter/material.dart';

class MomentoAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MomentoAppBar({super.key, this.hintText = 'Cari sesuatu...'});

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Theme.of(context).colorScheme.primary,
      elevation: 0,
      scrolledUnderElevation: 0,
      shadowColor: Colors.black.withValues(alpha: 0.1),
      titleSpacing: 12,
      // kolom search
      title: TextField(
        style: const TextStyle(color: Colors.white),
        cursorColor: Colors.white,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(color: Theme.of(context).colorScheme.primary),
          prefixIcon: Icon(Icons.search, color: Theme.of(context).colorScheme.primary),
          suffixIcon: const Icon(Icons.camera_alt_outlined, color: Colors.black54),
          filled: true,
          fillColor: Colors.white,
          contentPadding: const EdgeInsets.symmetric(vertical: 0),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(color: Colors.white70),
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {Navigator.pushNamed(context, '/cart');},
          tooltip: 'Cart',
          icon: const Icon(Icons.shopping_cart_outlined, color: Colors.white),
        ),
        IconButton(
          onPressed: () {},
          tooltip: 'Chat',
          icon: const Icon(Icons.message_outlined, color: Colors.white),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
