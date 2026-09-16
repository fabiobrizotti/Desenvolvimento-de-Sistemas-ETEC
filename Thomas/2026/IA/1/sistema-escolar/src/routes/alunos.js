const express = require('express');
const router = express.Router();
const controller = require('../controllers/alunoController');

router.get('/', controller.listarAlunos);
router.post('/', controller.criarAluno);

module.exports = router;
