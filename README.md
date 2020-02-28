# flutter_x_crashlytics

This is a demo app and containing some simple `scenario for crash reporting using Crashlytics tool by Firebase.`

## Crash
`crash` adalah satu keadaan di mana sebuah komputer atau program, baik aplikasi atau bagian dari suatu sistem operasi berhenti berfungsi, umumnya akan menutup atau keluar setelah menghadapi kesalahan. 

Ketika Mobile apps sudah dirilis ke publik dan masih memiliki suatu bug atau issue yang menyebabkan Mobile apps tersebut crash dapat menyebabkan pengguna meng-uninstal atau bahkan menulis review negatif pada App Store atau mungkin akan mempostingnya di sosial media.

## Crashlytics
Firebase `Crashlytics` merupakan solusi pelaporan yang ringan dan dapat bekerja untuk membantu pelacakan crash dengan jelas dan dapat ditindaklanjuti dari masalah aplikasi, dengan solusi pelaporan yang andal untuk Android dan iOS. Selain membantu pelacakan crash, Firebase Crashlytics dapat membantu memprioritaskan serta memperbaiki masalah stabilitas yang mengurangi kualitas Mobile apps. Dengan menggunakan Firebase Crashlytics dapat menghemat waktu dan effort Pemecahan masalah dengan mengelompokkan error secara cerdas dan menunjukkan keadaan yang menyebabkannya.
Masalah dikelompokkan berdasarkan method dan line exception yang dibuat, dengan peringatan bahwa itu adalah akar penyebab dari sebuah exception.

## Getting Started

Here's to help you with Flutter : 
- [Flutter Installation](https://flutter.dev/docs/get-started/install)

Once Flutter is set on your PC, you will need to get firebase and crashlytics added into your Flutter projects :
- [Add Firebase to Flutter Projects](https://firebase.google.com/docs/flutter/setup?platform=android)
- [Add Crashlytics to Flutter Projects](https://pub.dev/packages/firebase_crashlytics)

Here's some helping links :
- [Official sample flutter project from firebase](https://github.com/FirebaseExtended/flutterfire/tree/master/packages/firebase_crashlytics/example)
- [Find keystore and add it to firebase project](https://codelabs.developers.google.com/codelabs/firebase-android/#4)
- [Stackoverflow : Flutter Crashlytics log caught exception](https://stackoverflow.com/questions/57997416/flutter-crashlytics-log-caught-exception)

## Hal yang perlu di `highlight` saat memeriksa report crash 
- Seberapa sering bug terjadi => bisa dilihat dari apakah crash terjadi pada sekali dari 1.000 pengguna, berapa kali peristiwa terjadi dan terpengaruh ke berapa pengguna saat di klik page tertentu
- Perangkat apa yang digunakan saat terjadi crash 
Termasuk kategori apa crash yang terjadi => fatal atau non fatal
```
Fatal    : crash prioritas harus di perbaiki karena berpengaruh kepada pengguna membuat ketidaknyamanan,
Nonfatal : crash tidak terlalu parah namun mungkin ada solusinya. Ini harus diperbaiki di beberapa titik.
```
- Nama project dan packagename, termasuk nomor baris tempat crash terjadi
- Jumlah total crash
- Jumlah total pengguna yang terpengaruh oleh crash
## Example result
![crash](kliks.png)
contoh kasus disini adalah error out of bound => mencoba mencetak data array yang tidak mempunyai nilai index  
##### crash reporting 
![crash](throw.png)
## apa yang harus di lakukan ?
share the issue via social-media or with your team members
