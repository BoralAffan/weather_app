Clone the Repository:

git clone https://github.com/BoralAffan/weather_app
cd flutter_app

Install Dependencies By Running:

flutter pub get

Set Up API Key:

Obtain an API key from WeatherAPI Or you can use my api key which i have kept in app constants.dart file for smooth process.

Add the API key in the lib/src/utils/constans.dart file as:

const String apiKey = "YOUR_API_KEY";

Run the Application:

flutter run

Test on Emulator or Physical Device
For Emulator:
Set the emulator's location manually:

Click on the three dots menu in the emulator toolbar.
Select the Location tab.
Add the desired location, which will be used as the device's current location while running the app.
Important: If the emulator location is not set, the app may retrieve an incorrect device location.

For Physical Device:
Ensure location services are enabled and permissions are granted for accurate functionality.

Additional Feature: Location Fallback
If the user denies location permission, the app will fetch the device's location based on its IP address as a fallback mechanism.
This ensures the app remains functional and retrieves weather data for the IP-based location.


On Home Screen:- weather data will be shown of live location of the user and the user can search for cities by tapping on "Browse weather by city " underline text . User can tap on it and can see weather details of any country. 
