<center>Compiler Apk</center>

---
Script ini bertujuan untuk membangun file APK dari proyek Android Anda secara otomatis. Proses ini mencakup kompilasi resource, linking, kompilasi kode Java, dexing, serta penandatanganan APK.

## 1. Prasyarat

Sebelum menjalankan script, Anda harus menginstal beberapa paket yang diperlukan agar proses build berjalan lancar.

### 1.1. Paket yang Diperlukan


- **aapt2**: Alat untuk kompilasi resource Android.
- **dx**: Alat untuk mengubah bytecode Java menjadi file DEX.
- **zipalign**: Alat untuk mengoptimalkan struktur file APK.
- **apksigner**: Alat untuk menandatangani APK.
- **figlet**: Alat untuk membuat teks besar dalam terminal.
- **OpenJDK**: Java Development Kit, diperlukan untuk kompilasi kode Java.

### 1.2. Instalasi Paket

#### 1.2.1. Pada Sistem Berbasis Debian/Ubuntu

Untuk menginstal paket-paket di atas, jalankan perintah berikut di terminal Anda:

```bash
apt update
apt install -y aapt2 dx zipalign apksigner figlet openjdk-8-jdk
```

Setelah menginstal OpenJDK, atur variabel lingkungan `$JAVA_HOME`:
atau paste manual ketik 
```bash
cd $HOME
```
```bash
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"
```

#### 1.2.2. Pada Termux (Android)

Jika Anda menggunakan Termux di Android, gunakan perintah berikut:

```bash
pkg update
pkg install aapt2 dx zipalign apksigner figlet openjdk-17
```

Kemudian atur `JAVA_HOME`:

```bash
cd $HOME
```
```bash
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64"
export PATH="$JAVA_HOME/bin:$PATH"
```

### 1.3. Persiapan Direktori Proyek

Pastikan bahwa direktori proyek Anda memiliki struktur yang sesuai dengan yang diharapkan oleh script. Misalnya:

```
<Proyek_Android>/
├── AndroidManifest.xml
├── assets/
├── res/
├── src/
│   └── com/
│       └── fcproject/
│           ├── MainActivity.java
│           └── R.java
└── library/
    ├── android.jar
    ├── aapt2
    ├── dx
    ├── zipalign
    └── apksigner
```

## 2. Menjalankan Script

1. **Navigasi ke direktori** tempat Anda menyimpan script `start.sh`.
2. **Jalankan script** dengan perintah berikut:

   ```bash
   bash start.sh <NamaDirektoriProyek>
   ```

   Di mana `<NamaDirektoriProyek>` adalah nama dari direktori proyek Android Anda. Misalnya:

   ```bash
   bash start.sh MyAndroidProject
   ```

### 2.1. Output dari Script

Script ini akan melakukan beberapa langkah otomatis:

1. **Cek Direktori**: Memastikan direktori proyek Anda ada.
2. **Atur Izin Eksekusi**: Mengatur izin eksekusi untuk file di folder `library/`.
3. **Kompilasi Resource**: Menggunakan `aapt2` untuk mengkompilasi resource.
4. **Link Resource**: Menghubungkan resource yang dikompilasi.
5. **Kompilasi Java**: Menggunakan `javac` untuk mengkompilasi file `.java`.
6. **DEX File**: Menggunakan `dx` untuk membuat file `classes.dex`.
7. **Paketkan APK**: Menggunakan `zip` untuk memaketkan `classes.dex` ke dalam APK.
8. **Optimasi APK**: Menggunakan `zipalign` untuk mengoptimalkan APK.
9. **Tandatangani APK**: Menggunakan `apksigner` untuk menandatangani APK.

Setelah semua langkah selesai, Anda akan melihat pesan sukses seperti berikut:

```bash
[SUCESS] nama project/build/app-release.apk
```

### 2.2. Preview APK yang Sudah Jadi

Setelah proses build selesai, file APK yang sudah ditandatangani akan berada di `sc/build/app-release.apk`.

Contoh preview dari APK yang sudah jadi:

![Preview APK](https://f.top4top.io/p_3151qqev10.jpg)

**Screenshot atau tampilan aplikasi yang dibangun dapat dilihat di emulator atau perangkat Android yang Anda gunakan.**

## 3. Troubleshooting

Jika terjadi kesalahan selama proses, script akan menampilkan kode kesalahan yang relevan. Beberapa langkah troubleshooting yang bisa dilakukan:

- **Periksa Log Kesalahan**: Log kesalahan akan menunjukkan pada bagian mana proses gagal.
- **Cek Dependencies**: Pastikan semua paket prasyarat telah diinstal dengan benar.
- **Validasi Struktur Proyek**: Pastikan direktori dan file proyek Anda sesuai dengan yang diharapkan.

## 4. Kesimpulan

Dengan mengikuti panduan ini, Anda dapat membangun APK dari proyek Android Anda secara otomatis menggunakan script bash ini. Pastikan semua langkah telah diikuti dengan benar untuk menghindari kesalahan dalam proses build.

Jika Anda memiliki pertanyaan lebih lanjut atau membutuhkan bantuan tambahan, jangan ragu untuk menghubungi kami.

---
 [![Email](https://img.shields.io/badge/Email-D14836?style=for-the-badge&logo=gmail&logoColor=white)](mailto:fancoding@outlook.com)
 [![WhatsApp](https://img.shields.io/badge/WhatsApp-25D366?style=for-the-badge&logo=whatsapp&logoColor=white)](https://wa.me/+6283128891053)
 [![Instagram](https://img.shields.io/badge/Instagram-E4405F?style=for-the-badge&logo=instagram&logoColor=white)](https://www.instagram.com/fcproject.xyz)
 [![Donate](https://img.shields.io/badge/Donate-FD5E53?style=for-the-badge&logo=buy-me-a-coffee&logoColor=white)](https://saweria.co/FCProject)
