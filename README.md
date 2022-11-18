Настройка темы:
https://rydmike.com/flexcolorscheme/themesplayground-v6/#/

Комманда генерации splash screen:
splash screen сгенерировать из flutter_native_splash.yaml файла;
flutter pub run flutter_native_splash:create
 
Для любого другого генератора список этих параметров можно узнать, выполнив следующую консольную команду:
openapi-generator config-help -g dart-dio

Пример генерации из официальной докуменетации:
openapi-generator generate -i https://petstore.swagger.io/v2/swagger.yaml -g dart-dio -o .pet_api --additional-properties pubName=pet_api

Генерируем наш API авторизации:
openapi-generator generate -i app-auth-api-swagger.yaml -g dart-dio -o .app_auth_api --additional-properties pubName=app_auth_api

Пешем в pubspec.yaml
dependencies:
    app_auth_api:
        path: .app_auth_api

Идем в папку с нашим API
cd .app_auth_api
flutter pub get  
flutter pub run build_runner build --delete-conflicting-outputs
