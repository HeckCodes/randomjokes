const String jokesApiEndpoint = 'https://v2.jokeapi.dev/joke/';

const List<String> blacklistFlags = [
  'nsfw',
  'religious',
  'political',
  'racist',
  'sexist',
  'explicit'
];

const Map<String, String> languages = {
  'en': 'English',
  'es': 'Spanish',
  'de': 'German',
  'fr': 'French',
  'pt': 'Portuguese',
  'cs': 'Czech',
};

const List<String> categories = [
  'Any',
  'Programming',
  'Miscellaneous',
  'Dark',
  'Pun',
  'Spooky',
  'Christmas',
];

const List<String> type = ['single', 'twopart'];

const String safeMode = 'safe-mode';
