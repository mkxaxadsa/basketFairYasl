import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/models/news.dart';

class NewsCard extends StatelessWidget {
  const NewsCard({super.key, required this.news});

  final News news;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: () {
        context.push('/news-detail', extra: news);
      },
      padding: EdgeInsets.zero,
      child: Container(
        height: 220,
        margin: const EdgeInsets.only(bottom: 42),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              blurRadius: 4,
              color: AppColors.black25,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: SizedBox(
                height: 220,
                child: CachedNetworkImage(
                  imageUrl: news.image,
                  fit: BoxFit.cover,
                  errorWidget: (context, url, error) {
                    return Image.asset(
                      'assets/tab1.png',
                      color: Colors.transparent,
                      height: 1,
                    );
                  },
                ),
              ),
            ),
            Positioned(
              top: 15,
              left: 15,
              child: Container(
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
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 64,
                padding: const EdgeInsets.symmetric(
                  horizontal: 14,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: const Color(0xff5D5D5D).withOpacity(0.5),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Center(
                  child: Text(
                    news.title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
