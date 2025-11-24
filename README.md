# BMI Calculator

**Body Mass Index (BMI) Calculator built with Flutter && Provider**

<div align="center">
  <img width="300" height="300" alt="playstore" src="https://github.com/user-attachments/assets/22aad5b6-2952-4dff-a52e-fb3c2c1d0ee6" />
<div align="center">

<p align="center">
   BMI Calculator | By Mahmoud Alshehyby
</p>

<div align="start">
  
## Code structure:


```text
lib/
├── main.dart                      # Application entry point
├── commons/                       # Common utilities & helpers
│   ├── app_dimensions.dart
│   ├── my_logger.dart
│   ├── navigation_key.dart
│   ├── pop_widget.dart
│   └── show_toastification.dart
├── constants/                     # App-wide constants
│   ├── app_colors.dart
│   ├── app_fonts.dart
│   ├── assets.dart
│   ├── gaps.dart
│   └── texts.dart
└── presentation_layer/            # UI & Presentation Code
    ├── splash_screen/
    │   └── splash_screen.dart
    └── BML_calculator/            # Main BMI feature
        ├── BML_screen/            # Input Screen
        │   ├── components/        # Reusable UI widgets
        │   │   ├── bmi_title_widget.dart
        │   │   ├── ruler_component.dart
        │   │   ├── select_gender_widget.dart
        │   │   ├── select_height_widget.dart
        │   │   └── weight_age_widget.dart
        │   └── bmi_screen.dart    # Main input screen
        ├── BML_details/           # Results Screen
        │   ├── bmi_details_screen.dart
        │   └── bmi_info_model.dart
        └── statemanagement/       # State Logic (Riverpod Providers)
            ├── calculate_bmi_provider.dart
            ├── get_bmi_height_provider.dart
            ├── select_bim_gender.dart
            └── providers.dart     # Combined provider exports
```
## Features

- **Splash Screen**: A welcoming screen on app launch.
- **Gender Selection**: Choose between Male and Female.
- **Interactive Input**: Sleek ruler-style selector for height.
- **Real-time Calculation**: BMI is calculated and displayed instantly.
- **Visual BMI Analysis**: Color-coded results with immediate visual feedback on your health status.
- **Health Categorization**: Automatic classification into standard BMI categories:
  - 🟢 **Underweight** (Blue) - BMI < 18.5
  - 🟢 **Normal weight** (Green) - BMI 18.5 - 24.9
  - 🟡 **Overweight** (Yellow) - BMI 25 - 29.9
  - 🔴 **Obesity** (Red) - BMI ≥ 30
- **Detailed Results Screen**: View your BMI score, category, color indicator, and get personalized health information.
- **State Management**: Efficiently managed using Provider state menegement implementaition

## App Screens:


<table>
   <tr>
    <td align="center"><b>Spalsh Screen</b></td>
    <td align="center"><b>Main Screen</b></td>
    <td align="center"><b>Details screen</b></td>
  </tr>
  
  <tr>
    <td><img src="https://github.com/Cisco0xf/BMI-Calculator/blob/main/bmi_screens/1.webp?raw=true" alt="Screen" width="250"/></td>
    <td><img src="https://github.com/Cisco0xf/BMI-Calculator/blob/main/bmi_screens/2.webp?raw=true" alt="Screen" width="250"/></td>
    <td><img src="https://github.com/Cisco0xf/BMI-Calculator/blob/main/bmi_screens/3.webp?raw=true" alt="Screen" width="250"/></td>
  </tr>
 

</table>


## License
MIT © Mahmoud Nagy

