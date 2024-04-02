<?php
// Veritabanı bağlantısı
$servername = "localhost";
$username = "root";
$password = "";
$database = "fapp";

// Bağlantı oluşturma
$conn = new mysqli($servername, $username, $password, $database);

// Bağlantı kontrolü
if ($conn->connect_error) {
    die("Bağlantı hatası: " . $conn->connect_error);
}

// HTTP method kontrolü
$method = $_SERVER['REQUEST_METHOD'];

// CRUD işlemlerini gerçekleştirme
switch ($method) {
    case 'GET':
        // İşleri getir
        $sql = "SELECT * FROM jobs";
        $result = $conn->query($sql);
        $jobs = array();
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
                $jobs[] = $row;
            }
        }
        echo json_encode($jobs);
        break;

    case 'POST':
        // Yeni iş ekleme
        $data = json_decode(file_get_contents("php://input"), true);
        $job_name = $data['job_name'];
        $job_body = $data['job_body'];
        $giver_id = $data['giver_id'];;
        $excepter_id = 1;// excepter_id'yi varsayılan olarak null yapabilirsiniz
        
        $sql = "INSERT INTO jobs (job_name, job_body, giver_id, excepter_id) VALUES ('$job_name', '$job_body', '$giver_id', '$excepter_id')";
        if ($conn->query($sql) === TRUE) {
            echo "Yeni iş başarıyla eklendi.";
        } else {
            echo "Hata: " . $sql . "<br>" . $conn->error;
        }
        break;

    case 'PUT':
        // İş güncelleme
        $put_vars = json_decode(file_get_contents("php://input"), true);
        $job_id = $put_vars['job_id'];
        $excepter_id = $put_vars['excepter_id'];

        $sql = "UPDATE jobs SET excepter_id= '$excepter_id' WHERE job_id='$job_id'";
        if ($conn->query($sql) === TRUE) {
            echo "İş başarıyla güncellendi.";
        } else {
            echo "Hata: " . $sql . "<br>" . $conn->error;
        }
        break;

    case 'DELETE':
        // İş silme
        $delete_vars = json_decode(file_get_contents("php://input"), true);
        $job_id = $delete_vars['job_id'];

        $sql = "DELETE FROM jobs WHERE job_id='$job_id'";
        if ($conn->query($sql) === TRUE) {
            echo "İş başarıyla silindi.";
        } else {
            echo "Hata: " . $sql . "<br>" . $conn->error;
        }
        break;

    default:
        echo "Geçersiz istek.";
        break;
}

// Bağlantıyı kapat
$conn->close();
?>
