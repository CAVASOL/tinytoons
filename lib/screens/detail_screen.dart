import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final String title, thumb, id;
  const DetailScreen({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 56,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
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
            ],
          ),
        ],
      ),
    );
  }
}
