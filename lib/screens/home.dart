// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:tinytoons/models/webtoon_model.dart';
import 'package:tinytoons/services/api_service.dart';
import 'package:tinytoons/widgets/webtoon_widget.dart';

class Home extends StatelessWidget {
  Home({super.key});

  Future<List<WebtoonModel>> webtoons = ApiService.getTodaysToons();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.2,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        title: const Text(
          'TINYTOON',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontStyle: FontStyle.italic,
          ),
        ),
      ),
      body: FutureBuilder(
        future: webtoons,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: 48,
                ),
                Expanded(
                  child: makeList(snapshot),
                )
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(
              color: Colors.black,
            ),
          );
        },
      ),
    );
  }

  ListView makeList(AsyncSnapshot<List<WebtoonModel>> snapshot) {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      itemCount: snapshot.data!.length,
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      itemBuilder: (context, index) {
        final webtoon = snapshot.data![index];
        return Webtoon(
          title: webtoon.title,
          thumb: webtoon.thumb,
          id: webtoon.id,
        );
      },
      separatorBuilder: (context, index) => const SizedBox(
        width: 40,
      ),
    );
  }
}
