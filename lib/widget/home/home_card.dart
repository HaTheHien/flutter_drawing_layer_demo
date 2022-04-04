import 'package:flutter/material.dart';

class HomeCard extends StatelessWidget {
  final int order;
  final String title;
  final String description;
  final VoidCallback? onTapped;

  const HomeCard({
    Key? key,
    required this.order,
    required this.title,
    required this.description,
    this.onTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(
          // color: Colors.grey.withOpacity(0.2),
          color: Theme.of(context).primaryColorLight,
          width: 1.25,
        ),
      ),
      child: InkWell(
        highlightColor: Theme.of(context).primaryColor.withOpacity(0.25),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
        onTap: onTapped,
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListTile(
                leading: Text(
                  '${order + 1}',
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                title: Text(
                  title,
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                trailing: const Icon(Icons.navigate_next),
              ),
              if (description.isNotEmpty) ...[
                ListTile(
                  leading: const SizedBox(),
                  title: Text(
                    description,
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
