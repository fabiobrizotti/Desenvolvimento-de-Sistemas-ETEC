<?php
header("Content-Type: application/json");require_once "config/Database.php";require_once "models/Veiculo.php";

$method = $_SERVER['REQUEST_METHOD'];
$path = explode('/', trim($_SERVER['PATH_INFO'] ?? '', '/'));
$veiculoModel = new Veiculo();
// Roteamento Simples

switch ($method) {
    case 'GET':
        echo json_encode($veiculoModel->listarTudo());
        break;

    case 'POST':
        $dados = json_decode(file_get_contents("php://input"), true);
        if ($veiculoModel->criar($dados)) {
            echo json_encode(["message" => "Veículo cadastrado!"]);
        }
        break;

    case 'DELETE':
        $id = $path[0] ?? null;
        if ($id && $veiculoModel->deletar($id)) {
            echo json_encode(["message" => "Veículo removido!"]);
        }
        break;

    default:
        http_response_code(405);
        echo json_encode(["error" => "Método não permitido"]);
        break;
}
