<?php
session_start();

// Proses login
if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    $email = $_POST['email'];
    $password = $_POST['password'];

    // Data login admin
    $admin_email = "gue";
    $admin_password = "admin";

    // Validasi login
    if ($email == $admin_email && $password == $admin_password) {
        $_SESSION['admin'] = true;
        $_SESSION['email'] = $admin_email;
        header("Location: index.php");
        exit;
    } else {
        $error = "Email atau password salah.";
    }
}
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Admin</title>
    <style>
        /* Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #6e8efb, #a777e3);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            color: #fff;
        }

        .login-container {
            background-color: rgba(255, 255, 255, 0.1);
            border-radius: 15px;
            padding: 30px;
            width: 100%;
            max-width: 400px;
            box-shadow: 0 8px 32px rgba(0, 0, 0, 0.25);
            backdrop-filter: blur(10px);
            text-align: center;
        }

        .login-container h2 {
            font-size: 2rem;
            margin-bottom: 20px;
            color: #fff;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            font-size: 14px;
            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 25px;
            background-color: rgba(255, 255, 255, 0.2);
            color: #fff;
            outline: none;
            font-size: 16px;
            transition: 0.3s ease;
        }

        .form-group input::placeholder {
            color: #e0e0e0;
        }

        .form-group input:focus {
            background-color: rgba(255, 255, 255, 0.3);
            box-shadow: 0 0 8px rgba(255, 255, 255, 0.6);
        }

        .submit-container button {
            width: 100%;
            padding: 12px;
            border: none;
            border-radius: 25px;
            background-color: #6e8efb;
            color: #fff;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        .submit-container button:hover {
            background-color: #a777e3;
            box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
        }

        .error {
            color: #ff6b6b;
            font-size: 14px;
            margin-bottom: 20px;
        }

        @media (max-width: 480px) {
            .login-container {
                padding: 20px;
            }

            .login-container h2 {
                font-size: 1.5rem;
            }
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login Admin</h2>
        <?php if (isset($error)): ?>
            <div class="error"><?php echo $error; ?></div>
        <?php endif; ?>
        <form method="POST" action="">
            <div class="form-group">
                <label for="email">Email</label>
                <input type="text" id="email" name="email" placeholder="Masukkan email admin" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Masukkan password admin" required>
            </div>
            <div class="submit-container">
                <button type="submit">Login</button>
            </div>
        </form>
    </div>
</body>
</html>
