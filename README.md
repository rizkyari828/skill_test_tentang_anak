<br />

<a href="url"><img src="https://user-images.githubusercontent.com/47266365/158044334-4a5fd576-2fee-4ade-b1fa-6a7b9e321ca6.jpeg" height="300" width="150" ></a>
<a href="url"><img src="https://user-images.githubusercontent.com/47266365/158044337-9904bb83-3b00-4c6a-a004-7fc41fbc59f9.jpeg" height="300" width="150" ></a>
<a href="url"><img src="https://user-images.githubusercontent.com/47266365/158044234-583c21bd-49b0-4e89-8d70-925950786db5.png" height="300" width="150" ></a>
<a href="url"><img src="https://user-images.githubusercontent.com/47266365/158043627-f4d0f3f8-e224-4800-904a-e35901bf74d3.png" height="300" width="150" ></a>
<a href="url"><img src="https://user-images.githubusercontent.com/47266365/158043630-f15b99d8-7695-4a8e-acd1-95d116ae6160.png" height="300" width="150" ></a>
<a href="url"><img src="https://user-images.githubusercontent.com/47266365/158043632-a17aaedf-132c-4e7b-9b40-30d9903707f3.png" height="300" width="150" ></a>
<a href="url"><img src="https://user-images.githubusercontent.com/47266365/158044598-a98faf80-40a7-4357-84f2-a9fd0e228c20.jpeg" height="300" width="150" ></a>
<br />
## Folder structure

This application uses <a href="https://pub.dev/packages/get">getX </a>for state management and of course with clean architecture with all requirement for the test,
before getX I already use some state management like provider, BLoC, flutter_clean_arcitecture and I think the best way is using getX.<br />

The following is the project folder structure (only the folders under lib are introduced)

```
lib/
|- api - Global Restful api requests, including interceptors, etc.
   |- interceptors - Interceptors, including auth, request, and response interceptors.
   |- api.dart - Restful api export file.
|- lang - Internationalization, including translation files, translation service files, etc.
   |- lang.dart - Language export file.
|- models - Various structured entity classes, divided into request and response entities.
   |- models.dart - Entity class export file.
|- modules - Business module folder.
   |- module - Folder that contain .
   |- modules.dart - Module export file.
|- routes - Routing module.
   |- app_pages.dart - Routing page configuration.
   |- app_routes.dart - Route names.
   |- routes.dart - Route export file.
|- Shared - Global shared folders, including static variables, global services, utils, global Widgets, etc.
   |- shared.dart - Global shared export file.
|- theme - Theme folder.
|- app_bindings.dart - Services started before the app runs, such as Restful api.
|- di.dart - Global dependency injection objects, such as SharedPreferences, etc.
|- main.dart - Main entry.
```
