import 'package:flutter/material.dart';

class PopupMenu extends StatelessWidget {
  const PopupMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
        // icon: Icon(Icons.menu_open),
        iconSize: 22,
      color: Theme.of(context).colorScheme.onPrimary,
      padding: EdgeInsets.zero,
      onSelected: (value) => value,
      itemBuilder: (context) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(
          value: 'demoMenu',
          child: Row(
            children: [
              Icon(Icons.library_books_outlined,size: 16, color: Theme.of(context).colorScheme.secondary),
              Text(
                ' Журнал событий',
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'demoMenu1',
          child: Row(
            children: [
              Icon(Icons.settings_applications_outlined,size: 16, color: Theme.of(context).colorScheme.secondary),
              Text(
                ' Настройки',
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'demoMenu2',
          child: Row(
            children: [
              Icon(Icons.tips_and_updates_outlined,size: 16, color: Theme.of(context).colorScheme.secondary),
              Text(
                ' Тестирование',
              ),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'demoMenu3',
          child: Row(
            children: [
              Icon(Icons.delete_forever_outlined,size: 16, color: Theme.of(context).colorScheme.secondary),
              Text(
                ' Удалить',
              ),
            ],
          ),
        )
      ],
    );
  }
}
