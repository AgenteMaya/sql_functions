-- Quando se exclui uma universidade, altera a tupla dos alunos que eram dessa faculdade colocando o identUniversidade como NULL.

CREATE OR REPLACE FUNCTION atualizaAlunoUniversidade()
RETURNS TRIGGER AS
$$
BEGIN
     UPDATE aluno
     SET identuniversidade = NULL
     WHERE identuniversidade = OLD.identificacao;
     RETURN OLD;
END
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_excluiUniversidade
BEFORE DELETE ON universidade
FOR EACH ROW
EXECUTE PROCEDURE atualizaAlunoUniversidade();
