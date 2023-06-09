// ignore_for_file: dead_code

class WeatherStatusConfig{
  static String getCurrentWeatherStatus(int weatherCode){
 switch (weatherCode) {
   case 0:
   return "Clear Sky";
   break;
   case 1:
   return "Mainly clear";
   break;
   case 2:
   return "Partly Cloudy";
   break;
   case 3:
   return "Overcast";
   break;
   case 45:
   return "Fog";
   break;
   case 48:
   return "Depositing rime frog";
   break;
   case 51:
   return "Light Drizzle";
   break;
   case 53:
   return "Moderate Drizzle";
   break;
   case 55:
   return "Dense drizzle";
   break;
   case 56:
   return "Light Freezing Drizzle";
   break;
   case 57:
   return "Dense Freezing Drizzle";
   break;
   case 61:
   return "Slight rain";
   break;
   case 63:
   return "Moderate rain";
   break;
   case 65:
   return "Heavy rain";
   break;
   case 66:
   return "Light Freezing Rain";
   break;
   case 67:
   return "Heavy Freezing Rain";
   break;
   case 71:
   return "Slight snow fall";
   break;
   case 73:
   return "Moderate snow fall";
   break;
   case 75:
   return "Heavy snow fall";
   break;
   case 77:
   return "Snow Grains";
   break;
   case 80:
   return "Slight rain showers";
   break;
   case 81:
   return "Moderate rain showers";
   break;
   case 82:
   return "Violent rain showers";
   break;
   case 85:
   return "Slight snow showers";
   break;
   case 86:
   return "Heavy Snow Showers";
   break;

   default:
 return 'Thunderstorm';
 }

  }
}