const db = require('../config/db');

class Aluno {
    static async findAll() {
        const [rows] = await db.query('SELECT * FROM alunos');
        return rows;
    }
    static async create(dados) {
        const { nome, cpf, matricula, email } = dados;
        const [result] = await db.query(
            'INSERT INTO alunos (nome, cpf, matricula, email) VALUES (?, ?, ?, ?)',
            [nome, cpf, matricula, email]
        );
        return result.insertId;
    }
}
module.exports = Aluno;
