import 'package:flutter/material.dart';

class HorizontalCardListHeader extends StatelessWidget {
  const HorizontalCardListHeader({
    super.key,
    required this.title,
    this.onPressedMore,
  });

  final String title;
  final void Function()? onPressedMore;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ),
          TextButton(
            onPressed: onPressedMore,
            child: const Text(
              "View More",
              style: TextStyle(fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}

class HorizontalCardList extends StatelessWidget {
  const HorizontalCardList({super.key, this.listCards = const []});

  final List<Widget> listCards;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 156,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: listCards.length,
        itemBuilder: (context, index) => listCards[index],
      ),
    );
  }
}

class ListCard extends StatelessWidget {
  const ListCard({
    super.key,
    required this.title,
    this.image,
  });

  final String? image;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Card(
        elevation: 10,
        child: Column(
          children: [
            if (image != null)
              Image.network(image!, height: 125, width: 130, fit: BoxFit.cover)
            else
              const Icon(Icons.image, size: 48),
            const SizedBox(height: 2),
            Text(
              title,
              style: const TextStyle(
                color: Color.fromARGB(255, 0, 0, 0),
                // letterSpacing: 2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
