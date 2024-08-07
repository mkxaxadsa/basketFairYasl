import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/config/app_colors.dart';
import '../../../core/widgets/border_widget.dart';
import '../../../core/widgets/custom_appbar.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomAppbar('Settings', back: false),
        SizedBox(height: 50),
        _TitleText('Support & About'),
        SizedBox(height: 10),
        Container(
          height: 132,
          margin: const EdgeInsets.symmetric(horizontal: 24),
          decoration: BoxDecoration(
            color: AppColors.grey5,
            borderRadius: BorderRadius.circular(6),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _Button(
                title: 'Terms of use',
                asset: 's1',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Setxasf(
                          jsksd:
                              'https://docs.google.com/document/d/1oQAXPe_UryKaj-YyXo3latnfyfQxvY-WJVBhbE4bVuQ/edit?usp=sharing'),
                    ),
                  );
                },
              ),
              const BorderWidget(),
              _Button(
                title: 'Privacy Policy',
                asset: 's2',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Setxasf(
                          jsksd:
                              'https://docs.google.com/document/d/192KsevLiQWD_FBAi-Cz02KkZdhxlcCmHcZ8bxgLD8_o/edit?usp=sharing'),
                    ),
                  );
                },
              ),
              const BorderWidget(),
              _Button(
                title: 'Support page',
                asset: 's3',
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Setxasf(
                          jsksd: 'https://forms.gle/srDuVxJF3MhJWRru5'),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
        SizedBox(height: 20),
      ],
    );
  }
}

class _TitleText extends StatelessWidget {
  const _TitleText(this.title);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 30),
        Text(
          title,
          style: const TextStyle(
            color: Colors.black,
            fontSize: 16,
            fontWeight: FontWeight.w600,
            fontFamily: 'Inter',
          ),
        ),
      ],
    );
  }
}

class _SupportCard extends StatelessWidget {
  const _SupportCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.grey5,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Button(
            title: 'Terms of use',
            asset: 's1',
            onPressed: () {},
          ),
          const BorderWidget(),
          _Button(
            title: 'Privacy Policy',
            asset: 's2',
            onPressed: () {},
          ),
          const BorderWidget(),
          _Button(
            title: 'Support page',
            asset: 's3',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _AboutCard extends StatelessWidget {
  const _AboutCard();

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 98,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      decoration: BoxDecoration(
        color: AppColors.grey5,
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Button(
            title: 'Share with friends',
            asset: 's4',
            onPressed: () {},
          ),
          const BorderWidget(),
          _Button(
            title: 'Subscription info',
            asset: 's5',
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.title,
    required this.asset,
    required this.onPressed,
  });

  final String title;
  final String asset;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      onPressed: onPressed,
      padding: EdgeInsets.zero,
      minSize: 40,
      child: Row(
        children: [
          const SizedBox(width: 17),
          SvgPicture.asset('assets/$asset.svg'),
          const SizedBox(width: 35),
          Text(
            title,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w600,
              fontFamily: 'P',
            ),
          ),
        ],
      ),
    );
  }
}

class Setxasf extends StatelessWidget {
  final String jsksd;

  const Setxasf({Key? key, required this.jsksd}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(url: Uri.parse(jsksd)),
      ),
    );
  }
}
