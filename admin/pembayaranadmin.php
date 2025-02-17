<?php
// Koneksi ke database
$host = "localhost"; // Server database
$user = "root";      // Username MySQL (default root)
$pass = "";          // Password MySQL (kosong di XAMPP)
$db   = "asramakita"; // Nama database

// Membuat koneksi
$koneksi = mysqli_connect($host, $user, $pass, $db);

// Cek koneksi
if (!$koneksi) {
    die("Koneksi database gagal: " . mysqli_connect_error());
}

// Jika tombol aksi ditekan, perbarui status1
if (isset($_POST['update_status1'])) {
    $id_pem = $_POST['id_pem'];
    $status1 = $_POST['update_status1']; // Nilai status1 (Belum, Proses, Selesai, Ditolak)
    
    // Query untuk memperbarui status1 pembayaran
    $query_update = "UPDATE pembayaran SET status1 = '$status1' WHERE id_pem = $id_pem";
    
    // Eksekusi query dan cek apakah berhasil
    if (mysqli_query($koneksi, $query_update)) {
        // Jika berhasil, redirect ke halaman yang sama agar status1 terbaru terlihat
        header("Location: pembayaranadmin.php");
        exit;
    } else {
        echo "Error: " . mysqli_error($koneksi); // Menampilkan error jika query gagal
    }
}

// Ambil data pembayaran dari database
$query = "SELECT * FROM pembayaran ORDER BY Tanggal_pembayaran DESC";
$result = mysqli_query($koneksi, $query);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kita Dorm - Pembayaran Admin</title>
    <style>
        body { 
            font-family: Arial, sans-serif; 
            margin: 20px; 
            background-color: #f9f9f9; 
        }
        h2 { 
            text-align: center; 
            color: #34495e; 
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px; 
            background-color: #fff; 
            border-radius: 8px; 
            overflow: hidden; 
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1); 
        }
        th, td { 
            border: 1px solid #ddd; 
            padding: 8px; 
            text-align: center; 
        }
        th { 
            background-color: #34495e; 
            color: #fff; 
        }
        button { 
            padding: 5px 10px; 
            cursor: pointer; 
            border: none; 
            border-radius: 4px; 
            color: #fff; 
            font-weight: bold; 
        }
        .btn-proses { 
            background-color: #3498db; 
        }
        .btn-proses:hover { 
            background-color: #2980b9; 
        }
        .btn-selesai { 
            background-color: #2ecc71; 
        }
        .btn-selesai:hover { 
            background-color: #27ae60; 
        }
        .btn-ditolak { 
            background-color: #e74c3c; 
        }
        .btn-ditolak:hover { 
            background-color: #c0392b; 
        }
    </style>
</head>
<body>
    <h2>Daftar Pembayaran Mahasiswa - Admin</h2>
    <table>
        <thead>
            <tr>
                <th>No</th>
                <th>Nama Lengkap</th>
                <th>NIM</th>
                <th>No Kamar</th>
                <th>Tanggal Pembayaran</th>
                <th>Total Pembayaran</th>
                <th>Status</th>
                <th>Aksi</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $no = 1;
            while ($data = mysqli_fetch_assoc($result)) {
                echo "<tr>";
                echo "<td>" . $no++ . "</td>";
                echo "<td>" . htmlspecialchars($data['full_name']) . "</td>";
                echo "<td>" . htmlspecialchars($data['nim']) . "</td>";
                echo "<td>" . htmlspecialchars($data['kode_kamar']) . "</td>";
                echo "<td>" . htmlspecialchars($data['Tanggal_pembayaran']) . "</td>";
                echo "<td>Rp " . number_format($data['total'], 0, ',', '.') . "</td>";
                echo "<td>" . htmlspecialchars($data['status1']) . "</td>";
                echo "<td>";

                // Dropdown untuk memilih status
                echo "<form method='POST' style='display:inline;'>
                        <input type='hidden' name='id_pem' value='" . $data['id_pem'] . "'>
                        <select name='update_status1' class='btn-proses'>
                            <option value='Belum' " . ($data['status1'] == 'Belum' ? 'selected' : '') . ">Belum</option>
                            <option value='Proses' " . ($data['status1'] == 'Proses' ? 'selected' : '') . ">Proses</option>
                            <option value='Selesai' " . ($data['status1'] == 'Selesai' ? 'selected' : '') . ">Selesai</option>
                            <option value='Ditolak' " . ($data['status1'] == 'Ditolak' ? 'selected' : '') . ">Ditolak</option>
                        </select>
                        <button type='submit' class='btn-proses'>Perbarui Status</button>
                      </form>";

                echo "</td>";
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</body>
</html>
