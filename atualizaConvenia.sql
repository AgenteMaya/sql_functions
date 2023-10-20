CREATE OR REPLACE FUNCTION atualizaConvenia()
RETURNS TRIGGER AS
$$
BEGIN
     DELETE FROM convenia
     WHERE universidade = OLD.identificacao;
     RETURN OLD;
END
$$
LANGUAGE plpgsql;

CREATE TRIGGER trigger_excluiConvenia
BEFORE DELETE ON universidade
FOR EACH ROW
EXECUTE PROCEDURE atualizaConvenia();
