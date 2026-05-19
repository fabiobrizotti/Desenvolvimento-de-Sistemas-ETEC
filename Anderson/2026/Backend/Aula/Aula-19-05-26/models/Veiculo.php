<?php
class Veiculo {
    private $db;

    public function __construct() {
        $this->db = Database::getConnection();
    }

    public function listarTudo() {
        return $this->db->query("SELECT v.*, m.nome as marca FROM veiculos v JOIN marcas m ON v.marca_id = m.id")->fetchAll();
    }

    public function criar($dados) {
        $sql = "INSERT INTO veiculos (marca_id, modelo, ano, preco, cor) VALUES (?, ?, ?, ?, ?)";
        return $this->db->prepare($sql)->execute([$dados['marca_id'], $dados['modelo'], $dados['ano'], $dados['preco'], $dados['cor']]);
    }

    public function deletar($id) {
        return $this->db->prepare("DELETE FROM veiculos WHERE id = ?")->execute([$id]);
    }
}