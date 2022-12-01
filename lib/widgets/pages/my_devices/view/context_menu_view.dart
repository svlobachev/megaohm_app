import 'package:flutter/material.dart';

class ContextMenuDemo extends StatelessWidget {
  const ContextMenuDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      onSelected: (value) => value,
      itemBuilder: (context) => <PopupMenuItem<String>>[
        PopupMenuItem<String>(
          value: 'demoMenu',
          child: Text(
            'Журнал событий',
          ),
        ),
        PopupMenuItem<String>(
          value: 'demoMenu1',
          child: Text(
            'Настройки',
          ),
        ),
        PopupMenuItem<String>(
          value: 'demoMenu2',
          child: Text(
            'Тестирование',
          ),
        ),
        PopupMenuItem<String>(
          value: 'demoMenu3',
          child: Text(
            'Удалить',
          ),
        )
      ],
    );
  }
}
