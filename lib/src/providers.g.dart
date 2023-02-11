// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$taskDatabaseHash() => r'805b37f99215c8938852452668208e3ee1921592';

/// See also [taskDatabase].
final taskDatabaseProvider = Provider<TaskDatabase>(
  taskDatabase,
  name: r'taskDatabaseProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskDatabaseHash,
);
typedef TaskDatabaseRef = ProviderRef<TaskDatabase>;
String _$taskRepositoryHash() => r'343ce8fdb66e87b7a967c0b99a04448f5178ac42';

/// See also [taskRepository].
final taskRepositoryProvider = AutoDisposeProvider<TaskRepository>(
  taskRepository,
  name: r'taskRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$taskRepositoryHash,
);
typedef TaskRepositoryRef = AutoDisposeProviderRef<TaskRepository>;
String _$taskListHash() => r'd3fbc81fe29dd6e241bbac17d574276292d1d31a';

/// See also [taskList].
final taskListProvider = AutoDisposeFutureProvider<List<TaskDto>>(
  taskList,
  name: r'taskListProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$taskListHash,
);
typedef TaskListRef = AutoDisposeFutureProviderRef<List<TaskDto>>;
