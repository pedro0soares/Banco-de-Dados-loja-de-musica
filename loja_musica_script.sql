
CREATE TABLE Artistas (
    artista_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL
);

CREATE TABLE Albuns (
    album_id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    artista_id INT NOT NULL,
    ano_lancamento INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES Artistas(artista_id)
);

CREATE TABLE Musicas (
    musica_id SERIAL PRIMARY KEY,
    titulo VARCHAR(100) NOT NULL,
    duracao TIME NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES Albuns(album_id)
);

CREATE TABLE Clientes (
    cliente_id SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Vendas (
    venda_id SERIAL PRIMARY KEY,
    cliente_id INT NOT NULL,
    musica_id INT NOT NULL,
    data_venda DATE NOT NULL,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id),
    FOREIGN KEY (musica_id) REFERENCES Musicas(musica_id)
);

INSERT INTO Artistas (nome) VALUES 
('The Beatles'), 
('Pink Floyd'), 
('Queen'), 
('Adele');

INSERT INTO Albuns (titulo, artista_id, ano_lancamento) VALUES 
('Abbey Road', 1, 1969),
('The Dark Side of the Moon', 2, 1973),
('A Night at the Opera', 3, 1975),
('21', 4, 2011);

INSERT INTO Musicas (titulo, duracao, album_id) VALUES 
('Come Together', '00:04:20', 1),
('Something', '00:03:03', 1),
('Time', '00:07:06', 2),
('Bohemian Rhapsody', '00:05:55', 3),
('Rolling in the Deep', '00:03:48', 4);

INSERT INTO Clientes (nome, email) VALUES 
('João Silva', 'joao.silva@example.com'),
('Maria Oliveira', 'maria.oliveira@example.com'),
('Carlos Lima', 'carlos.lima@example.com');

INSERT INTO Vendas (cliente_id, musica_id, data_venda) VALUES 
(1, 1, '2024-12-01'),
(2, 3, '2024-12-01'),
(3, 5, '2024-12-02');
