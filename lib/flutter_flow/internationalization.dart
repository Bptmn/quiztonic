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
      'es': 'Quiz',
      'fr': 'Quiz',
    },
  },
  // ScorePage
  {
    '949xtdyk': {
      'en': 'Quiz Complete!',
      'es': '¡Cuestionario completado!',
      'fr': 'Quiz terminé !',
    },
    'czchw84o': {
      'en': 'Your Score',
      'es': 'Tu puntuación',
      'fr': 'Votre score',
    },
    'jlff7osh': {
      'en': '/',
      'es': '/',
      'fr': '/',
    },
    'rhb37opn': {
      'en': 'Performance Breakdown',
      'es': 'Desglose del rendimiento',
      'fr': 'Répartition des performances',
    },
    'oudpgjpc': {
      'en': 'Correct Answers',
      'es': 'Respuestas correctas',
      'fr': 'Réponses correctes',
    },
    '04i8wpdn': {
      'en': 'Incorrect Answers',
      'es': 'Respuestas incorrectas',
      'fr': 'Réponses incorrectes',
    },
    'xfakpfd5': {
      'en': 'Completion Time',
      'es': 'Tiempo de finalización',
      'fr': 'Délai d\'exécution',
    },
    'nlu62c7y': {
      'en': 'Learn with the Flashcards',
      'es': 'Aprende con las Flashcards',
      'fr': 'Apprenez avec les Flashcards',
    },
    'a9gi5di2': {
      'en': 'Add to a folder',
      'es': 'Agregar a una carpeta',
      'fr': 'Ajouter à un dossier',
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
      'es': 'Quiz',
      'fr': 'Quiz',
    },
    '3qx562ah': {
      'en': 'Tonic',
      'es': 'Tonic',
      'fr': 'Tonic',
    },
    'tfykgh14': {
      'en': 'Dashboard',
      'es': 'Panel',
      'fr': 'Tableau de bord',
    },
    '71sf38af': {
      'en': 'Dashboard',
      'es': 'Panel',
      'fr': 'Tableau de bord',
    },
    '8yc2zp01': {
      'en': 'Quiz',
      'es': 'Quiz',
      'fr': 'Quiz',
    },
    'u8qvrshd': {
      'en': 'Questions',
      'es': 'Preguntas',
      'fr': 'Questions',
    },
    'w9d6epg8': {
      'en': 'Correct',
      'es': 'Correcto',
      'fr': 'Correct',
    },
    'rm6vgq87': {
      'en': 'Generate a new Quiz',
      'es': 'Generar un nuevo cuestionario',
      'fr': 'Générer un nouveau quiz',
    },
    '0n1qgekd': {
      'en': 'Recent Quizzes',
      'es': 'Cuestionarios recientes',
      'fr': 'Quiz récents',
    },
    '28cdmgv3': {
      'en': 'Dashboard',
      'es': 'Panel',
      'fr': 'Tableau de bord',
    },
  },
  // GenerateNewQuiz
  {
    'rsq6a7d1': {
      'en': 'Generate a new quiz',
      'es': 'Generar un nuevo cuestionario',
      'fr': 'Générer un nouveau quiz',
    },
    'xix5b4fe': {
      'en': 'Generate a new quiz',
      'es': 'Generar un nuevo cuestionario',
      'fr': 'Générer un nouveau quiz',
    },
    'yxq1hbmg': {
      'en': 'Choose Input Format',
      'es': 'Elija el formato de entrada',
      'fr': 'Choisir le format d\'entrée',
    },
    't9rzubam': {
      'en': 'Website URL',
      'es': 'URL del sitio web',
      'fr': 'URL du site Web',
    },
    '6lpl84d7': {
      'en': 'Website URL',
      'es': 'URL del sitio web',
      'fr': 'URL du site Web',
    },
    'yijk6sqe': {
      'en': 'Search...',
      'es': 'Buscar...',
      'fr': 'Recherche...',
    },
    'ctdkle21': {
      'en': 'Raw text',
      'es': 'Texto sin formato',
      'fr': 'Texte brut',
    },
    '0zqa3so0': {
      'en': 'Website URL',
      'es': 'URL del sitio web',
      'fr': 'URL du site Web',
    },
    'm4eew1el': {
      'en': 'PDF file',
      'es': 'Archivo PDF',
      'fr': 'Fichier PDF',
    },
    'h9aevirc': {
      'en': 'Enter your text content',
      'es': 'Ingrese su contenido de texto',
      'fr': 'Entrez votre contenu de texte',
    },
    '9047lxhq': {
      'en': 'Enter your text here...',
      'es': 'Introduzca su texto aquí...',
      'fr': 'Entrez votre texte ici...',
    },
    'pe8avzqo': {
      'en': 'paste',
      'es': 'pasta',
      'fr': 'coller',
    },
    'itbni5eg': {
      'en': 'Select a PDF file',
      'es': 'Seleccione un archivo PDF',
      'fr': 'Sélectionnez un fichier PDF',
    },
    'fbla3rzo': {
      'en': 'Click to upload',
      'es': 'Haga clic para cargar',
      'fr': 'Cliquez pour télécharger',
    },
    '3jfzozzo': {
      'en': 'Enter a website URL',
      'es': 'Introduzca la URL de un sitio web',
      'fr': 'Entrez l\'URL d\'un site Web',
    },
    'xcmt1jm0': {
      'en': 'Enter an url here...',
      'es': 'Introduzca una URL aquí...',
      'fr': 'Entrez une URL ici...',
    },
    'fz6erg47': {
      'en': 'paste',
      'es': 'pasta',
      'fr': 'coller',
    },
    'rk7887xn': {
      'en': 'Quiz Settings',
      'es': 'Configuración del cuestionario',
      'fr': 'Paramètres du quiz',
    },
    'wki9wvcs': {
      'en': 'Number of Questions',
      'es': 'Número de preguntas',
      'fr': 'Nombre de questions',
    },
    'i8deixx7': {
      'en': 'Generate flashcards ?',
      'es': '¿Generar flashcards?',
      'fr': 'Générer des flashcards ?',
    },
    '1l2sr4pm': {
      'en': 'Generate Quiz',
      'es': 'Generar cuestionario',
      'fr': 'Générer un quiz',
    },
    'cf9352nf': {
      'en': 'New Quiz',
      'es': 'Nuevo cuestionario',
      'fr': 'Nouveau quiz',
    },
  },
  // Profile
  {
    'i9xsjequ': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    'qnvaftvt': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
    'm9qy7hib': {
      'en': 'Light Mode',
      'es': 'Modo claro',
      'fr': 'Mode lumière',
    },
    'o3ysbj2r': {
      'en': 'Dark Mode',
      'es': 'Modo oscuro',
      'fr': 'Mode sombre',
    },
    'gy3dzsfz': {
      'en': 'Edit Profile',
      'es': 'Editar perfil',
      'fr': 'Modifier le profil',
    },
    'n9570amw': {
      'en': 'Payment Options',
      'es': 'Opciones de pago',
      'fr': 'Options de paiement',
    },
    'zqf451b8': {
      'en': 'Notification Settings',
      'es': 'Configuración de notificaciones',
      'fr': 'Paramètres de notification',
    },
    'm5qsh3gn': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'd2lu5q4t': {
      'en': 'Support',
      'es': 'Apoyo',
      'fr': 'Soutien',
    },
    'y2k1ncq8': {
      'en': 'Terms of Service',
      'es': 'Condiciones de servicio',
      'fr': 'Conditions d\'utilisation',
    },
    'open2vlo': {
      'en': 'Invite Friends',
      'es': 'Invitar amigos',
      'fr': 'Inviter des amis',
    },
    'gjy1eew2': {
      'en': 'Test Page',
      'es': 'Página de prueba',
      'fr': 'Page de test',
    },
    'zentdpfj': {
      'en': 'Languages',
      'es': 'Idiomas',
      'fr': 'Langues',
    },
    'a009pzt9': {
      'en': 'Logout',
      'es': 'Cerrar sesión',
      'fr': 'Déconnexion',
    },
    '9ly4ieu3': {
      'en': 'Profile',
      'es': 'Perfil',
      'fr': 'Profil',
    },
  },
  // QuizPage
  {
    '7nh5t6ns': {
      'en': 'Quiz',
      'es': 'Quiz',
      'fr': 'Quiz',
    },
    'jeqxbs2s': {
      'en': 'Quiz',
      'es': 'Prueba',
      'fr': 'Questionnaire',
    },
    'vw0p8xak': {
      'en': 'Information',
      'es': 'Información',
      'fr': 'Information',
    },
    'qpnz791t': {
      'en': 'Name: ',
      'es': 'Nombre:',
      'fr': 'Nom:',
    },
    'mwyduust': {
      'en': 'Folder: ',
      'es': 'Carpeta:',
      'fr': 'Dossier:',
    },
    'v7i066zx': {
      'en': 'Add to a folder',
      'es': 'Agregar a una carpeta',
      'fr': 'Ajouter à un dossier',
    },
    'gdakmdmi': {
      'en': 'Performance Breakdown',
      'es': 'Desglose del rendimiento',
      'fr': 'Répartition des performances',
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
      'es': 'Reiniciar el cuestionario',
      'fr': 'Redémarrer le quiz',
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
      'es': 'Hogar',
      'fr': 'Maison',
    },
  },
  // FlashcardsPage
  {
    '45gycve4': {
      'en': 'Flashcards',
      'es': 'Flashcards',
      'fr': 'Flashcards',
    },
    '0ou5hl44': {
      'en': 'Flashcards',
      'es': 'Flashcards',
      'fr': 'Flashcards',
    },
    '9ejsuro2': {
      'en': '/',
      'es': '/',
      'fr': '/',
    },
    'ddclafab': {
      'en': 'Quiz',
      'es': 'Quiz',
      'fr': 'Quiz',
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
    'sj67w1bt': {
      'en': 'Quiz',
      'es': 'Quiz',
      'fr': 'Quiz',
    },
  },
  // Library
  {
    '2opxeg5r': {
      'en': 'Library',
      'es': 'Biblioteca',
      'fr': 'Bibliothèque',
    },
    'db6agf1s': {
      'en': 'Library',
      'es': 'Biblioteca',
      'fr': 'Bibliothèque',
    },
    'bo87n0ll': {
      'en': 'Search a folder...',
      'es': 'Buscar una carpeta...',
      'fr': 'Rechercher un dossier...',
    },
    'lbiiojbo': {
      'en': 'Create a new folder',
      'es': 'Crear una nueva carpeta',
      'fr': 'Créer un nouveau dossier',
    },
    'b48ajiz0': {
      'en': 'Library',
      'es': 'Biblioteca',
      'fr': 'Bibliothèque',
    },
  },
  // EditUserProfile
  {
    'e5le35vp': {
      'en': 'Edit my information',
      'es': 'Editar mi información',
      'fr': 'Modifier mes informations',
    },
    'f4vj7f92': {
      'en': 'Edit my information',
      'es': 'Editar mi información',
      'fr': 'Modifier mes informations',
    },
    'mkz76a8o': {
      'en': 'User name',
      'es': 'Nombre de usuario',
      'fr': 'Nom d\'utilisateur',
    },
    'zxmi28oh': {
      'en': 'Enter a username',
      'es': 'Introduzca un nombre de usuario',
      'fr': 'Entrez un nom d\'utilisateur',
    },
    '5d3ga1gp': {
      'en': 'Email Address',
      'es': 'Dirección de correo electrónico',
      'fr': 'Adresse email',
    },
    '49j8ipxf': {
      'en': 'TextField',
      'es': 'Campo de texto',
      'fr': 'Champ de texte',
    },
    'wu3ytaso': {
      'en':
          'If changed, a verification link will be sent to your new email address.',
      'es':
          'Si se cambia, se enviará un enlace de verificación a su nueva dirección de correo electrónico.',
      'fr':
          'En cas de modification, un lien de vérification sera envoyé à votre nouvelle adresse e-mail.',
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
    'yms8ffq3': {
      'en': 'Log in to your account',
      'es': 'Inicia sesión en tu cuenta',
      'fr': 'Connectez-vous à votre compte',
    },
    'c02mn4wz': {
      'en': 'Welcome back! Please enter your details.',
      'es': '¡Bienvenido de nuevo! Introduce tus datos.',
      'fr': 'Bienvenue ! Veuillez saisir vos coordonnées.',
    },
    '7ebq4ti3': {
      'en': 'Email',
      'es': 'Correo electrónico',
      'fr': 'E-mail',
    },
    'fn986xbg': {
      'en': 'Password',
      'es': 'Contraseña',
      'fr': 'Mot de passe',
    },
    '0fr060zw': {
      'en': 'Forget password?',
      'es': '¿Olvidaste tu contraseña?',
      'fr': 'Mot de passe oublié?',
    },
    '1qm480oz': {
      'en': 'Email is required.',
      'es': 'Se requiere correo electrónico.',
      'fr': 'L\'e-mail est obligatoire.',
    },
    'z3ehe0az': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    'eth026dm': {
      'en': 'Password is required.',
      'es': 'Se requiere contraseña.',
      'fr': 'Le mot de passe est requis.',
    },
    '9oo0jgbd': {
      'en': 'Please choose an option from the dropdown',
      'es': 'Por favor, elija una opción del menú desplegable.',
      'fr': 'Veuillez choisir une option dans la liste déroulante',
    },
    's1witho8': {
      'en': 'Log in',
      'es': 'Acceso',
      'fr': 'Se connecter',
    },
    'm81k9krp': {
      'en': 'Or continue with ',
      'es': 'O continuar con',
      'fr': 'Ou continuez avec',
    },
    'a7ipk6yz': {
      'en': 'Sign in with Google',
      'es': 'Iniciar sesión con Google',
      'fr': 'Connectez-vous avec Google',
    },
    'f9dyvhpt': {
      'en': 'Sign in with Apple',
      'es': 'Iniciar sesión con Apple',
      'fr': 'Connectez-vous avec Apple',
    },
    'abg4x4qp': {
      'en': 'Don\'t have an account? ',
      'es': '¿No tienes una cuenta?',
      'fr': 'Vous n\'avez pas de compte ?',
    },
    '91zhy50v': {
      'en': 'Sign up',
      'es': 'Inscribirse',
      'fr': 'S\'inscrire',
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
      'es': 'Quiz',
      'fr': 'Quiz',
    },
    'ngvqhgg0': {
      'en': 'Tonic',
      'es': 'Tonic',
      'fr': 'Tonic',
    },
    'jq4ztgm8': {
      'en': 'Create an account',
      'es': 'Crear una cuenta',
      'fr': 'Créer un compte',
    },
    'm1f85p0a': {
      'en': 'Welcome! Please enter your details.',
      'es': '¡Bienvenido! Introduce tus datos.',
      'fr': 'Bienvenue ! Veuillez saisir vos coordonnées.',
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
      'es': 'Confirmar Contraseña',
      'fr': 'Confirmez le mot de passe',
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
      'es': 'Regístrate con Google',
      'fr': 'Inscrivez-vous avec Google',
    },
    'd2qzg44r': {
      'en': 'Sign up with Apple',
      'es': 'Regístrate con Apple',
      'fr': 'Inscrivez-vous avec Apple',
    },
    '4yb4baap': {
      'en': 'You already have an account? ',
      'es': '¿Ya tienes una cuenta?',
      'fr': 'Vous avez déjà un compte ?',
    },
    '0wdggadc': {
      'en': 'Login',
      'es': 'Acceso',
      'fr': 'Se connecter',
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
      'en': 'New API call test',
      'es': 'Nueva prueba de llamada a la API',
      'fr': 'Nouveau test d\'appel d\'API',
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
      'es': 'Mis respuestas',
      'fr': 'Mes réponses',
    },
    '0f68e00i': {
      'en': 'My answers',
      'es': 'Mis respuestas',
      'fr': 'Mes réponses',
    },
    'uxw78qn2': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Accueil',
    },
  },
  // SecurityPage
  {
    '1dl1wywp': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'js5bspv2': {
      'en': 'Security',
      'es': 'Seguridad',
      'fr': 'Sécurité',
    },
    'odr06vdw': {
      'en': 'Change my password',
      'es': 'Cambiar mi contraseña',
      'fr': 'Changer mon mot de passe',
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
      'es':
          'Esta acción es permanente e irreversible.\nTodos tus datos, incluyendo los cuestionarios guardados, las tarjetas, el historial y las carpetas, se eliminarán permanentemente y no se podrán recuperar.',
      'fr':
          'Cette action est définitive et irréversible.\nToutes vos données, y compris les quiz enregistrés, les fiches, l\'historique et les dossiers, seront définitivement supprimées et irrécupérables.',
    },
    '4pn2kva5': {
      'en': 'Home',
      'es': 'Hogar',
      'fr': 'Accueil',
    },
  },
  // LanguageSettings
  {
    'aqwscwxz': {
      'en': 'Choose Language',
      'es': 'Elija el idioma',
      'fr': 'Choisir la langue',
    },
    'rhh89hgz': {
      'en': 'Choose Language',
      'es': 'Elija el idioma',
      'fr': 'Choisir la langue',
    },
    'tslq4lbj': {
      'en': 'Select your preferred language for the app interface',
      'es': 'Seleccione su idioma preferido para la interfaz de la aplicación',
      'fr':
          'Sélectionnez votre langue préférée pour l\'interface de l\'application',
    },
    '3i0m0gwz': {
      'en': '🇺🇸',
      'es': '🇺🇸',
      'fr': '🇺🇸',
    },
    '6oun1k2n': {
      'en': 'English',
      'es': 'Inglés',
      'fr': 'Anglais',
    },
    'r66f5zh5': {
      'en': 'English',
      'es': 'Inglés',
      'fr': 'Anglais',
    },
    '5m38gwt8': {
      'en': '🇪🇸',
      'es': '🇪🇸',
      'fr': '🇪🇸',
    },
    'ygfpclo9': {
      'en': 'Spanish',
      'es': 'Español',
      'fr': 'Espagnol',
    },
    'y82i1f7b': {
      'en': 'Español',
      'es': 'Español',
      'fr': 'Espagnol',
    },
    'usqjwgqn': {
      'en': '🇫🇷',
      'es': '🇫🇷',
      'fr': '🇫🇷',
    },
    'vb6dqgpv': {
      'en': 'French',
      'es': 'Francés',
      'fr': 'Français',
    },
    '5g656st3': {
      'en': 'Français',
      'es': 'Francés',
      'fr': 'Français',
    },
  },
  // QuestionCard
  {
    '4vaa3snx': {
      'en': 'Correct answer',
      'es': 'Respuesta correcta',
      'fr': 'Réponse correcte',
    },
    'zzn46win': {
      'en': 'Wrong answer',
      'es': 'Respuesta incorrecta',
      'fr': 'Mauvaise réponse',
    },
    'poib76jn': {
      'en': 'Explanation:',
      'es': 'Explicación:',
      'fr': 'Explication:',
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
      'es': 'Completado el 15 de junio de 2023',
      'fr': 'Terminé le 15 juin 2023',
    },
    'h7tgj9ha': {
      'en': '/',
      'es': '/',
      'fr': '/',
    },
    '762zwbjf': {
      'en': ' correct',
      'es': 'correcto',
      'fr': 'correct',
    },
    'xl78d0r1': {
      'en': '9/10 correct',
      'es': '9/10 correcto',
      'fr': '9/10 correct',
    },
  },
  // FolderItem
  {
    '3h2fvj5h': {
      'en': 'Number of quiz: ',
      'es': 'Número de cuestionario:',
      'fr': 'Nombre de quiz :',
    },
  },
  // createNewFolder
  {
    '3l6mbaft': {
      'en': 'Create New Folder',
      'es': 'Crear nueva carpeta',
      'fr': 'Créer un nouveau dossier',
    },
    'uyvnilbj': {
      'en': 'Folder Name',
      'es': 'Nombre de la carpeta',
      'fr': 'Nom du dossier',
    },
    '7ojapcmc': {
      'en': 'ex: Geography',
      'es': 'ej: Geografía',
      'fr': 'ex : Géographie',
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
      'es': 'Elija una carpeta',
      'fr': 'Choisissez un dossier',
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
      'es': 'Editar carpeta',
      'fr': 'Modifier le dossier',
    },
    'gkwre7fj': {
      'en': 'Change folder Name',
      'es': 'Cambiar el nombre de la carpeta',
      'fr': 'Changer le nom du dossier',
    },
    'ngwqevte': {
      'en': 'Enter a new folder name...',
      'es': 'Introduzca un nuevo nombre de carpeta...',
      'fr': 'Entrez un nouveau nom de dossier...',
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
      'es': 'Seguridad: esta acción requiere tu contraseña',
      'fr': 'Sécurité : cette action nécessite votre mot de passe',
    },
    'my2eu77e': {
      'en': 'Enter your password',
      'es': 'Ingrese su contraseña',
      'fr': 'Entrez votre mot de passe',
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
      'es': 'Restablecer mi contraseña',
      'fr': 'Réinitialiser mon mot de passe',
    },
    'y6lo1ccl': {
      'en': 'A reset link will be sent to your email address',
      'es':
          'Se enviará un enlace de restablecimiento a su dirección de correo electrónico.',
      'fr': 'Un lien de réinitialisation sera envoyé à votre adresse e-mail',
    },
    'o74227q3': {
      'en': 'Enter your email address',
      'es': 'Introduzca su dirección de correo electrónico',
      'fr': 'Entrez votre adresse email',
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
