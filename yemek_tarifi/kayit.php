<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Kayıt Ol</title>
</head>
<body>
    <h2>Kayıt Ol</h2>
    <form action="kayit_islem.php" method="POST">
        Kullanıcı Adı: <input type="text" name="username" required><br><br>
        E-posta: <input type="email" name="email" required><br><br>
        Şifre: <input type="password" name="password" required><br><br>
        <button type="submit">Kayıt Ol</button>
    </form>
    <p><a href="giris.php">Zaten hesabın var mı? Giriş yap</a></p>
</body>
</html>
