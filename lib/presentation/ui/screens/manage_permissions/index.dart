import 'dart:io';

import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:uber_ride_clone/core/config/permissions.dart';
import 'package:uber_ride_clone/core/extensions/build_context.dart';
import 'package:uber_ride_clone/core/extensions/navigator.dart';
import 'package:uber_ride_clone/core/mixins/props.dart';
import 'package:uber_ride_clone/presentation/config/sizes.dart';
import 'package:uber_ride_clone/presentation/ui/commons/components/linear_divider.dart';
import 'package:uber_ride_clone/presentation/ui/commons/components/rounded_elevated_button.dart';
import 'package:uber_ride_clone/presentation/ui/commons/layouts/safe_area_with_top_background.dart';
import 'package:uber_ride_clone/presentation/ui/screens/manage_permissions/components/timer_widget.dart';

///Screen that helps centralize permissions management.
class ManagePermissionScreen extends StatefulWidget {
  // ignore: lines_longer_than_80_chars
  ///Default Constructor
  const ManagePermissionScreen({
    this.permissions = PermissionsConfig.all,
    super.key,
  });

  ///Permissions that will be managed
  final List<AppPermission> permissions;

  @override
  State<ManagePermissionScreen> createState() => _ManagePermissionScreenState();
}

class _ManagePermissionScreenState extends State<ManagePermissionScreen>
    with PropsMixin {
  late bool _allPermissionAccepted;

  @override
  void initState() {
    _allPermissionAccepted = false;
    super.initState();
  }

  bool get allPermissionAccepted => _allPermissionAccepted;

  ///Permissions for this device specifically
  List<AppPermission> get devicePermissions => Platform.isAndroid
      ? widget.permissions.where((p) => !p.iOsOnly).toList()
      : Platform.isIOS
          ? widget.permissions.where((p) => !p.androidOnly).toList()
          : [];

  Future<void> _acceptAll() async {
    loading = true;
    await devicePermissions
        .map((appP) => appP.permission)
        .toList()
        .request()
        .then((statuses) {
      loading = false;
      if (statuses.values.every((status) => status.isGranted)) {
        _allPermissionAccepted = true;
      }
    });
  }

  Future<void> _onPermissionChanged() async {
    if (await devicePermissions.granted()) {
      setState(() {
        _allPermissionAccepted = true;
      });
    }
  }

  void _return() {
    Future.delayed(const Duration(seconds: 1), () {
      context.pop(true);
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeAreaWithTopBackground(
      child: Material(
        child: SizedBox(
          height: context.height - 25,
          width: context.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: AppSizes.h_12,
              vertical: AppSizes.h_12,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Flexible(
                  flex: 2,
                  child: SizedBox(
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: AppSizes.h_12,
                        vertical: AppSizes.h_4,
                      ).copyWith(
                        bottom: AppSizes.h_16,
                      ),
                      child: const Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: AppSizes.h_12,
                            ),
                            child: Center(
                              child: Text(
                                'Application permissions',
                                style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 21,
                                ),
                              ),
                            ),
                          ),
                          Text(
                            '''The application requires certain permissions to function correctly.''',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black87,
                            ),
                          ),
                          SizedBox(
                            height: AppSizes.h_4,
                          ),
                          LinearHorizontalDivider(),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 8,
                  child: SizedBox(
                    height: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: devicePermissions
                            .map(
                              (appP) => Padding(
                                padding: const EdgeInsets.only(
                                  bottom: AppSizes.h_12,
                                ),
                                child: _PermissionTile(
                                  permission: appP.permission,
                                  requirements: appP.requirements,
                                  title: appP.title,
                                  description: appP.description,
                                  onChanged: _onPermissionChanged,
                                ),
                              ),
                            )
                            .toList(),
                      ),
                    ),
                  ),
                ),
                Flexible(
                  child: allPermissionAccepted
                      ? TimerWidget(
                          builder: (context, timeOutInSeconds) {
                            return RoundedElevatedButton(
                              height: AppSizes.h_52,
                              text: 'Back ($timeOutInSeconds seconds)',
                              onPressed: _return,
                              color: Colors.black,
                              radius: 27,
                            );
                          },
                          timeOutInSeconds: 10,
                          timeOutAction: _return,
                        )
                      : RoundedElevatedButton(
                          height: AppSizes.h_52,
                          loading: loading,
                          text: 'Accept all permissions',
                          onPressed: _acceptAll,
                          color: Colors.green[900],
                          radius: 27,
                          textColor: Colors.white,
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _PermissionTile extends StatefulWidget {
  const _PermissionTile({
    required this.permission,
    required this.title,
    required this.description,
    required this.onChanged,
    required this.requirements,
  });

  final String description;
  final VoidCallback onChanged;
  final Permission permission;
  final String title;

  ///Require those permissions
  final List<Permission> requirements;

  @override
  State<_PermissionTile> createState() => __PermissionTileState();
}

class __PermissionTileState extends State<_PermissionTile> {
  bool _granted = false;

  @override
  void initState() {
    // ignore: discarded_futures
    _loadStatus();
    super.initState();
  }

  bool get granted => _granted;

  set granted(bool value) {
    setState(() {
      _granted = value;
    });
  }

  Future<void> request() async {
    if (!await widget.requirements.granted()) {
      await widget.requirements.request();
    }

    await widget.permission.request().isGranted.then((granted) {
      this.granted = granted;
      if (granted) {
        widget.onChanged();
      }
    });
  }

  Future<void> _loadStatus() async {
    await widget.permission.isGranted.then((granted) {
      this.granted = granted;
    });
  }

  Future<void> _onChanged(bool value) async {
    if (value) {
      await request();
    } else {
      granted = false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSizes.h_16),
      child: SwitchListTile(
        contentPadding: EdgeInsets.zero,
        dense: false,
        title: Text(
          widget.title,
          style: const TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
            color: Colors.black54,
          ).copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
        subtitle: Text(
          widget.description,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
          ),
          textAlign: TextAlign.start,
        ),
        onChanged: _onChanged,
        value: granted,
      ),
    );
  }
}
