import 'package:flutter/material.dart';

import '../../../core/models/news.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_listview.dart';
import '../widgets/news_card.dart';

class NewsPage extends StatelessWidget {
  const NewsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CustomAppbar('News', back: false),
        Expanded(
          child: CustomListview(
            padding: 25,
            children: [
              const SizedBox(height: 20),
              ...List.generate(newsList.length, (index) {
                return NewsCard(news: newsList[index]);
              }),
            ],
          ),
        ),
        const SizedBox(height: 80),
      ],
    );
  }
}
