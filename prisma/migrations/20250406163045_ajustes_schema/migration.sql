-- CreateTable
CREATE TABLE "avaliacoes" (
    "id" UUID NOT NULL,
    "titulo" VARCHAR(100) NOT NULL,
    "nota" REAL NOT NULL,
    "descricao" TEXT,
    "data" DATE NOT NULL,
    "aluno_id" UUID NOT NULL,

    CONSTRAINT "avaliacoes_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "avaliacoes" ADD CONSTRAINT "avaliacoes_aluno_id_fkey" FOREIGN KEY ("aluno_id") REFERENCES "alunos"("id") ON DELETE CASCADE ON UPDATE CASCADE;
