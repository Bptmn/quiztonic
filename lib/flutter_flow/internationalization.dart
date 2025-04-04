import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

const _kLocaleStorageKey = '__locale_key__';

class FFLocalizations {
  FFLocalizations(this.locale);

  final Locale locale;

  static FFLocalizations of(BuildContext context) =>
      Localizations.of<FFLocalizations>(context, FFLocalizations)!;

  static List<String> languages() => ['en', 'fr', 'es'];

  static late SharedPreferences _prefs;
  static Future initialize() async =>
      _prefs = await SharedPreferences.getInstance();
  static Future storeLocale(String locale) =>
      _prefs.setString(_kLocaleStorageKey, locale);
  static Locale? getStoredLocale() {
    final locale = _prefs.getString(_kLocaleStorageKey);
    return locale != null && locale.isNotEmpty ? createLocale(locale) : null;
  }

  String get languageCode => locale.toString();
  String? get languageShortCode =>
      _languagesWithShortCode.contains(locale.toString())
          ? '${locale.toString()}_short'
          : null;
  int get languageIndex => languages().contains(languageCode)
      ? languages().indexOf(languageCode)
      : 0;

  String getText(String key) =>
      (kTranslationsMap[key] ?? {})[locale.toString()] ?? '';

  String getVariableText({
    String? enText = '',
    String? frText = '',
    String? esText = '',
  }) =>
      [enText, frText, esText][languageIndex] ?? '';

  static const Set<String> _languagesWithShortCode = {
    'ar',
    'az',
    'ca',
    'cs',
    'da',
    'de',
    'dv',
    'en',
    'es',
    'et',
    'fi',
    'fr',
    'gr',
    'he',
    'hi',
    'hu',
    'it',
    'km',
    'ku',
    'mn',
    'ms',
    'no',
    'pt',
    'ro',
    'ru',
    'rw',
    'sv',
    'th',
    'uk',
    'vi',
  };
}

/// Used if the locale is not supported by GlobalMaterialLocalizations.
class FallbackMaterialLocalizationDelegate
    extends LocalizationsDelegate<MaterialLocalizations> {
  const FallbackMaterialLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<MaterialLocalizations> load(Locale locale) async =>
      SynchronousFuture<MaterialLocalizations>(
        const DefaultMaterialLocalizations(),
      );

  @override
  bool shouldReload(FallbackMaterialLocalizationDelegate old) => false;
}

/// Used if the locale is not supported by GlobalCupertinoLocalizations.
class FallbackCupertinoLocalizationDelegate
    extends LocalizationsDelegate<CupertinoLocalizations> {
  const FallbackCupertinoLocalizationDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<CupertinoLocalizations> load(Locale locale) =>
      SynchronousFuture<CupertinoLocalizations>(
        const DefaultCupertinoLocalizations(),
      );

  @override
  bool shouldReload(FallbackCupertinoLocalizationDelegate old) => false;
}

class FFLocalizationsDelegate extends LocalizationsDelegate<FFLocalizations> {
  const FFLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) => _isSupportedLocale(locale);

  @override
  Future<FFLocalizations> load(Locale locale) =>
      SynchronousFuture<FFLocalizations>(FFLocalizations(locale));

  @override
  bool shouldReload(FFLocalizationsDelegate old) => false;
}

Locale createLocale(String language) => language.contains('_')
    ? Locale.fromSubtags(
        languageCode: language.split('_').first,
        scriptCode: language.split('_').last,
      )
    : Locale(language);

bool _isSupportedLocale(Locale locale) {
  final language = locale.toString();
  return FFLocalizations.languages().contains(
    language.endsWith('_')
        ? language.substring(0, language.length - 1)
        : language,
  );
}

