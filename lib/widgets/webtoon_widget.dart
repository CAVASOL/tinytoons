import 'package:flutter/material.dart';
import 'package:tinytoons/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailScreen(
              title: title,
              thumb: thumb,
              id: id,
            ),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
              width: 240,
              clipBehavior: Clip.hardEdge,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    blurRadius: 20,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(
                      0.4,
                    ),
                  )
                ],
                borderRadius: BorderRadius.circular(
                  12,
                ),
              ),
              child: Image.network(
                thumb,
              ),
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
