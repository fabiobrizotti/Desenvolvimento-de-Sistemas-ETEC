const Aluno = require('../models/aluno');

exports.listarAlunos = async (req, res) => {
    try {
        const alunos = await Aluno.findAll();
        res.json(alunos);
    } catch (error) {
        res.status(500).json({ erro: error.message });
    }
};

exports.criarAluno = async (req, res) => {
    try {
        const id = await Aluno.create(req.body);
        res.status(201).json({ id, ...req.body });
    } catch (error) {
        res.status(400).json({ erro: error.message });
    }
};
