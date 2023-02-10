# About

The application currently being used is an open-source movie catalog application, specifically designed for film enthusiasts. This means that the application's source code is publicly available and can be customized by developers to fit their needs. This application provides an easy-to-use interface that helps users discover and stay informed about the latest and most popular films. With its user-friendly interface and simple features, users can easily search and compare different films according to their preferences. The movie catalog content available includes movie synopsis, trailers, reviews, and ratings from other users, helping users make informed decisions on which films to watch. This application aims to be a quality source of information accessible to anyone interested in learning more about the latest and most popular films.

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

