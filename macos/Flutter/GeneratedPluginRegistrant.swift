//
//  Generated file. Do not edit.
//

import FlutterMacOS
import Foundation

import geolocator_apple
import location
<<<<<<< HEAD
import path_provider_foundation
import sqflite_darwin
=======
import shared_preferences_foundation
>>>>>>> 240b9c6c7b8b5cff9afb60dc9bae9e28ddfa2002

func RegisterGeneratedPlugins(registry: FlutterPluginRegistry) {
  GeolocatorPlugin.register(with: registry.registrar(forPlugin: "GeolocatorPlugin"))
  LocationPlugin.register(with: registry.registrar(forPlugin: "LocationPlugin"))
<<<<<<< HEAD
  PathProviderPlugin.register(with: registry.registrar(forPlugin: "PathProviderPlugin"))
  SqflitePlugin.register(with: registry.registrar(forPlugin: "SqflitePlugin"))
=======
  SharedPreferencesPlugin.register(with: registry.registrar(forPlugin: "SharedPreferencesPlugin"))
>>>>>>> 240b9c6c7b8b5cff9afb60dc9bae9e28ddfa2002
}
