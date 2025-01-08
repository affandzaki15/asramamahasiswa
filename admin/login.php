<?php
session_start();
include 'koneksi.php'; // Koneksi database

if (isset($_POST['login'])) {
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $password = mysqli_real_escape_string($conn, $_POST['password']);

    $query = "SELECT * FROM mahasiswa WHERE email = '$email'";
    $result = mysqli_query($conn, $query);

    if (mysqli_num_rows($result) > 0) {
        $user = mysqli_fetch_assoc($result);
        if (password_verify($password, $user['password'])) {
            $_SESSION['user_name'] = $user['full_name']; // Simpan nama lengkap di sesi
            $_SESSION['user_email'] = $user['email'];
            header("Location: home.php");
            exit();
        } else {
            echo "<script>alert('Password salah!');</script>";
        }
    } else {
        echo "<script>alert('Email tidak ditemukan!');</script>";
    }
}
?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>ASRAMA KITA - Login</title>
    <link rel="stylesheet" href="login.css">
</head>
<body>
    <div class="login-container">
        <!-- Form Login -->
        <div class="login-box">
            <!-- Logo di bagian atas -->
            <div class="logo-container">
    <a href="tampilan.php">
        <img src="logo.png" alt="Logo Asrama Kita" class="logo">
    </a>
</div>
            <!-- Form Input -->
            <form method="POST" action="">
                <h2>MASUK</h2>
                <div class="input-field">
                    <label for="email">Email</label>
                    <input type="email" id="email" name="email" placeholder="Masukkan Email" required>
                </div>
                <div class="input-field">
                    <label for="password">Kata Sandi</label>
                    <input type="password" id="password" name="password" placeholder="Masukkan Kata Sandi" required>
                </div>
                <div class="forgot">
                    <a href="forgot_password.php">Lupa Kata Sandi?</a>
                <button type="submit" class="btn">MASUK</button>
            </form>
            <p>Belum punya akun? <a href="register.php">Buat Akun</a>
            <div class="footer-text">
                <p>© Copyright Kelompok.7 </p>
            </div>
        </div>
    </div>
</body>
</html>
