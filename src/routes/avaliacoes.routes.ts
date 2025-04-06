import { Router } from "express";

const avaliacoesRoutes = Router();

avaliacoesRoutes.post("/", (req, res) => {
  const { titulo, descricao, nota } = req.body;

  // Simulação de criação de avaliação
  const novaAvaliacao = {
    id: Math.random().toString(36).substring(2, 9),
    titulo,
    descricao,
    nota,
  };

  res.status(201).json({
    sucesso: true,
    mensagem: "Avaliação criada com sucesso",
    dados: novaAvaliacao,
  });
});

export { avaliacoesRoutes };