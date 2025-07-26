# Pattern S - Simple Flutter Architecture

A streamlined Flutter application template designed for rapid development with minimal boilerplate while maintaining professional code quality and scalability potential.

## 🎯 Architecture Overview

Pattern S embraces simplicity without sacrificing quality. It's designed for developers who want to build Flutter apps quickly while following best practices, making it perfect for MVPs, prototypes, and small to medium-sized production applications.

## ✨ Key Features

- **Flat Architecture**: Direct, intuitive file organization without deep nesting
- **Modern State Management**: Riverpod with code generation for type safety
- **Smart File Naming**: Clear conventions (.v.dart, .p.dart, .s.dart)
- **Essential Services**: Pre-configured storage and common services
- **Zero Configuration**: Works out of the box with sensible defaults
- **Developer Friendly**: Hot reload works seamlessly with generated code
- **Production Ready**: Includes routing, theming, and localization
- **Easy Testing**: Simple structure makes testing straightforward
- **Minimal Dependencies**: Only essential packages included
- **Growth Ready**: Can evolve into Pattern M as needed

## 📁 Project Structure

```
lib/
├── main.dart                    # App entry point with minimal setup
├── models/                      # Data models (PODOs, Freezed models)
│   └── user.dart               # Example: Simple user model
├── providers/                   # Global state management
│   ├── app.p.dart              # App-wide providers (router, theme)
│   └── app.p.g.dart            # Generated code
├── screens/                     # Feature screens
│   ├── home/                   # Home feature
│   │   ├── home.v.dart         # Home screen view
│   │   ├── home.p.dart         # Home screen state
│   │   └── home.p.g.dart       # Generated provider
│   └── settings/               # Settings feature
│       └── settings.v.dart     # Settings screen (stateless example)
├── services/                    # Business logic services
│   ├── storage.s.dart          # Local storage service
│   └── storage.s.g.dart        # Generated provider
├── utils/                       # Utility functions
│   ├── extensions.dart         # Helpful Dart/Flutter extensions
│   └── validators.dart         # Form validation logic
├── widgets/                     # Reusable UI components
│   └── common_button.dart      # Example: Shared button widget
└── l10n/                       # Internationalization
    ├── app_en.arb              # English translations
    └── app_localizations.dart  # Generated translations
```

## 🎯 File Naming Conventions

Pattern S uses intuitive file suffixes:

- `.v.dart` - **Views**: Screen widgets (pages)
- `.p.dart` - **Providers**: State management logic
- `.s.dart` - **Services**: Business logic and external integrations
- `.g.dart` - **Generated**: Auto-generated files (don't edit)

## 🚀 Getting Started

### Prerequisites

- Flutter SDK ^3.8.1
- Your favorite IDE (VS Code or Android Studio)

### Quick Start

1. **Clone and enter the project**
   ```bash
   git clone <repository-url>
   cd pattern_s
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Generate code**
   ```bash
   dart run build_runner build --delete-conflicting-outputs
   ```

4. **Run the app**
   ```bash
   flutter run
   ```

That's it! You're ready to start building.

## 💻 Development

### Code Generation

Pattern S uses minimal code generation for maximum benefit:

```bash
# One-time generation
dart run build_runner build --delete-conflicting-outputs

# Watch mode (recommended during development)
dart run build_runner watch --delete-conflicting-outputs
```

### Creating a New Feature

Let's add a "Profile" feature as an example:

1. **Create the screen** (`lib/screens/profile/profile.v.dart`):
   ```dart
   import 'package:flutter/material.dart';
   import 'package:flutter_riverpod/flutter_riverpod.dart';
   import 'profile.p.dart';
   
   class ProfileScreen extends ConsumerWidget {
     const ProfileScreen({super.key});
     
     @override
     Widget build(BuildContext context, WidgetRef ref) {
       final profile = ref.watch(profileProvider);
       
       return Scaffold(
         appBar: AppBar(title: const Text('Profile')),
         body: Center(
           child: Text('Hello, ${profile.name}!'),
         ),
       );
     }
   }
   ```

2. **Add state management** (`lib/screens/profile/profile.p.dart`):
   ```dart
   import 'package:riverpod_annotation/riverpod_annotation.dart';
   
   part 'profile.p.g.dart';
   
   @riverpod
   class Profile extends _$Profile {
     @override
     ProfileState build() => ProfileState(name: 'User');
     
     void updateName(String name) {
       state = state.copyWith(name: name);
     }
   }
   
   class ProfileState {
     final String name;
     ProfileState({required this.name});
     
     ProfileState copyWith({String? name}) {
       return ProfileState(name: name ?? this.name);
     }
   }
   ```

3. **Add route** (in `lib/providers/app.p.dart`):
   ```dart
   GoRoute(
     path: '/profile',
     builder: (context, state) => const ProfileScreen(),
   ),
   ```

4. **Run code generation**:
   ```bash
   dart run build_runner build
   ```

### State Management Examples

**Simple State**
```dart
@riverpod
class Counter extends _$Counter {
  @override
  int build() => 0;
  
  void increment() => state++;
  void decrement() => state--;
  void reset() => state = 0;
}
```

**Async State**
```dart
@riverpod
Future<List<Todo>> todoList(Ref ref) async {
  final storage = ref.watch(storageServiceProvider);
  return storage.getTodos();
}
```

**Family Provider**
```dart
@riverpod
Future<User> userById(Ref ref, String id) async {
  final response = await http.get('/users/$id');
  return User.fromJson(response.body);
}
```

### Service Layer

Services handle external integrations and business logic:

```dart
// lib/services/api.s.dart
@riverpod
ApiService apiService(Ref ref) => ApiService();

class ApiService {
  Future<List<Product>> getProducts() async {
    // API logic here
  }
}

// Usage in provider
@riverpod
Future<List<Product>> products(Ref ref) async {
  final api = ref.watch(apiServiceProvider);
  return api.getProducts();
}
```

### Utilities and Extensions

Pattern S includes helpful extensions:

```dart
// Context extensions
context.showSnackBar('Hello!');
context.theme.primaryColor;
context.screenWidth;

// String extensions
'hello'.capitalize(); // 'Hello'
'test@email.com'.isValidEmail; // true

// Widget extensions
MyWidget().padding(16).center();
```

## 🧪 Testing

### Unit Tests

```dart
// test/providers/counter_test.dart
void main() {
  test('Counter increments', () {
    final container = ProviderContainer();
    final counter = container.read(counterProvider.notifier);
    
    expect(container.read(counterProvider), 0);
    counter.increment();
    expect(container.read(counterProvider), 1);
  });
}
```

### Widget Tests

```dart
// test/screens/home_test.dart
void main() {
  testWidgets('Home screen shows counter', (tester) async {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(home: HomeScreen()),
      ),
    );
    
    expect(find.text('0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('1'), findsOneWidget);
  });
}
```

## 🎨 Customization

### Theming

Customize your app's look in `main.dart`:

```dart
MaterialApp.router(
  theme: ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: Colors.deepPurple, // Your brand color
    ),
    useMaterial3: true,
  ),
  // ...
)
```

### Adding Packages

Pattern S is minimal by design. Add only what you need:

```yaml
dependencies:
  # API calls
  dio: ^5.0.0
  
  # Local database
  hive: ^2.0.0
  
  # Images
  cached_network_image: ^3.0.0
