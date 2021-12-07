import 'dart:io' show Platform;

//TODO - NEED TO SET UP CASES FOR DEV/PRODUCTION
class DBconfig {
  //check if LOCAL_NODE_API is set to true
  static bool isLocalNodeApi =
      Platform.environment['LOCAL_NODE_API'] == 'true' ? true : false;

  static String get_API_IP() {
    Map<String, String> envVars = Platform.environment;
    if (isLocalNodeApi) {
      if (envVars['NODE_API_IP'] != null) {
        return envVars['NODE_API_IP']!;
      } else {
        return "10.0.2.2";
      }
    } else {
      return '45.77.86.135'; //ADDRESS TO VULTR SERVER
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
