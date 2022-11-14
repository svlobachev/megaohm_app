import 'package:get/get.dart';

class Localization extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'language': 'English',
          'noInternet': 'Turn on the Internet please!',
          'searchCountry': 'Search country',
          'invalidMobileNumber': 'Invalid Mobile Number',
          'didNotReceiveCode': 'Didn’t receive code?',
          'get': 'To get the code',
          'PhoneNumber': 'Your phone Number',
          'enterСodeText':
              'Enter the last 4 digits of the number from which we will call you. For example:\n +1_123_456_XXXX ⬅',
          "pinIsIncorrect": "Incorrect code, please try again",
          'welcome': 'Welcome',
          'EmailOrPhoneNumber': 'Your email or phone number',
          'password': 'Your password',
          'enter': 'Enter',
          'registration': 'Registration',
          'toComeIn': 'To come in',
          'profile': 'profile',
          'lightDarkModes': 'Light/Dark modes',
          'languages': 'Languages',
          'instruction': 'Instruction',
          'contactWithDevelopers': 'Contact with developers',
          'settings': 'Settings',
          'labelUndoText': 'Undo',
          'AppBarTitle': 'Megaohm',
          'yourMessage': 'Your message',
        },
        'ru_RU': {
          'language': 'Русский',
          'noInternet': 'Включите пожалуйста интернет!',
          'searchCountry': 'Поиск страны:',
          'invalidMobileNumber': 'Некорректный номер телефона',
          'didNotReceiveCode': 'Не получили код?',
          'get': 'Получить код',
          'welcome': 'Добро пожаловать!',
          'PhoneNumber': 'Ваш номер телефона',
          'enterСodeText':
              'Введите последние 4 цифры номера с которого мы вам позвоним. Например:\n +7_123_456_XXXX ⬅',
          "pinIsIncorrect": "Некорректный код, попробуйте ещё раз.",
          'EmailOrPhoneNumber': 'Bаш е-маил или номер телефона',
          'password': 'Ваш пароль',
          'enter': 'Вход',
          'registration': 'Зарегистрироваться',
          'toComeIn': 'Войти',
          'profile': 'Профиль',
          'lightDarkModes': 'Ночной/Дневной режимы',
          'languages': 'Языки',
          'instruction': 'Инструкция',
          'contactWithDevelopers': 'Связь с разработчиками',
          'settings': 'Настройки',
          'labelUndoText': 'Закрыть',
          'AppBarTitle': 'Мегаом',
          'yourMessage': 'Ваше сообщение',
        }
      };
}
