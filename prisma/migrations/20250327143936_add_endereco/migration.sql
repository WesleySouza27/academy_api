-- CreateEnum
CREATE TYPE "StatusProjeto" AS ENUM ('finalizado', 'em_andamento');

-- CreateTable
CREATE TABLE "enderecos" (
    "id" UUID NOT NULL,
    "logradouro" VARCHAR(100) NOT NULL,
    "numero" VARCHAR(50) NOT NULL,
    "complemento" VARCHAR(50),
    "cep" VARCHAR(8) NOT NULL,
    "bairro" VARCHAR(100) NOT NULL,
    "cidade" VARCHAR(100) NOT NULL,
    "uf" VARCHAR(2) NOT NULL,
    "pais" VARCHAR(100) NOT NULL,
    "aluno_id" UUID NOT NULL,

    CONSTRAINT "enderecos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "projetos" (
    "id" UUID NOT NULL,
    "titulo" VARCHAR(50) NOT NULL,
    "descricao" TEXT,
    "ferramenta" VARCHAR(300) NOT NULL,
    "status" "StatusProjeto" NOT NULL,
    "aluno_id" UUID NOT NULL,

    CONSTRAINT "projetos_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "turmas" (
    "id" UUID NOT NULL,
    "programa" VARCHAR(100) NOT NULL,
    "edicao" SMALLINT NOT NULL,
    "max_alunos" SMALLINT NOT NULL,
    "criado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "atualizado_em" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "turmas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "matriculas" (
    "aluno_id" UUID NOT NULL,
    "turma_id" UUID NOT NULL,
    "ativo" BOOLEAN NOT NULL DEFAULT true,
    "data_matricula" DATE NOT NULL DEFAULT CURRENT_TIMESTAMP,

    CONSTRAINT "matriculas_pkey" PRIMARY KEY ("aluno_id","turma_id")
);

-- CreateTable
CREATE TABLE "fas" (
    "aluno_original_id" UUID NOT NULL,
    "aluno_fa_id" UUID NOT NULL,

    CONSTRAINT "fas_pkey" PRIMARY KEY ("aluno_original_id","aluno_fa_id")
);

-- CreateIndex
CREATE UNIQUE INDEX "enderecos_aluno_id_key" ON "enderecos"("aluno_id");

-- CreateIndex
CREATE UNIQUE INDEX "turmas_programa_edicao_key" ON "turmas"("programa", "edicao");

-- AddForeignKey
ALTER TABLE "enderecos" ADD CONSTRAINT "enderecos_aluno_id_fkey" FOREIGN KEY ("aluno_id") REFERENCES "alunos"("id") ON DELETE CASCADE ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "projetos" ADD CONSTRAINT "projetos_aluno_id_fkey" FOREIGN KEY ("aluno_id") REFERENCES "alunos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matriculas" ADD CONSTRAINT "matriculas_aluno_id_fkey" FOREIGN KEY ("aluno_id") REFERENCES "alunos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "matriculas" ADD CONSTRAINT "matriculas_turma_id_fkey" FOREIGN KEY ("turma_id") REFERENCES "turmas"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fas" ADD CONSTRAINT "fas_aluno_original_id_fkey" FOREIGN KEY ("aluno_original_id") REFERENCES "alunos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "fas" ADD CONSTRAINT "fas_aluno_fa_id_fkey" FOREIGN KEY ("aluno_fa_id") REFERENCES "alunos"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
