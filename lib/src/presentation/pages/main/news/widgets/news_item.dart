import 'package:flutter/widgets.dart';

class NewsItem extends StatelessWidget {
  const NewsItem({
    Key? key,
    required this.title,
    required this.body,
  }) : super(key: key);

  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          body,
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }
}
