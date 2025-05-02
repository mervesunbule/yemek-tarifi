<?php
session_start();
require_once 'veritabani.php';

$sorgu = $veritabani->prepare("
    SELECT t.* FROM tarifler t
    INNER JOIN favoriler f ON t.id = f.tarif_id
    WHERE f.kullanici_id = :kullanici_id
");
$sorgu->execute(['kullanici_id' => $_SESSION['kullanici_id']]);
$tarifler = $sorgu->fetchAll();
?>

<!DOCTYPE html>
<html lang="tr">
<head>
    <meta charset="UTF-8">
    <title>Favorilerim</title>
</head>
<body>
    <h1>Favori Tariflerim</h1>

    <?php foreach ($tarifler as $tarif): ?>
        <div style="border:1px solid #ccc; margin:10px; padding:10px;">
            <h2><?php echo htmlspecialchars($tarif['baslik']); ?></h2>
            <a href="tarif_detay.php?id=<?php echo $tarif['id']; ?>">Tarifi Gör</a>
        </div>
    <?php endforeach; ?>
</body>
</html>
