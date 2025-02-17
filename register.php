<?php

// Koneksi ke database

session_start();

$host = "localhost"; // Server database

$user = "root";      // Username MySQL (default root)

$pass = "";          // Password MySQL (kosong di XAMPP)

$db   = "asramakita"; // Nama database



// Membuat koneksi

$conn = mysqli_connect($host, $user, $pass, $db);



// Cek koneksi

if (!$conn) {

    die("Koneksi database gagal: " . mysqli_connect_error());

}



// Proses registrasi

if (isset($_POST['register'])) {

    // Ambil data dari form

    $full_name = $_POST['full_name'];

    $nim = $_POST['nim'];

    $email = $_POST['email'];

    $password = $_POST['password'];

    $confirm_password = $_POST['confirm-password'];



    // Validasi password

    if ($password !== $confirm_password) {

        echo "Kata sandi dan konfirmasi kata sandi tidak cocok.";

        exit;

    }



    // Hash password

    $hashed_password = password_hash($password, PASSWORD_BCRYPT);



    // Insert ke database

    $query = "INSERT INTO mahasiswa (full_name, nim, email, password) VALUES ('$full_name', '$nim','$email', '$hashed_password')";

    

    if (mysqli_query($conn, $query)) {

        // Jika registrasi berhasil, tampilkan notifikasi dan alihkan ke halaman login

        echo "<script>

                alert('Registrasi berhasil!');

                window.location.href = 'login.php'; // Mengarahkan ke halaman login

              </script>";

    } else {

        echo "Error: " . $query . "<br>" . mysqli_error($conn);

    }

}

?>


<!DOCTYPE html>
<html lang="id">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Halaman Daftar - ASRAMA KITA</title>
    <link rel="stylesheet" href="register.css"> <!-- Ganti dengan file CSS yang sesuai -->
</head>

<body>
    <div class="login-container">
        <!-- Form Section -->
        <div class="login-box">
            <div class="logo-container">
                <a href="tampilan.php"> <!-- Tautkan logo ke halaman tampilan.php -->
                    <img src="logo.png" alt="Logo Asrama Kita" class="logo">
                </a>
            </div>

            <h2>Daftar</h2>
            <p>Silakan buat akun baru Anda.</p>

            <form method="POST" action="">
                <div class="input-field">
                    <label for="full_name">Nama Lengkap</label>
                    <input type="text" id="full_name" name="full_name" placeholder="Masukkan Nama Lengkap" required>
                </div>

                <div class="input-field">
                    <label for="nim">NIM</label>
                    <input type="text" id="nim" name="nim" placeholder="Masukkan NIM" required>
                </div>

                <div class="input-field">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Masukkan Email" required>
                </div>

                <div class="input-field">
                    <label for="password">Kata Sandi</label>
                    <input type="password" id="password" name="password" placeholder="Masukkan Kata Sandi" required>
                </div>

                <div class="input-field">
                    <label for="confirm-password">Konfirmasi Kata Sandi</label>
                    <input type="password" id="confirm-password" name="confirm-password" placeholder="Ulangi Kata Sandi" required>
                </div>

                <button type="submit" class="btn" name="register">Daftar</button>
            </form>

            <p class="login-link">Sudah punya akun? <a href="login.php">Masuk</a></p>
        </div>
    </div>
</body>

</html>
