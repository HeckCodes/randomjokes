import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:randomjokes/jokes/bloc/random_jokes_bloc.dart';

class ConfigurationWidget extends StatefulWidget {
  final Color color;
  final TextStyle textStyle;
  final Function onColorChange;
  final Function onTextStyleChange;
  const ConfigurationWidget({
    Key? key,
    required this.color,
    required this.textStyle,
    required this.onColorChange,
    required this.onTextStyleChange,
  }) : super(key: key);

  @override
  State<ConfigurationWidget> createState() => _ConfigurationWidgetState();
}

class _ConfigurationWidgetState extends State<ConfigurationWidget> {
  // Category
  List<String> categories = ['Any'];
  bool categoryAny = true;
  bool categoryProgramming = false;
  bool categoryMiscellaneous = false;
  bool categoryDark = false;
  bool categoryPun = false;
  bool categorySpooky = false;
  bool categoryChristmas = false;

  // Language
  String language = 'en';

  // Blacklist Flags
  List<String> blacklistFlags = [
    'nsfw',
    'religious',
    'political',
    'racist',
    'sexist',
    'explicit',
  ];

  bool nsfw = false;
  bool religious = false;
  bool political = false;
  bool racist = false;
  bool sexist = false;
  bool explicit = false;

  // Type
  List<String> type = [];
  bool single = false;
  bool twopart = false;

  // Safe Mode
  bool safeMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Wrap(
            spacing: 5,
            alignment: WrapAlignment.center,
            children: [
              Chip(
                label: const Text('Any'),
                deleteIcon: categoryAny
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    categoryAny = !categoryAny;
                    if (categoryAny) {
                      categories.add('Any');
                    } else {
                      categories.remove('Any');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Programming'),
                deleteIcon: categoryProgramming
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    categoryProgramming = !categoryProgramming;
                    if (categoryProgramming) {
                      categories.add('Programming');
                    } else {
                      categories.remove('Programming');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Miscellaneous'),
                deleteIcon: categoryMiscellaneous
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    categoryMiscellaneous = !categoryMiscellaneous;
                    if (categoryMiscellaneous) {
                      categories.add('Miscellaneous');
                    } else {
                      categories.remove('Miscellaneous');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Dark'),
                deleteIcon: categoryDark
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    categoryDark = !categoryDark;
                    if (categoryDark) {
                      categories.add('Dark');
                    } else {
                      categories.remove('Dark');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Pun'),
                deleteIcon: categoryPun
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    categoryPun = !categoryPun;
                    if (categoryPun) {
                      categories.add('Pun');
                    } else {
                      categories.remove('Pun');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Spooky'),
                deleteIcon: categorySpooky
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    categorySpooky = !categorySpooky;
                    if (categorySpooky) {
                      categories.add('Spooky');
                    } else {
                      categories.remove('Spooky');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Christmas'),
                deleteIcon: categoryChristmas
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    categoryChristmas = !categoryChristmas;
                    if (categoryChristmas) {
                      categories.add('Christmas');
                    } else {
                      categories.remove('Christmas');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('NSFW'),
                deleteIcon: nsfw
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    nsfw = !nsfw;
                    if (nsfw) {
                      blacklistFlags.remove('nsfw');
                    } else {
                      blacklistFlags.add('nsfw');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Religious'),
                deleteIcon: religious
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    religious = !religious;
                    if (religious) {
                      blacklistFlags.remove('religious');
                    } else {
                      blacklistFlags.add('religious');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Political'),
                deleteIcon: political
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    political = !political;
                    if (political) {
                      blacklistFlags.remove('political');
                    } else {
                      blacklistFlags.add('political');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Racist'),
                deleteIcon: racist
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    racist = !racist;
                    if (racist) {
                      blacklistFlags.remove('racist');
                    } else {
                      blacklistFlags.add('racist');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Sexist'),
                deleteIcon: sexist
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    sexist = !sexist;
                    if (sexist) {
                      blacklistFlags.remove('sexist');
                    } else {
                      blacklistFlags.add('sexist');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Explicit'),
                deleteIcon: explicit
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    explicit = !explicit;
                    if (explicit) {
                      blacklistFlags.remove('explicit');
                    } else {
                      blacklistFlags.add('explicit');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Single'),
                deleteIcon: single
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    single = !single;
                    if (single) {
                      type.add('single');
                    } else {
                      type.remove('single');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Two Part'),
                deleteIcon: twopart
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    twopart = !twopart;
                    if (twopart) {
                      type.add('couple');
                    } else {
                      type.remove('couple');
                    }
                  });
                },
              ),
              Chip(
                label: const Text('Safe Mode'),
                deleteIcon: safeMode
                    ? const Icon(Icons.check_rounded)
                    : const Icon(Icons.add_rounded),
                onDeleted: () {
                  setState(() {
                    safeMode = !safeMode;
                    if (safeMode) {
                      type.add('safeMode');
                    } else {
                      type.remove('safeMode');
                    }
                  });
                },
              ),
            ],
          ),
          const SizedBox(height: 8),
          FloatingActionButton.extended(
            backgroundColor: widget.color,
            elevation: 2,
            icon: const Icon(Icons.shuffle_rounded),
            label: Text(
              'Get random joke',
              style: widget.textStyle.copyWith(fontSize: 24),
            ),
            onPressed: () {
              BlocProvider.of<RandomJokesBloc>(context).add(
                RandomJokesEventLoad(
                  language: language,
                  type: type,
                  categories: categories,
                  blacklistFlags: blacklistFlags,
                  safeMode: safeMode,
                ),
              );
              widget.onColorChange();
              widget.onTextStyleChange();
            },
          ),
        ],
      ),
    );
  }
}
