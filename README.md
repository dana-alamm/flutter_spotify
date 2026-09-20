# 🎵 Spotify Clone - Flutter & Firebase

A modern, responsive music streaming app UI inspired by **Spotify**, built using **Flutter** and integrated with **Firebase Authentication** and **Local Caching**.

## 📱 App Screenshots

### 🔐 Authentication Flow
| Welcome Screen | Log In Screen | Sign Up Screen |
| :---: | :---: | :---: |
| <img width="240" alt="Welcome Screen" src="https://github.com/user-attachments/assets/b2d2efbc-564e-4837-8a12-63574e6f7612" /> | <img width="240" alt="Sign Up Screen" src="https://github.com/user-attachments/assets/ada9ff52-f23d-4223-812b-ba319d5024d7" /> | <img width="240"  alt="Screenshot 2026-09-20 145119" src="https://github.com/user-attachments/assets/4cf04f9a-9589-487b-a34d-4aca68a6994e" />


---

### 🏠 Home Feed
| Home Screen |
| :---: |
| <img width="240" alt="Home Screen" src="https://github.com/user-attachments/assets/31c7eb14-75a7-4990-b866-353e8bb66cb6" /> |

---

### 🔍 Search Flow
| Search Main | Typing Query | 
| :---: | :---: |
| <img width="240" alt="Search 1" src="https://github.com/user-attachments/assets/90caf9db-c01f-43d1-a184-b2fa154a8534" /> | <img width="240" alt="Search 2" src="https://github.com/user-attachments/assets/b95cd476-748e-4320-89f9-be93cc4afcfc" /> | 

---

### 📚 Your Library
| Your Library Screen |
| :---: |
| <img width="240" alt="Your Library" src="https://github.com/user-attachments/assets/3dac06c0-0668-4417-8c29-b8f34e947989" /> |

---

### 🎧 Music Player
| Now Playing Screen |
| :---: |
| <img width="240" alt="Screenshot 2026-09-20 145318" src="https://github.com/user-attachments/assets/659d369e-b174-4863-b1d4-e24aeb64ef95" /> |

---

## ✨ Key Features

- **Authentication & Security:**
  - Email & Password Sign-up and Sign-in powered by Firebase Authentication.
  - Strict form validation using regular expressions for email structure and password complexity.
  - Secure and user-friendly error messages (handling invalid credentials, network issues, etc.).

- **Music Browsing & Discovery:**
  - Spotify-inspired dark UI with custom themes and typography.
  - Interactive Search interface with instant query filtering.
  - Curated Home feed and personal "Your Library" view.

- **Audio Player UI:**
  - Modern "Now Playing" screen displaying album artwork, track duration sliders, and playback controls.

- **Session & Local Storage:**
  - Persistent login states and profile caching using `shared_preferences`.

---

## 🛠️ Tech Stack & Dependencies

- **Framework:** Flutter (Dart)
- **Backend Service:** Firebase Authentication
- **Local Persistence:** `shared_preferences`
- **Media & UI:** Custom Icons, Google Fonts (Poppins), and Asset Images

---

## 📂 Project Structure

```text
lib/
├── core/
│   ├── constants/       # App colors, themes, assets
│   └── services/        # Shared Preferences & local cache services
├── screens/
│   ├── welcome_screen.dart
│   ├── login_screen.dart
│   ├── signup_screen.dart
│   ├── home_screen.dart
│   ├── search_screen.dart
│   ├── library_screen.dart
│   └── player_screen.dart
├── widgets/
│   ├── spotify_header.dart
│   ├── custom_drawer.dart
│   └── custom_text_fields.dart
└── main.dart
