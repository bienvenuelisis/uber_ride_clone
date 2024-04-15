import 'package:permission_handler/permission_handler.dart';

///Configuration of permissions configuration.
class PermissionsConfig {
  ///Factory Constructor
  factory PermissionsConfig() {
    return _instance;
  }

  PermissionsConfig._internal();

  ///List of all app permissions
  static const List<AppPermission> all = [
    ...location,
  ];

  ///List of location permissions
  static const List<AppPermission> location = [
    AppPermission(
      group: 'Location',
      permission: Permission.locationWhenInUse,
      title: '''Foreground location''',
      description:
          '''Allows us to automatically retrieve your current location when you use the app.''',
      androidOnly: true,
    ),
    AppPermission(
      group: 'Location',
      permission: Permission.locationAlways,
      title: '''Background location.''',
      description: '''
Allows us to automatically update your current location, even if your screen is off or when you're using another app during a ride.
''',
      androidOnly: true,
      requirements: [Permission.locationWhenInUse],
    ),
    AppPermission(
      group: 'Location',
      permission: Permission.location,
      title: 'Device location',
      description: '''
Allows us to automatically retrieve your current location, when you use the app, or when you use another app during a ride.''',
      iOsOnly: true,
    ),
  ];

  static final PermissionsConfig _instance = PermissionsConfig._internal();
}

///App Permission Model
class AppPermission {
  ///Default Constructor
  const AppPermission({
    required this.title,
    required this.description,
    required this.permission,
    this.iOsOnly = false,
    this.androidOnly = false,
    this.group,
    this.requirements = const [],
  });

  ///Android Only permission
  final bool androidOnly;

  ///Description
  final String description;

  ///Group of permissions (ex: location)
  final String? group;

  ///IOS Only permission
  final bool iOsOnly;

  ///Permission
  final Permission permission;

  ///Require those permissions
  final List<Permission> requirements;

  ///Title
  final String title;
}

/// Actions that can be taken on a [List] of [AppPermission]s.
extension AppPermissionListActions on List<AppPermission> {
  /// Test if all permissions are granted.
  ///
  /// Returns a [bool] indicating if all permissions are granted.
  Future<bool> granted() async {
    for (final appP in this) {
      if (!await appP.permission.isGranted) {
        return Future.value(false);
      }
    }

    return Future.value(true);
  }
}

/// Actions that can be taken on a [List] of [Permission]s.
extension PermissionListEnhanced on List<Permission> {
  /// Test if all permissions are granted.
  ///
  /// Returns a [bool] indicating if all permissions are granted.
  Future<bool> granted() async {
    return request().then(
      (statuses) => statuses.values.every((status) => status.isGranted),
    );
  }
}