final kTranslationsMap = <Map<String, Map<String, String>>>[
  // QuizExo
  {
    'pw3tkdme': {
      'en': 'Previous',
      'es': 'Anterior',
      'fr': 'Précédent',
    },
    '2c4cw188': {
      'en': 'Next',
      'es': 'Próximo',
      'fr': 'Suivant',
    },
    'lc0wvw5a': {
      'en': 'Complete',
      'es': 'Completo',
      'fr': 'Complet',
    },
    '2v5zgmc1': {
      'en': 'Quizz',
      'es': '',
      'fr': '',
    },
  },
  // ScorePage
  {
    '949xtdyk': {
      'en': 'Quiz Complete!',
      'es': '',
      'fr': '',
    },
    'czchw84o': {
      'en': 'Your Score',
      'es': '',
      'fr': '',
    },
    'jlff7osh': {
      'en': '/',
      'es': '',
      'fr': '',
    },
    'rhb37opn': {
      'en': 'Performance Breakdown',
      'es': '',
      'fr': '',
    },
    'oudpgjpc': {
      'en': 'Correct Answers',
      'es': '',
      'fr': '',
    },
    '04i8wpdn': {
      'en': 'Incorrect Answers',
      'es': '',
      'fr': '',
    },
    'xfakpfd5': {
      'en': 'Completion Time',
      'es': '',
      'fr': '',
    },
    'nlu62c7y': {
      'en': 'Learn with the Flashcards',
      'es': '',
      'fr': '',
    },
    'a9gi5di2': {
      'en': 'Add to a folder',
      'es': '',
      'fr': '',
    },
    'rt6irlgd': {
      'en': 'Back to Home',
      'es': 'Volver a la página de inicio',
      'fr': 'Retour à l\'accueil',
    },
  },
  // HomePage
  {
    'j4hce7ml': {
      'en': 'Quiz',
      'es': 'Prueba',
      'fr': 'Questionnaire',
    },
    '3qx562ah': {
      'en': 'Tonic',
      'es': '',
      'fr': '',
    },
    'tfykgh14': {
      'en': 'Dashboard',
      'es': '',
      'fr': '',
    },
    '71sf38af': {
      'en': 'Dashboard',
      'es': '',
      'fr': '',
    },
    '8yc2zp01': {
      'en': 'Quiz',
      'es': '',
      'fr': '',
    },
    'u8qvrshd': {
      'en': 'Questions',
      'es': '',
      'fr': '',
    },
    'w9d6epg8': {
      'en': 'Correct',
      'es': '',
      'fr': '',
    },
    'rm6vgq87': {
      'en': 'Generate a new Quiz',
      'es': 'Generar un nuevo cuestionario',
      'fr': 'Générer un nouveau quiz',
    },
    '0n1qgekd': {
      'en': 'Recent Quizzes',
      'es': '',
      'fr': '',
    },
    '28cdmgv3': {
      'en': 'Dashboard',
      'es': '',
      'fr': '',
    },
  },
  // GenerateNewQuiz
  {
    'rsq6a7d1': {
      'en': 'Generate a new quiz',
      'es': '',
      'fr': '',
    },
    'xix5b4fe': {
      'en': 'Generate a new quiz',
      'es': '',
      'fr': '',
    },
    'yxq1hbmg': {
      'en': 'Choose Input Format',
      'es': '',
      'fr': '',
    },
    't9rzubam': {
      'en': 'Website URL',
      'es': '',
      'fr': '',
    },
    '6lpl84d7': {
      'en': 'Website URL',
      'es': '',
      'fr': '',
    },
    'yijk6sqe': {
      'en': 'Search...',
      'es': '',
      'fr': '',
    },
    'ctdkle21': {
      'en': 'Raw text',
      'es': '',
      'fr': '',
    },
    '0zqa3so0': {
      'en': 'Website URL',
      'es': '',
      'fr': '',
    },
    'm4eew1el': {
      'en': 'PDF file',
      'es': '',
      'fr': '',
    },
    'h9aevirc': {
      'en': 'Enter your text content',
      'es': '',
      'fr': '',
    },
    '9047lxhq': {
      'en': 'Enter your text here...',
      'es': '',
      'fr': '',
    },
    'pe8avzqo': {
      'en': 'paste',
      'es': '',
      'fr': '',
    },
    'itbni5eg': {
      'en': 'Select a PDF file',
      'es': '',
      'fr': '',
    },
    'fbla3rzo': {
      'en': 'Click to upload',
      'es': 'Haga clic para cargar',
      'fr': 'Cliquez pour télécharger',
    },
    '3jfzozzo': {
      'en': 'Enter a website URL',
      'es': '',
      'fr': '',
    },
    'xcmt1jm0': {
      'en': 'Enter an url here...',
      'es': '',
      'fr': '',
    },
    'fz6erg47': {
      'en': 'paste',
      'es': '',
      'fr': '',
    },
    'rk7887xn': {
      'en': 'Quiz Settings',
      'es': '',
      'fr': '',
    },
    'wki9wvcs': {
      'en': 'Number of Questions',
      'es': '',
      'fr': '',
    },
    'i8deixx7': {
      'en': 'Generate flashcards ?',
      'es': '',
      'fr': '',
    },
    '1l2sr4pm': {
      'en': 'Generate Quiz',
      'es': 'Generar cuestionario',
      'fr': 'Générer un quiz',
    },
    'cf9352nf': {
      'en': 'New Quiz',
      'es': '',
      'fr': '',
    },
  },
  // Profile
  {
    'i9xsjequ': {
      'en': 'Profile',
      'es': '',
      'fr': '',
    },
    'qnvaftvt': {
      'en': 'Profile',
      'es': '',
      'fr': '',
    },
    'm9qy7hib': {
      'en': 'Light Mode',
      'es': '',
      'fr': '',
    },
    'o3ysbj2r': {
      'en': 'Dark Mode',
      'es': '',
      'fr': '',
    },
    'gy3dzsfz': {
      'en': 'Edit Profile',
      'es': '',
      'fr': '',
    },
    'n9570amw': {
      'en': 'Payment Options',
      'es': '',
      'fr': '',
    },
    'zqf451b8': {
      'en': 'Notification Settings',
      'es': '',
      'fr': '',
    },
    'm5qsh3gn': {
      'en': 'Security',
      'es': '',
      'fr': '',
    },
    'd2lu5q4t': {
      'en': 'Support',
      'es': '',
      'fr': '',
    },
    'y2k1ncq8': {
      'en': 'Terms of Service',
      'es': '',
      'fr': '',
    },
    'open2vlo': {
      'en': 'Invite Friends',
      'es': '',
      'fr': '',
    },
    'gjy1eew2': {
      'en': 'Test Page',
      'es': '',
      'fr': '',
    },
    'zentdpfj': {
      'en': 'Languages',
      'es': '',
      'fr': '',
    },
    'a009pzt9': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Déconnexion',
    },
    '9ly4ieu3': {
      'en': 'Profile',
      'es': '',
      'fr': '',
    },
  },
  // QuizPage
  {
    '7nh5t6ns': {
      'en': 'Quiz',
      'es': '',
      'fr': '',
    },
    'kbz0b7cn': {
      'en': 'Quiz',
      'es': '',
      'fr': '',
    },
    'vw0p8xak': {
      'en': 'Information',
      'es': '',
      'fr': '',
    },
    'v2ri64tl': {
      'en': 'Name: ',
      'es': 'Nombre:',
      'fr': 'Nom:',
    },
    'mwyduust': {
      'en': 'Folder: ',
      'es': '',
      'fr': '',
    },
    'v7i066zx': {
      'en': 'Add to a folder',
      'es': '',
      'fr': '',
    },
    'gdakmdmi': {
      'en': 'Performance Breakdown',
      'es': '',
      'fr': '',
    },
    'ahfcj7mp': {
      'en': 'Correct Answers',
      'es': 'Respuestas correctas',
      'fr': 'Réponses correctes',
    },
    'bgkaozti': {
      'en': 'Incorrect Answers',
      'es': 'Respuestas incorrectas',
      'fr': 'Réponses incorrectes',
    },
    '5acbcqd5': {
      'en': 'Completion Time',
      'es': 'Tiempo de finalización',
      'fr': 'Délai d\'exécution',
    },
    '8cmwl3zl': {
      'en': 'Learn with the Flashcards',
      'es': 'Aprende con las Flashcards',
      'fr': 'Apprenez avec les Flashcards',
    },
    '0ed41fsg': {
      'en': 'Restart the quiz',
      'es': '',
      'fr': '',
    },
    '46f8m2m7': {
      'en': 'See my answers',
      'es': 'Ver mis respuestas',
      'fr': 'Voir mes réponses',
    },
    'vy0oux3h': {
      'en': 'Delete this quiz',
      'es': 'Eliminar este cuestionario',
      'fr': 'Supprimer ce quiz',
    },
    'zd3w48v4': {
      'en': 'Home',
      'es': '',
      'fr': '',
    },
  },
  // FlashcardsPage
  {
    '45gycve4': {
      'en': 'Flashcards',
      'es': '',
      'fr': '',
    },
    '6fg14x5s': {
      'en': 'Flashcards',
      'es': '',
      'fr': '',
    },
    '9ejsuro2': {
      'en': '/',
      'es': '/',
      'fr': '/',
    },
    'ddclafab': {
      'en': 'Quiz',
      'es': '',
      'fr': '',
    },
    'e8m6back': {
      'en': 'Previous',
      'es': 'Anterior',
      'fr': 'Précédent',
    },
    '98wm4xnt': {
      'en': 'Next',
      'es': 'Próximo',
      'fr': 'Suivant',
    },
    'z3nz7lzn': {
      'en': 'Complete',
      'es': 'Completo',
      'fr': 'Complet',
    },
    'iqyaev74': {
      'en': 'Quizz',
      'es': '',
      'fr': '',
    },
  },
  // Library
  {
    '2opxeg5r': {
      'en': 'Library',
      'es': '',
      'fr': '',
    },
    'db6agf1s': {
      'en': 'Library',
      'es': '',
      'fr': '',
    },
    'bo87n0ll': {
      'en': 'Search a folder...',
      'es': '',
      'fr': '',
    },
    'lbiiojbo': {
      'en': 'Create a new folder',
      'es': 'Crear una nueva carpeta',
      'fr': 'Créer un nouveau dossier',
    },
    'b48ajiz0': {
      'en': 'Library',
      'es': '',
      'fr': '',
    },
  },
  // EditUserProfile
  {
    'e5le35vp': {
      'en': 'Edit my information',
      'es': '',
      'fr': '',
    },
    'eapntub4': {
      'en': 'Edit my information',
      'es': '',
      'fr': '',
    },
    'mkz76a8o': {
      'en': 'User name',
      'es': '',
      'fr': '',
    },
    'zxmi28oh': {
      'en': 'Enter a username',
      'es': 'Introduzca un nombre de usuario',
      'fr': 'Entrez un nom d\'utilisateur',
    },
    '5d3ga1gp': {
      'en': 'Email Address',
      'es': '',
      'fr': '',
    },
    '49j8ipxf': {
      'en': 'TextField',
      'es': 'Campo de texto',
      'fr': 'Champ de texte',
    },
    'wu3ytaso': {
      'en':
          'If changed, a verification link will be sent to your new email address.',
      'es': '',
      'fr': '',
    },
    '8u2p2x84': {
      'en': 'Save modifications',
      'es': 'Guardar modificaciones',
      'fr': 'Enregistrer les modifications',
    },
    '3dljjw4q': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LoginPage
  {
    'lqbpr1tf': {
      'en': 'Quiz',
      'es': 'Prueba',
      'fr': 'Questionnaire',
    },
    'kmw759p3': {
      'en': 'Tonic',
      'es': 'Tónico',
      'fr': 'Tonique',
    },
    'yms8ffq3': {
      'en': 'Log in to your account',
      'es': '',
      'fr': '',
    },
    'c02mn4wz': {
      'en': 'Welcome back! Please enter your details.',
      'es': '',
      'fr': '',
    },
    '7ebq4ti3': {
      'en': 'Email',
      'es': '',
      'fr': '',
    },
    'fn986xbg': {
      'en': 'Password',
      'es': '',
      'fr': '',
    },
    '0fr060zw': {
      'en': 'Forget password?',
      'es': '',
      'fr': '',
    },
    '1qm480oz': {
      'en': 'Email is required.',
      'es': '',
      'fr': '',
    },
    'z3ehe0az': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    'eth026dm': {
      'en': 'Password is required.',
      'es': '',
      'fr': '',
    },
    '9oo0jgbd': {
      'en': 'Please choose an option from the dropdown',
      'es': '',
      'fr': '',
    },
    's1witho8': {
      'en': 'Log in',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'm81k9krp': {
      'en': 'Or continue with ',
      'es': '',
      'fr': '',
    },
    'a7ipk6yz': {
      'en': 'Sign in with Google',
      'es': '',
      'fr': '',
    },
    'f9dyvhpt': {
      'en': 'Sign in with Apple',
      'es': '',
      'fr': '',
    },
    'abg4x4qp': {
      'en': 'Don\'t have an account? ',
      'es': '',
      'fr': '',
    },
    '91zhy50v': {
      'en': 'Sign up',
      'es': '',
      'fr': '',
    },
    'y4c1hpdi': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SignUpPage
  {
    'o169pg4g': {
      'en': 'Quiz',
      'es': 'Prueba',
      'fr': 'Questionnaire',
    },
    'ngvqhgg0': {
      'en': 'Tonic',
      'es': 'Tónico',
      'fr': 'Tonique',
    },
    'jq4ztgm8': {
      'en': 'Create an account',
      'es': '',
      'fr': '',
    },
    'm1f85p0a': {
      'en': 'Welcome! Please enter your details.',
      'es': '',
      'fr': '',
    },
    '5eyih4g1': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'ndj1fk4r': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    'k9zgamgt': {
      'en': 'Confirm password',
      'es': '',
      'fr': '',
    },
    'tzhc854h': {
      'en': 'Email is required.',
      'es': 'Se requiere correo electrónico.',
      'fr': 'L\'e-mail est obligatoire.',
    },
    'z17r9tus': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'c7rxynzj': {
      'en': 'Password is required.',
      'es': 'Se requiere contraseña.',
      'fr': 'Le mot de passe est requis.',
    },
    'tmmsjgsm': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    '7m6675vn': {
      'en': 'Sign up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
    },
    'gf0pi3v8': {
      'en': 'Or continue with ',
      'es': 'O continuar con',
      'fr': 'Ou continuez avec',
    },
    'wt7wwq3r': {
      'en': 'Sign up with Google',
      'es': '',
      'fr': '',
    },
    'd2qzg44r': {
      'en': 'Sign up with Apple',
      'es': '',
      'fr': '',
    },
    '4yb4baap': {
      'en': 'You already have an account? ',
      'es': '',
      'fr': '',
    },
    '0wdggadc': {
      'en': 'Login',
      'es': '',
      'fr': '',
    },
    '3ohqv64e': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // FolderPage
  {
    'gofnmf1a': {
      'en': 'Edit the folder',
      'es': 'Editar la carpeta',
      'fr': 'Modifier le dossier',
    },
    'wunzriiq': {
      'en': 'Delete this folder',
      'es': 'Eliminar esta carpeta',
      'fr': 'Supprimer ce dossier',
    },
    'cdkrkzv3': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // TestPage
  {
    'u2u7puf1': {
      'en': 'Create user statistic table',
      'es': '',
      'fr': '',
    },
    'oyst20iq': {
      'en': 'Test Page',
      'es': 'Página de prueba',
      'fr': 'Page de test',
    },
    '5t8axkre': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // QuizAnswersPage
  {
    'ez5dh7pg': {
      'en': 'My answers',
      'es': '',
      'fr': '',
    },
    '344koiwf': {
      'en': 'My answers',
      'es': '',
      'fr': '',
    },
    'uxw78qn2': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // SecurityPage
  {
    '1dl1wywp': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'amxoxtf5': {
      'en': 'Security',
      'es': '',
      'fr': '',
    },
    'odr06vdw': {
      'en': 'Change my password',
      'es': '',
      'fr': '',
    },
    'qjm7czzu': {
      'en': 'Enter a new password',
      'es': 'Introduzca una nueva contraseña',
      'fr': 'Entrez un nouveau mot de passe',
    },
    'r8ha1jsv': {
      'en': 'Confirm new password',
      'es': 'Confirmar nueva contraseña',
      'fr': 'Confirmer le nouveau mot de passe',
    },
    'q1ul3ifg': {
      'en': 'Validate',
      'es': 'Validar',
      'fr': 'Valider',
    },
    'uze5ukfc': {
      'en': 'Delete my account',
      'es': 'Eliminar mi cuenta',
      'fr': 'Supprimer mon compte',
    },
    'b42k2quz': {
      'en':
          'This action is permanent and cannot be undone.\nAll your data, including saved quizzes, flashcards, history, and folders, will be permanently deleted and cannot be recovered.',
      'es': '',
      'fr': '',
    },
    '4pn2kva5': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // LanguageSettings
  {
    '9f7s9ytk': {
      'en': 'Choose Language',
      'es': '',
      'fr': '',
    },
    'tslq4lbj': {
      'en': 'Select your preferred language for the app interface',
      'es': '',
      'fr': '',
    },
    '3i0m0gwz': {
      'en': '🇺🇸',
      'es': '',
      'fr': '',
    },
    '6oun1k2n': {
      'en': 'English',
      'es': '',
      'fr': '',
    },
    'r66f5zh5': {
      'en': 'English',
      'es': '',
      'fr': '',
    },
    '5m38gwt8': {
      'en': '🇪🇸',
      'es': '',
      'fr': '',
    },
    'ygfpclo9': {
      'en': 'Spanish',
      'es': '',
      'fr': '',
    },
    'y82i1f7b': {
      'en': 'Español',
      'es': '',
      'fr': '',
    },
    'usqjwgqn': {
      'en': '🇫🇷',
      'es': '',
      'fr': '',
    },
    'vb6dqgpv': {
      'en': 'French',
      'es': '',
      'fr': '',
    },
    '5g656st3': {
      'en': 'Français',
      'es': '',
      'fr': '',
    },
  },
  // QuestionCard
  {
    '4vaa3snx': {
      'en': 'Correct answer',
      'es': '',
      'fr': '',
    },
    'zzn46win': {
      'en': 'Wrong answer',
      'es': '',
      'fr': '',
    },
    'poib76jn': {
      'en': 'Explanation:',
      'es': '',
      'fr': '',
    },
  },
  // QuizItem
  {
    '06maizap': {
      'en': 'Completed on ',
      'es': 'Completado el',
      'fr': 'Terminé le',
    },
    'sn785xqx': {
      'en': 'Completed on June 15, 2023',
      'es': '',
      'fr': '',
    },
    'h7tgj9ha': {
      'en': '/',
      'es': '/',
      'fr': '/',
    },
    '762zwbjf': {
      'en': ' correct',
      'es': '',
      'fr': '',
    },
    'xl78d0r1': {
      'en': '9/10 correct',
      'es': '',
      'fr': '',
    },
  },
  // FolderItem
  {
    '3h2fvj5h': {
      'en': 'Number of quiz: ',
      'es': '',
      'fr': '',
    },
  },
  // createNewFolder
  {
    '3l6mbaft': {
      'en': 'Create New Folder',
      'es': '',
      'fr': '',
    },
    'uyvnilbj': {
      'en': 'Folder Name',
      'es': '',
      'fr': '',
    },
    '7ojapcmc': {
      'en': 'ex: Geography',
      'es': '',
      'fr': '',
    },
    'ev33i570': {
      'en': 'Create Folder',
      'es': 'Crear carpeta',
      'fr': 'Créer un dossier',
    },
  },
  // PickUpAfolder
  {
    'gkkvujn5': {
      'en': 'Choose a Folder',
      'es': '',
      'fr': '',
    },
    'csq5q7bv': {
      'en': 'Create a new folder',
      'es': 'Crear una nueva carpeta',
      'fr': 'Créer un nouveau dossier',
    },
  },
  // editFolder
  {
    '8di9op1g': {
      'en': 'Edit Folder',
      'es': '',
      'fr': '',
    },
    'gkwre7fj': {
      'en': 'Change folder Name',
      'es': '',
      'fr': '',
    },
    'ngwqevte': {
      'en': 'Enter a new folder name...',
      'es': '',
      'fr': '',
    },
    'q432rg5g': {
      'en': 'Validate',
      'es': 'Validar',
      'fr': 'Valider',
    },
  },
  // passwordCheck
  {
    'rozt21r8': {
      'en': 'Security: this action require your password',
      'es': '',
      'fr': '',
    },
    'my2eu77e': {
      'en': 'Enter your password',
      'es': '',
      'fr': '',
    },
    'ut1np4g8': {
      'en': 'Validate',
      'es': 'Validar',
      'fr': 'Valider',
    },
    'h09dospf': {
      'en': 'Or continue with ',
      'es': 'O continuar con',
      'fr': 'Ou continuez avec',
    },
    '5ujo0oet': {
      'en': 'Sign in with Google',
      'es': 'Iniciar sesión con Google',
      'fr': 'Connectez-vous avec Google',
    },
    '6bnsgigc': {
      'en': 'Sign in with Apple',
      'es': 'Iniciar sesión con Apple',
      'fr': 'Connectez-vous avec Apple',
    },
  },
  // resetPassword
  {
    'nhuvy1w3': {
      'en': 'Reset my Password',
      'es': '',
      'fr': '',
    },
    'y6lo1ccl': {
      'en': 'A reset link will be sent to your email address',
      'es': '',
      'fr': '',
    },
    'o74227q3': {
      'en': 'Enter your email address',
      'es': '',
      'fr': '',
    },
    '7ezvvjcs': {
      'en': 'Send reset link',
      'es': 'Enviar enlace de restablecimiento',
      'fr': 'Envoyer le lien de réinitialisation',
    },
  },
  // WebSideBar
  {
    '3ol6lwxr': {
      'en': 'Dashboard',
      'es': 'Panel',
      'fr': 'Tableau de bord',
    },
    'zzg436qf': {
      'en': 'Library',
      'es': 'Biblioteca',
      'fr': 'Bibliothèque',
    },
    '0ljgtw0k': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    '9kvng4b1': {
      'en': 'Light Mode',
      'es': 'Modo claro',
      'fr': 'Mode lumière',
    },
    'bx3p0m2h': {
      'en': 'Dark Mode',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
    },
    '116k4d6h': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Déconnexion',
    },
  },
  // Miscellaneous
  {
    'j297tagg': {
      'en': 'Button',
      'es': 'Botón',
      'fr': 'Bouton',
    },
    'w4lz2o93': {
      'en': 'Quizz',
      'es': 'Cuestionario',
      'fr': 'Quiz',
    },
    'b2qa6x46': {
      'en': 'Previous',
      'es': 'Anterior',
      'fr': 'Précédent',
    },
    'm0p7ghoa': {
      'en': 'Next',
      'es': 'Próximo',
      'fr': 'Suivant',
    },
    'mjzsitta': {
      'en': 'Delete',
      'es': 'Borrar',
      'fr': 'Supprimer',
    },
    '9q0odqqq': {
      'en': 'Button',
      'es': 'Botón',
      'fr': 'Bouton',
    },
    '8ku0wlfs': {
      'en': 'TextField',
      'es': 'Campo de texto',
      'fr': 'Champ de texte',
    },
    'p1mdisj1': {
      'en':
          'This app requires access to your photos to allow you to upload and use images within the app. We respect your privacy and will only use your photos as intended. Do you allow access?',
      'es':
          'Esta aplicación requiere acceso a tus fotos para que puedas subirlas y usarlas. Respetamos tu privacidad y solo usaremos tus fotos según lo previsto. ¿Permites el acceso?',
      'fr':
          'Cette application nécessite l\'accès à vos photos pour vous permettre de les télécharger et de les utiliser. Nous respectons votre vie privée et n\'utiliserons vos photos que pour les fins prévues. Autorisez-vous l\'accès ?',
    },
    'x9fzob96': {
      'en':
          'This app would like to send you notifications to keep you updated with important alerts and updates. You can manage your preferences anytime in settings. Do you allow notifications?',
      'es':
          'Esta aplicación te envía notificaciones para mantenerte al día con alertas y actualizaciones importantes. Puedes configurar tus preferencias en cualquier momento en la configuración. ¿Permites las notificaciones?',
      'fr':
          'Cette application souhaite vous envoyer des notifications pour vous tenir informé(e) des alertes et mises à jour importantes. Vous pouvez gérer vos préférences à tout moment dans les paramètres. Acceptez-vous les notifications ?',
    },
    'r28vmobc': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'cizrl0bj': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'dykmtnmb': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'cdkfl8g6': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'uv8zydcl': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'd69hvlhg': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'v1spst1l': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'exn3aoxb': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'zt7rr0ar': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'k0xxijtp': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '7kow8wc6': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'pdpo67n9': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '7n2o30hb': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'gq1uyexf': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'l59k3zu6': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'rvk7vshk': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'uwozth9e': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'p4b5f8si': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'lzuy3h5y': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'z2san6cm': {
      'en': '',
      'es': '',
      'fr': '',
    },
    '78z9vqra': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'xjgegvkj': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'm7hbw0bt': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'ioib6348': {
      'en': '',
      'es': '',
      'fr': '',
    },
    'v3ol8w8b': {
      'en': '',
      'es': '',
      'fr': '',
    },
  },
].reduce((a, b) => a..addAll(b));
