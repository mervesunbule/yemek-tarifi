<?php
session_start();
require_once 'veritabani.php';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $kullanici_input = trim($_POST['kullanici_adi']);
    $sifre = $_POST['sifre'];

    // $conn yerine $veritabani değişkenini kullanıyoruz
    $stmt = $veritabani->prepare("SELECT id, kullanici_adi, sifre FROM kullanicilar WHERE kullanici_adi = :input OR eposta = :input");
    $stmt->execute([':input' => $kullanici_input]);
    $kullanici = $stmt->fetch(PDO::FETCH_ASSOC);

    if ($kullanici && password_verify($sifre, $kullanici['sifre'])) {
        $_SESSION['kullanici_id'] = $kullanici['id'];
        $_SESSION['kullanici_adi'] = $kullanici['kullanici_adi'];
        header("Location: anasayfa.php");
        exit();
    } else {
        echo "<p style='color:red;'>Geçersiz kullanıcı adı, e-posta veya şifre.</p>";
        echo "<a href='giris.php'>Geri Dön</a>";
    }
} else {
    header("Location: giris.php");
    exit();
}
?>