```

## 📱 Platform Configuration

### Android
- Update `android/app/build.gradle` for:
  - applicationId
  - minSdkVersion (21 recommended)
  - targetSdkVersion

### iOS
- Update `ios/Runner/Info.plist` for:
  - CFBundleDisplayName
  - CFBundleIdentifier
  - Permissions (camera, location, etc.)

### Web
- Update `web/index.html` for:
  - Title and description
  - PWA configuration
  - Meta tags

## 🚀 Building for Production

### Android
```bash
flutter build apk --release
# or for app bundle (recommended)
flutter build appbundle --release
```

### iOS
```bash
flutter build ios --release
# Then archive in Xcode
```

### Web
```bash
flutter build web --release
# Deploy the build/web folder
```

## 🔄 Migration Guide

### Growing to Pattern M

When your app needs more structure:

1. **Add layers gradually**
   ```
   screens/feature/ → features/feature/presentation/
   models/ → features/feature/domain/
   services/ → features/feature/data/
   ```

2. **Introduce repositories**
   - Add repository interfaces in domain
   - Implement in data layer

3. **Add use cases**
   - Extract business logic from providers
   - Create focused use case classes

4. **Enhance error handling**
   - Add Freezed failure types
   - Implement Result pattern

The beauty of Pattern S is that it's a subset of Pattern M, making migration smooth.

## 💡 Best Practices

1. **Keep It Simple**
   - Don't add layers until you need them
   - Prefer composition over inheritance
   - Write readable code over clever code

2. **State Management**
   - One provider per feature/screen
   - Use `ref.invalidate()` for refresh
   - Dispose resources in `ref.onDispose()`

3. **Performance**
   - Use `const` constructors everywhere
   - Implement `select` for granular updates
   - Profile before optimizing

4. **Code Quality**
   - Run `flutter analyze` before commits
   - Format with `dart format .`
   - Write tests for critical paths

## 🤔 When to Use Pattern S

✅ **Perfect for:**
- MVPs and prototypes
- Small to medium apps
- Solo developers or small teams
- Learning Flutter
- Quick client projects

❌ **Consider Pattern M for:**
- Large enterprise apps
- Multiple team collaboration
- Complex business logic
- Strict compliance requirements
- Apps with 50+ screens

## 🐛 Troubleshooting

### Build runner issues
```bash
dart run build_runner clean
dart run build_runner build --delete-conflicting-outputs
```

### State not updating
- Check if you're using `ref.watch` (not `ref.read`)
- Ensure providers are properly generated
- Verify `ProviderScope` is at the root

### Performance issues
- Remove unnecessary rebuilds with `select`
- Use `const` widgets
- Implement `ListView.builder` for long lists

## 🤝 Contributing

We love simplicity! When contributing:

1. **Ask**: "Does this make things simpler?"
2. Test your changes
3. Update documentation
4. Format your code
5. Submit a focused PR

## 📄 License

This project is a template and can be used freely for any purpose.

---

**Remember**: The best code is not the most clever, but the most clear. Happy coding! 🚀