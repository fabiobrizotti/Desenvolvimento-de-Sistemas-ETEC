const db = require('../config/db');
const bcrypt = require('bcryptjs');

class Usuario {
    static async findByEmail(email) {
        const [rows] = await db.query('SELECT * FROM usuarios WHERE email = ?', [email]);
        return rows[0];
    }
    
    static async create(nome, email, senhaPlain, perfil) {
        const hash = await bcrypt.hash(senhaPlain, 10);
        const [result] = await db.query(
            'INSERT INTO usuarios (nome, email, senha_hash, perfil) VALUES (?, ?, ?, ?)',
            [nome, email, hash, perfil]
        );
        return result.insertId;
    }
}
module.exports = Usuario;
