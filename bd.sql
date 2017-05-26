create table tarefas (
  id BIGINT NOT NULL AUTO_INCREMENT,
  descricao VARCHAR(255),
  finalizado BOOLEAN,
  dataFinalizacao DATE,
  primary key (id)
);