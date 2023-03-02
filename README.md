# About

This app is an open-source movie catalog app, specially designed for movie buffs. This means the source code of the application is publicly available and can be customized by developers to suit their needs. The app provides an easy-to-use interface that helps users find and stay informed about the latest and most popular movies. With a user-friendly interface and simple features, users can easily search and compare various movies according to their preferences. The available film catalog content includes movie synopsis, trailers, reviews and ratings from other users, helping users make the right decision about which film to watch. This app aims to be an accessible source of quality information for anyone interested in learning more about the latest and most popular films.

## Techsteck
- [Flutter](https://flutter.dev/)
- [Bloc](https://pub.dev/packages/flutter_bloc)
- [Go router](https://pub.dev/packages/go_router)
- [Http](https://pub.dev/packages/http)


## Desain
This application design uses Figma <br>
https://www.figma.com/file/BEkrHK6nFChu4S8BnBfrmk/FLM?node-id=0%3A1&t=1pmIEIopHxbq601O-1

## Data
API data used from [Themoviedb](themoviedb.org)

## Guideline
Before running this application you must first create an account on themoviedb,and input the obtained API key to the MainService APIKey, who are in flutter_bloc_flm\lib\data\services\main_service.dart

## Project Structure
| - cubit <br>
| - data <br>
| -- | --  core <br>
| -- | --  models <br>
| -- | --  services <br>
| -- infrastructure <br>
| -- | -- extensions <br>
| -- | -- routes <br>
| -- | -- theme <br>
| -- presentation <br>
| -- | -- pages <br>
| -- | -- utils <br>


##Results
- Android https://play.google.com/store/apps/details?id=com.nvinix.flm
- Web https://marioapasama.github.io/flutter_bloc_flm/
