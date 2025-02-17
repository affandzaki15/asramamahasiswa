<?php
// Koneksi ke database
$host = 'localhost';
$user = 'root'; // Sesuaikan dengan user database Anda
$pass = '';     // Sesuaikan dengan password database Anda
$db = 'asramakita'; // Ganti dengan nama database Anda

$conn = new mysqli($host, $user, $pass, $db);

// Cek koneksi
if ($conn->connect_error) {
    die("Koneksi gagal: " . $conn->connect_error);
}

// Query untuk mendapatkan data asrama
$sql = "SELECT * FROM pengelola_asrama";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biodata Pengelola Asrama</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }

        .container {
            margin: 20px auto;
            max-width: 1200px;
            text-align: center;
        }

        h1 {
            margin-bottom: 20px;
        }

        .card-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .card {
            width: 250px;
            background: #fff;
            border: 1px solid #ddd;
            border-radius: 10px;
            padding: 15px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        .card img {
            width: 100px;
            height: 100px;
            object-fit: cover;
            border-radius: 50%;
            margin-bottom: 10px;
            border: 2px solid #ddd;
        }

        .card h2 {
            margin: 10px 0 5px;
            font-size: 18px;
            color: #333;
        }

        .card p {
            margin: 5px 0;
            font-size: 14px;
            color: #666;
        }

        .status {
            font-weight: bold;
        }

        .status.aktif {
            color: green;
        }

        .status.tidak-aktif {
            color: red;
        }
    </style>
</head>

<body>
    <div class="container">
        <h1>Biodata Pengelola Asrama</h1>
        <div class="card-container">
        <?php if ($result->num_rows > 0): ?>
                <?php while ($row = $result->fetch_assoc()): ?>
                    <div class="card">
                        <img src="<?php echo $row['foto_profil'] ?: 'default.png'; ?>" alt="Foto Karyawan">
                        <h2><?php echo htmlspecialchars($row['nama_lengkap']); ?></h2>
                        <p><strong>Telepon:</strong> <?php echo htmlspecialchars($row['nomor_telepon']); ?></p>
                        <p><strong>Jabatan:</strong> <?php echo htmlspecialchars($row['jabatan']); ?></p>
                        <p class="status <?php echo ($row['status'] == 'Aktif') ? 'aktif' : 'tidak-aktif'; ?>">
                            Status: <?php echo htmlspecialchars($row['status']); ?>
                        </p>
                        
                    </div>
                <?php endwhile; ?>
            <?php else: ?>
                <p>Tidak ada data</p>
            <?php endif; ?>
        </div>
    </div>
</body>

</html>

<?php
// Tutup koneksi
$conn->close();
?>