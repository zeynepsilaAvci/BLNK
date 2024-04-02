<?php
$serverHost = "localhost";
$user = "root";
$password = "";
$database = "fapp";

$connectNow = new mysqli($serverHost, $user, $password, $database);

// Verilen user_id'ye göre excepter_id alanı eşit olan işleri getirme
function getJobsByUserIdAsExcepter($user_id) {
    global $connectNow;

    $sql = "SELECT * FROM jobs WHERE excepter_id='$user_id'";
    $result = $connectNow->query($sql);
    $jobs = array();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $jobs[] = $row;
        }
    }
    return $jobs;
}

// Verilen user_id'ye göre giver_id alanı eşit olan işleri getirme
function getJobsByUserIdAsGiver($user_id) {
    global $connectNow;

    $sql = "SELECT * FROM jobs WHERE giver_id='$user_id'";
    $result = $connectNow->query($sql);
    $jobs = array();
    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            $jobs[] = $row;
        }
    }
    return $jobs;
}

// Kullanıcıdan gelen veriyi al
$data = json_decode(file_get_contents("php://input"), true);
$method = $_SERVER['REQUEST_METHOD'];

// İstek metoduna göre işlem yap
switch ($method) {
    case 'GET':
        // GET isteği ile işleri getir
        if(isset($_GET['user_id'])) {
            $user_id = $_GET['user_id'];
            // excepter_id'ye eşit olan işleri getir
            $excepter_jobs = getJobsByUserIdAsExcepter($user_id);
            // giver_id'ye eşit olan işleri getir
            $giver_jobs = getJobsByUserIdAsGiver($user_id);

            // İşleri birleştirerek yanıtı oluştur
            $response = array(
                "excepted_jobs" => $excepter_jobs,
                "given_jobs" => $giver_jobs
            );
            echo json_encode($response);
        } else {
            echo "Geçersiz istek.";
        }
        break;
    default:
        echo "Geçersiz istek.";
        break;
}
?>
