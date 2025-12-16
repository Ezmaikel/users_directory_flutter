# Users Directory Flutter

Aplicación móvil desarrollada en **Flutter** que muestra un directorio de usuarios consumiendo una API REST.  
Permite listar usuarios, buscar por nombre y visualizar el detalle de cada usuario, incluyendo su ubicación en **Google Maps**.

---

## Funcionalidades

- Listado de usuarios desde una API
- Búsqueda de usuarios por nombre
- Vista de detalle de usuario
- Visualización de dirección
- Mapa con marcador usando Google Maps
- Manejo de estados (loading, error, data)

---

## Arquitectura

El proyecto utiliza una arquitectura **MVVM**:

- **Model**: Representación de datos (Users, Address, Geo)
- **ViewModel**: Manejo de estado y lógica de negocio usando `ChangeNotifier`
- **View (Screens)**: UI construida con Flutter
- **Provider** para gestión de estado

---

## Tecnologías usadas

- Flutter
- Dart
- Provider
- Google Maps Flutter
- HTTP (API REST)
- MVVM Architecture

---

