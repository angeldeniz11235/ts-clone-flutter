import 'dart:io' show Platform;

//TODO - NEED TO SET UP CASES FOR DEV/PRODUCTION
class DBconfig {
  static String get_API_IP() {
    Map<String, String> envVars = Platform.environment;
    if (envVars['NODE_API_IP'] != null) {
      return envVars['NODE_API_API']!;
    } else {
      return "10.0.2.2";
    }
  }

  static String get_API_PORT() {
    Map<String, String> envVars = Platform.environment;
    if (envVars['NODE_API_PORT'] != null) {
      return envVars['NODE_API_PORT']!;
    } else {
      return "3000";
    }
  }
}
