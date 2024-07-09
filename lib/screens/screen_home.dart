import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hisab/routes/route.dart';
import 'package:hisab/screens/widgets/widget_entity_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blue,
        title: const Text('Hisab'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: Center(
          child: Row(
            children: [
              Expanded(
                child: WidgetEntityCard(
                  icon: PhosphorIcons.building(),
                  name: "Firm",
                  onTap: () {
                    router.push('/firms');
                  },
                ),
              ),
              const SizedBox(width: 50),
              Expanded(
                child: WidgetEntityCard(
                  icon: PhosphorIcons.farm(),
                  name: "Sites",
                  onTap: () {
                    router.push('/sites');
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
