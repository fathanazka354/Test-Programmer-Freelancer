# test_selection_app

Pagination dan Pembuatan Data Melalui Form

## Deskripsi Singkat:

Proyek ini menghadirkan implementasi pagination dan pembuatan data baru melalui form.

Panduan Memulai:

### 1. Konfigurasi File

Buat file konfigurasi yang berisi parameter penting seperti URL API, keys rahasia, dan pengaturan lainnya.

### 2. Entity, Model, dan Usecase

Definisikan entity untuk mewakili data yang akan diolah.
Buat model untuk menyimpan data entity dan memetakannya ke format yang digunakan oleh aplikasi.
Implementasikan usecase untuk menangani operasi CRUD (Create, Read, Update, Delete) pada data.
### 3. Datasources

Kembangkan kelas datasource untuk menyediakan akses ke data dari berbagai sumber, seperti API atau database lokal.
Implementasikan metode untuk mengambil, menyimpan, memperbarui, dan menghapus data.
### 4. Repository

Buat kelas repository untuk mengelola interaksi dengan datasources.
Gunakan usecase dan datasources untuk menyediakan abstraksi tingkat tinggi untuk operasi CRUD.
### 5. Use Case

Implementasikan usecase untuk menangani logika bisnis terkait pagination dan pembuatan data.
Gunakan repository untuk mengakses data dan melakukan operasi CRUD.
### 6. State Management

Pilih state management library seperti BLoC, Provider, atau Riverpod untuk mengelola state aplikasi.
Gunakan state management untuk menyimpan dan memperbarui data pagination dan form.
### 7. UI

Buat UI untuk menampilkan daftar data yang dipaginasi dan form untuk membuat data baru.
Gunakan state management untuk menghubungkan UI dengan data pagination dan form.
Struktur Folder:

- common             # Komponen umum yang digunakan di seluruh aplikasi
- data                # Modul data yang berisi entity, model, datasource, repository, dan usecase
    - datasources
    - models
    - repositories
- domain              # Modul domain yang berisi logika bisnis aplikasi
    - entities
    - repositories
    - usecases
- features            # Modul fitur yang berisi implementasi spesifik untuk setiap fitur aplikasi
    - create_user
        - bloc
        - pages
        - widgets
    - list_user
        - bloc
        - pages
        - widgets
