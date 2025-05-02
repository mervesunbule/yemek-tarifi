<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Giriş Yap</title>
</head>
<body>
    <h2>Giriş Yap</h2>
    <form action="giris_islem.php" method="POST">
        Kullanıcı Adı veya E-posta: <input type="text" name="kullanici_adi" required><br><br>
        Şifre: <input type="password" name="sifre" required><br><br>
        <button type="submit">Giriş Yap</button>
    </form>
    <p><a href="kayit.php">Hesabın yok mu? Kayıt ol</a></p>
</body>
</html>
