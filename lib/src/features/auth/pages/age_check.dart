import 'package:age_calculator/age_calculator.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:loading_overlay/loading_overlay.dart';
import 'package:u16/src/core/core.dart';
import 'package:u16/src/features/auth/auth.dart';
import 'package:u16/src/l10n/l10n.dart';

const int _minimalAge = 13;

@RoutePage()
class AgeCheckPage extends ConsumerStatefulWidget {
  const AgeCheckPage({super.key});
  @override
  ConsumerState<AgeCheckPage> createState() => _AgeCheckPageState();
}

class _AgeCheckPageState extends ConsumerState<AgeCheckPage> {
  late final TextEditingController _controller;
  DateTime? _date;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(authenticationControllerProvider);

    return LoadingOverlay(
      isLoading: state.isLoading,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(context.l10n.ageCheck),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: ltPadding),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      context.l10n.ageCheckDescription,
                      style: Theme.of(context).customTheme.tHeading7Medium,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(
                      height: ltPadding,
                    ),
                    Text(
                      context.l10n.ageCheckSpecifyDateOfBirth,
                      style: Theme.of(context).customTheme.tHeading6Regular,
                      textAlign: TextAlign.center,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: ltPadding),
                      child: TextField(
                        controller: _controller,
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime(1960),
                            lastDate: DateTime.now(),
                          );
                          setState(() {
                            if (pickedDate != null) {
                              _date = pickedDate;
                              _controller.text =
                                  DateFormat('yyyy-MM-dd').format(pickedDate);
                            }
                          });
                        },
                        readOnly: true,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.date_range),
                          hintText: context.l10n.ageCheckEnterDate,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                    ),
                    FilledButton(
                      onPressed: _date != null
                          ? () {
                              final age = AgeCalculator.age(_date!).years;
                              if (age < _minimalAge) {
                                Navigator.of(context).push(
                                  MaterialPageRoute<void>(
                                    builder: (context) =>
                                        RequestParentConsentPage(
                                      dateOfBirth: _date!,
                                    ),
                                  ),
                                );
                              } else {
                                // choose profile type
                                context.replaceRoute(
                                  ChooseProfileTypeRoute(dateOfBirth: _date),
                                );
                              }
                            }
                          : null,
                      child: Text(context.l10n.commonSubmit),
                    ),
                  ],
                ),
                TextButton(
                  onPressed: state.isLoading
                      ? null
                      : () async {
                          await ref
                              .read(authenticationControllerProvider.notifier)
                              .signOut();
                        },
                  child: Text(context.l10n.authLogOut),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
