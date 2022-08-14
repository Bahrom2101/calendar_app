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
    return SizedBox(
      height: 80,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            maxLines: 1,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            body,
            maxLines: 3,
            style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
