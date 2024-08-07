import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';
import '../../../core/widgets/buttons/primary_button.dart';
import '../../../core/widgets/custom_appbar.dart';
import '../../../core/widgets/custom_listview.dart';
import '../../../core/widgets/custom_scaffold.dart';

class NewsDetailPage extends StatelessWidget {
  const NewsDetailPage({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      body: Column(
        children: [
          const CustomAppbar(''),
          Expanded(
            child: CustomListview(
              padding: 25,
              children: [
                const SizedBox(height: 12),
                _ImageCard(news: news),
                const SizedBox(height: 12),
                _TitleCard(news: news),
                const SizedBox(height: 32),
                _BodyCard(news: news),
                const SizedBox(height: 14),
                _DateText(news: news),
                const SizedBox(height: 22),
                PrimaryButton(
                  title: 'Back',
                  onPressed: () {
                    context.pop();
                  },
                ),
                const SizedBox(height: 48),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ImageCard extends StatelessWidget {
  const _ImageCard({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: AppColors.black25,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12),
        child: SizedBox(
          height: 220,
          child: CachedNetworkImage(
            imageUrl: news.image,
            fit: BoxFit.cover,
            errorWidget: (context, url, error) {
              return Image.asset(
                'assets/tab1.png',
                color: AppColors.red,
                height: 30,
              );
            },
          ),
        ),
      ),
    );
  }
}

class _TitleCard extends StatelessWidget {
  const _TitleCard({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.newsCard,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: AppColors.black25,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Column(
        children: [
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  news.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'SF',
                    shadows: <Shadow>[
                      Shadow(
                        color: AppColors.black25,
                        blurRadius: 4,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(width: 10),
            ],
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              const Spacer(),
              Container(
                height: 28,
                width: 92,
                decoration: BoxDecoration(
                  color: const Color(0xffED7404),
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.black25,
                      blurRadius: 4,
                      offset: const Offset(0, 4),
                    )
                  ],
                ),
                child: const Center(
                  child: Text(
                    'Basketball',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'SF',
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 16),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class _BodyCard extends StatelessWidget {
  const _BodyCard({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.newsCard,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            blurRadius: 4,
            color: AppColors.black25,
            offset: const Offset(0, 4),
          )
        ],
      ),
      child: Text(
        news.body,
        style: TextStyle(
          color: Colors.black,
          fontSize: 14,
          height: 2,
          fontWeight: FontWeight.w600,
          fontFamily: 'SF',
          shadows: <Shadow>[
            Shadow(
              color: AppColors.black25,
              blurRadius: 4,
              offset: const Offset(0, 4),
            ),
          ],
        ),
      ),
    );
  }
}

class _DateText extends StatelessWidget {
  const _DateText({required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        news.date,
        style: TextStyle(
          color: AppColors.black50,
          fontSize: 12,
          fontWeight: FontWeight.w600,
          fontFamily: 'SF',
        ),
      ),
    );
  }
}
