import 'package:chat_application/common/theme/extension/color_brand.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.shell});

  final StatefulNavigationShell shell;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    StatefulNavigationShell shell = widget.shell;
    int selectedIndex = shell.currentIndex;

    ColorBrand colorBrand = Theme.of(context).extension()!;
    TextTheme textTheme = TextTheme.of(context);
    ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: shell,
      bottomNavigationBar: Container(
        padding: EdgeInsets.all(24.0),
        decoration: BoxDecoration(
          color: colorScheme.surface,
          boxShadow: [BoxShadow(color: Colors.grey, offset: Offset(0, 1))],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            InkWell(
              onTap: () {
                shell.goBranch(0);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (selectedIndex == 0)
                    Text(
                      "Contact",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorBrand.brandDefault,
                      ),
                    ),
                  if (selectedIndex != 0) Icon(Icons.person_outline_rounded),

                  if (selectedIndex == 0)
                    Icon(Icons.circle, size: 8, color: colorBrand.brandDefault),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                shell.goBranch(1);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (selectedIndex == 1)
                    Text(
                      "Chats",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorBrand.brandDefault,
                      ),
                    ),
                  if (selectedIndex != 1)
                    Icon(Icons.chat_bubble_outline_outlined),

                  if (selectedIndex == 1)
                    Icon(Icons.circle, size: 8, color: colorBrand.brandDefault),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                shell.goBranch(2);
              },
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (selectedIndex == 2)
                    Text(
                      "Settings",
                      style: textTheme.bodyMedium?.copyWith(
                        color: colorBrand.brandDefault,
                      ),
                    ),
                  if (selectedIndex != 2) Icon(Icons.more_horiz_outlined),

                  if (selectedIndex == 2)
                    Icon(Icons.circle, size: 8, color: colorBrand.brandDefault),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
