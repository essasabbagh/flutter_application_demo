import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_application_demo/locale/langes.dart';
import 'package:flutter_application_demo/locale/provider/locale_provider.dart';

class LanguagePicker extends ConsumerWidget {
  const LanguagePicker({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Locale currentLocale = ref.watch(localeControllerProvider);
    List<Locale> supportedLocales = ref.watch(supportedLocalesProvider);

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DropdownButtonFormField<Locale>(
        isDense: true,
        value:
            (!supportedLocales.contains(currentLocale)) ? null : currentLocale,
        icon: const Icon(Icons.arrow_drop_down),

        onChanged: (Locale? newLocale) {
          if (newLocale == null) return;
          print('Selected $newLocale');

          // Set the locale (this will rebuild the app)
          ref.read(localeControllerProvider.notifier).changeLocale(newLocale);

          return;
        },
        // Create drop down items from our supported locales
        items: supportedLocales
            .map<DropdownMenuItem<Locale>>(
              (locale) => DropdownMenuItem<Locale>(
                value: locale,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Row(
                    children: [
                      Text(
                        getFlagEmoji(locale),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        translateLocaleName(locale),
                      ),
                    ],
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
