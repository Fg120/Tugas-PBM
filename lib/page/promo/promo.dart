import 'package:flutter/material.dart';

class PromoPage extends StatefulWidget {
  const PromoPage({super.key});

  @override
  State<PromoPage> createState() => _PromoPageState();
}

class _PromoPageState extends State<PromoPage> {
  final List<String> categories = const [
    'Semua',
    'Belanja',
    'Makanan',
    'Transport',
  ];

  final List<_PromoItem> promos = [
    _PromoItem(
      title: 'Diskon Ongkir sampai 50%',
      subtitle: 'Belanja kebutuhan harian seperti di aplikasi marketplace lokal.',
      category: 'Belanja',
      badge: 'Shopee Style',
    ),
    _PromoItem(
      title: 'Hemat Makan Siang 20%',
      subtitle: 'Promo kuliner mirip layanan pesan antar populer di Indonesia.',
      category: 'Makanan',
      badge: 'GoFood Style',
    ),
    _PromoItem(
      title: 'Voucher Perjalanan Rp10.000',
      subtitle: 'Cocok untuk transportasi harian dan antar jemput cepat.',
      category: 'Transport',
      badge: 'GoRide Style',
    ),
  ];

  String selectedCategory = 'Semua';

  void toggleSaved(int index) {
    setState(() {
      promos[index].saved = !promos[index].saved;
    });
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bottomInset = MediaQuery.of(context).padding.bottom;
    final filteredPromos = selectedCategory == 'Semua'
        ? promos
        : promos.where((promo) => promo.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Promo'),
      ),
      body: ListView(
        padding: EdgeInsets.fromLTRB(16, 16, 16, 16 + bottomInset + 24),
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.blueGrey.withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Promo hari ini',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'Pilih promo favorit dan simpan untuk dipakai nanti.',
                ),
                const SizedBox(height: 12),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (final category in categories)
                        Padding(
                          padding: const EdgeInsets.only(right: 8),
                          child: ChoiceChip(
                            label: Text(category),
                            selected: selectedCategory == category,
                            selectedColor: colorScheme.primary,
                            labelStyle: TextStyle(
                              color: selectedCategory == category
                                  ? Colors.white
                                  : Colors.black87,
                            ),
                            onSelected: (_) {
                              setState(() {
                                selectedCategory = category;
                              });
                            },
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),
          for (int index = 0; index < filteredPromos.length; index++) ...[
            _PromoCard(
              item: filteredPromos[index],
              onTapSave: () {
                final originalIndex = promos.indexOf(filteredPromos[index]);
                toggleSaved(originalIndex);
              },
            ),
            if (index != filteredPromos.length - 1) const SizedBox(height: 12),
          ],
          if (filteredPromos.isEmpty)
            Container(
              padding: const EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.black12),
              ),
              child: const Center(
                child: Text('Belum ada promo di kategori ini.'),
              ),
            ),
        ],
      ),
    );
  }
}

class _PromoCard extends StatelessWidget {
  const _PromoCard({required this.item, required this.onTapSave});

  final _PromoItem item;
  final VoidCallback onTapSave;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: colorScheme.primary.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.local_offer_outlined,
                  color: colorScheme.primary,
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(item.badge),
                  ],
                ),
              ),
              IconButton(
                onPressed: onTapSave,
                icon: Icon(
                  item.saved ? Icons.favorite : Icons.favorite_border,
                  color: item.saved ? Colors.red : Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Text(
            item.subtitle,
            style: TextStyle(color: Colors.grey.shade700),
          ),
          const SizedBox(height: 12),
          Align(
            alignment: Alignment.centerRight,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: colorScheme.primary,
                foregroundColor: Colors.white,
              ),
              child: const Text('Pakai Promo'),
            ),
          ),
        ],
      ),
    );
  }
}

class _PromoItem {
  _PromoItem({
    required this.title,
    required this.subtitle,
    required this.category,
    required this.badge,
  });

  final String title;
  final String subtitle;
  final String category;
  final String badge;
  bool saved = false;
}