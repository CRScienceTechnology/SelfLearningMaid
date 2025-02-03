# 1.Project Mission

在从2023年到现在2025年，两年内AI迎来爆发式发展，最初从NewBing引爆第一次AI讨论，而后的ChatGPT4，再到现在我国的DeepSeek.无论是否认可，AI时代已经到来。随之而来的就是关于在AI新时代下，我们怎么自学？怎么合理、高效的自学？本次项目便是我们团队对这个问题的答案

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference




```mermaid
graph TD
    A[MyApp] --> B[MaterialApp]
    B -->|theme| C[ThemeData]
    C -->|useMaterial3| D[true]
    C -->|colorScheme| E[ColorScheme]
    E -->|seedColor| F[Blue Accent Shade 100]
    E -->|brightness| G[Light]
    C -->|textTheme| H[TextTheme]
    H -->|displayLarge| I[Large Display Style]
    H -->|titleLarge| J[Large Title Style]
    H -->|bodyMedium| K[Medium Body Style]
    H -->|displaySmall| L[Small Display Style]
    B -->|home| M[Startpage]
    B -->|routes| N[Routes]
    N -->|/tabview/Settingpage| O[Settingpage]
    N -->|/tabview/Resourcepage| P[Resourcepage]
    N -->|/Startpage| Q[Startpage]

    R[Choupage] --> S[Scaffold]
    S -->|appBar| T[AppBar]
    T -->|title| U[Title Text]
    T -->|leading| V[Menu IconButton]
    V --> W[Open Drawer]
    S -->|body| X[Center]
    X --> Y[Dynamic Content]
    Y -->|Home| Z[Home Text]
    Y -->|Business| AA[Business Text]
    Y -->|School| AB[School Text]
    S -->|drawer| AC[Drawer]
    AC --> AD[ListView]
    AD --> AE[DrawerHeader]
    AE --> AF[Header Text]
    AD --> AG[ListTile: Home]
    AG --> AH[Select Home]
    AD --> AI[ListTile: Business]
    AI --> AJ[Select Business]
    AD --> AK[ListTile: School]
    AK --> AL[Select School]
  



```
