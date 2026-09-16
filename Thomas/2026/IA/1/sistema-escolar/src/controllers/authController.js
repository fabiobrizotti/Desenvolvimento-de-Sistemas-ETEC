const Usuario = require('../models/usuario');
const jwt = require('jsonwebtoken');
const bcrypt = require('bcryptjs');

exports.cadastrar = async (req, res) => {
    try {
        const { nome, email, senha, perfil } = req.body;
        const id = await Usuario.create(nome, email, senha, perfil);
        res.status(201).json({ msg: 'Usuário criado', id });
    } catch (err) {
        res.status(400).json({ erro: err.message });
    }
};

exports.login = async (req, res) => {
    try {
        const { email, senha } = req.body;
        const user = await Usuario.findByEmail(email);
        
        if (!user || !(await bcrypt.compare(senha, user.senha_hash))) {
            return res.status(401).json({ erro: 'Credenciais inválidas' });
        }
        
        const token = jwt.sign({ id: user.id, perfil: user.perfil }, process.env.JWT_SECRET, { expiresIn: '1d' });
        res.json({ token, perfil: user.perfil });
    } catch (err) {
        res.status(500).json({ erro: err.message });
    }
};
