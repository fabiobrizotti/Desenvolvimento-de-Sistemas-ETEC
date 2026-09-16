const express = require('express');
const path = require('path');
require('dotenv').config();

const alunoRoutes = require('./src/routes/alunos');
const authRoutes = require('./src/routes/auth');

const app = express();
app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static(path.join(__dirname, 'public')));
app.use(express.static(path.join(__dirname, 'src', 'views'))); // Adicionei os arquivos estáticos

app.use('/api/alunos', alunoRoutes);
app.use('/api/auth', authRoutes);

app.get('/api/health', (req, res) => res.json({ status: 'ok' }));

app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'src', 'views', 'login.html'));
});

// Catch-all (fallback pra API)
app.get('/api/*', (req, res) => {
    res.json({ api: "EduManager", version: "1.0" });
});

const PORT = process.env.PORT || 3000;
app.listen(PORT, () => console.log(`Server rodando na porta ${PORT}`));
