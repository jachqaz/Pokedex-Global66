# 🎮 Pokedex

Una aplicación Flutter moderna y elegante para explorar el mundo Pokémon. Desarrollada con arquitectura limpia y mejores
prácticas de Flutter.

## 🚀 Instrucciones para Ejecutar el Proyecto

### Prerrequisitos

- Flutter SDK 3.29.3
- Dart SDK 3.7.2 o superior
- FVM (Flutter Version Management)
- Android Studio / VS Code

### Pasos de Instalación y Ejecución

1. **Clona el repositorio**
   ```bash
   git clone <repository-url>
   cd pokedex
   ```

2. **Instala las dependencias**
   ```bash
   flutter pub get
   ```

3. **IMPORTANTE: Compila y genera archivos necesarios**
   ```bash
   fvm flutter gen-l10n
   fvm flutter pub run build_runner build --delete-conflicting-outputs
   ```

4. **Ejecuta la aplicación**
   ```bash
   flutter run
   ```

## 🏗️ Arquitectura Utilizada

La aplicación implementa **Clean Architecture** con separación clara de responsabilidades:

```
lib/
├── config/           # Configuración global
│   ├── constants/    # Constantes y assets
│   ├── router/       # Configuración de navegación (GoRouter)
│   ├── theme/        # Temas y estilos Material Design
│   └── utils/        # Utilidades globales
├── domain/           # Lógica de negocio (Entities, Use Cases)
│   ├── entities/     # Modelos de dominio puros
│   ├── repositories/ # Contratos de repositorios
│   └── datasources/  # Contratos de fuentes de datos
├── infrastructure/   # Capa de datos
│   ├── datasources/  # Implementación APIs (Dio + PokeAPI)
│   ├── models/       # Modelos de datos con serialización
│   ├── mappers/      # Convertidores Entity ↔ Model
│   └── repositories/ # Implementación de repositorios
└── presentation/     # Interfaz de usuario
    ├── screens/      # Pantallas de la aplicación
    ├── widgets/      # Componentes reutilizables
    └── providers/    # Gestión de estado con Riverpod
```

### Principios Arquitectónicos

- **Inversión de Dependencias**: Las capas superiores no dependen de las inferiores
- **Separación de Responsabilidades**: Cada capa tiene una función específica
- **Testabilidad**: Arquitectura que facilita testing unitario
- **Escalabilidad**: Estructura preparada para crecimiento del proyecto

## 🤖 Uso de Inteligencia Artificial

### Herramientas de IA Utilizadas

- **Amazon Q Developer**: Asistente principal para desarrollo

### Reglas y Metodología de IA

1. **Código Mínimo**: Solo generar el código estrictamente necesario
2. **Arquitectura Consistente**: Mantener patrones establecidos
3. **Mejores Prácticas**: Seguir convenciones de Flutter/Dart
4. **Revisión Humana**: Validar toda sugerencia de IA
5. **Documentación**: IA ayuda en comentarios y README

### Aplicación de IA en el Proyecto

- **Generación de Boilerplate**: Reducción de código repetitivo
- **Optimización de Consultas**: Mejora en llamadas a API
- **Refactoring Inteligente**: Sugerencias de mejora de código
- **Debugging Asistido**: Identificación rápida de errores
- **Documentación Automática**: Generación de comentarios descriptivos

## 🔒 Capas de Seguridad Implementadas

### 1. Seguridad de Red

- **HTTPS Only**: Todas las comunicaciones encriptadas
- **Certificate Pinning**: Validación de certificados SSL
- **Timeout Configurado**: Prevención de ataques de denegación
- **Retry Logic**: Manejo seguro de reintentos

### 2. Validación de Datos

- **Input Sanitization**: Limpieza de entradas de usuario
- **Type Safety**: Validación estricta de tipos Dart
- **Null Safety**: Prevención de errores null pointer
- **Schema Validation**: Validación de respuestas API

### 3. Almacenamiento Seguro

- **SharedPreferences**: Datos no sensibles únicamente
- **No Credentials Storage**: Sin almacenamiento de credenciales
- **Data Encryption**: Encriptación de datos sensibles (si aplica)

### 4. Seguridad de Aplicación

- **Code Obfuscation**: Ofuscación en builds de producción
- **Debug Flags**: Deshabilitación de debug en release
- **Permission Management**: Permisos mínimos necesarios
- **Error Handling**: Manejo seguro de excepciones

## 🚀 Tecnologías Utilizadas

### Core Framework

- **Flutter** 3.29.3 - Framework multiplataforma
- **Dart** 3.7.2+ - Lenguaje de programación

### Gestión de Estado y Navegación

- **Riverpod** ^3.0.1 - Estado reactivo y dependency injection
- **GoRouter** ^16.2.4 - Navegación declarativa type-safe

### Networking y APIs

- **Dio** ^5.9.0 - Cliente HTTP con interceptors
- **PokeAPI** - API REST externa para datos Pokémon

### UI/UX

- **Material Design 3** - Sistema de diseño Google
- **Google Fonts** ^6.2.1 - Tipografías personalizadas
- **Animate Do** ^4.2.0 - Animaciones fluidas

### Almacenamiento y Persistencia

- **Shared Preferences** ^2.2.2 - Almacenamiento local key-value

### Herramientas de Desarrollo

- **Build Runner** - Generación de código
- **Flutter Launcher Icons** ^0.14.4 - Iconos personalizados
- **Flutter Native Splash** ^2.4.6 - Pantalla de carga

## ✨ Características Principales

- 🎨 **Interfaz moderna** con Material Design 3
- 🔍 **Búsqueda inteligente** con debouncer optimizado
- 🎯 **Filtros avanzados** por tipo de Pokémon
- 📱 **Multiplataforma** (Android, iOS, Web, Desktop)
- 💾 **Favoritos locales** con persistencia
- 🎭 **Onboarding** interactivo
- 📊 **Scroll infinito** para carga eficiente
- 🎨 **Splash screen** personalizado

## 🔧 Funcionalidades Técnicas

### Búsqueda Inteligente

- Debouncer de 500ms para optimizar consultas
- Búsqueda local primero, luego API
- Restauración automática de lista

### Sistema de Favoritos

- Persistencia local con SharedPreferences
- Estados reactivos con Riverpod
- Indicadores visuales de estado

### Gestión de Estado

- Providers especializados por funcionalidad
- Estado inmutable y reactivo
- Manejo de loading y error states

## 🐛 Solución de Problemas

### Error de Build

```bash
flutter clean
flutter pub get
fvm flutter gen-l10n
fvm flutter pub run build_runner build --delete-conflicting-outputs
```

### Error de Conexión API

- Verificar conexión a internet
- PokeAPI es gratuita y no requiere autenticación

## 📄 Licencia

Este proyecto está bajo la Licencia MIT.

---

⭐ **¡Gotta catch 'em all!** 🎮
