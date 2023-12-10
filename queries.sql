-- 1 - Buscar o nome e ano dos filmes

SELECT [Nome], [Ano] FROM [dbo].[Filmes];

-- 2 - Buscar o nome e ano dos filmes, ordenados por ordem crescente pelo ano

SELECT [Nome], [Ano] FROM [dbo].[Filmes] 
ORDER BY [Ano];

-- 3 - Buscar pelo filme de volta para o futuro, trazendo o nome, ano e a duração

SELECT [Nome], [Ano], [Duracao] FROM [dbo].[Filmes] 
WHERE [Nome] LIKE 'De volta para o futuro';

-- 4 - Buscar os filmes lançados em 1997

SELECT * FROM [dbo].[Filmes] 
WHERE [Ano] = 1997;

-- 5 - Buscar os filmes lançados APÓS o ano 2000

SELECT * FROM [dbo].[Filmes] 
WHERE [Ano] > 2000;

-- 6 - Buscar os filmes com a duracao maior que 100 e menor que 150, ordenando pela duracao em ordem crescente

SELECT * FROM [dbo].[Filmes] 
WHERE [Duracao] > 100 
AND [Duracao] < 150;

-- 7 - Buscar a quantidade de filmes lançadas no ano, agrupando por ano, ordenando pela duracao em ordem decrescente

SELECT [Ano], COUNT(*) AS [Quantidade] 
FROM [dbo].[Filmes] 
GROUP BY [Ano] 
ORDER BY SUM(Duracao) DESC;

-- 8 - Buscar os Atores do gênero masculino, retornando o PrimeiroNome, UltimoNome

SELECT [PrimeiroNome], [UltimoNome] 
FROM [dbo].[Atores] 
WHERE [Genero] = 'M';

-- 9 - Buscar os Atores do gênero feminino, retornando o PrimeiroNome, UltimoNome, e ordenando pelo PrimeiroNome

SELECT [PrimeiroNome], [UltimoNome] 
FROM [dbo].[Atores] 
WHERE [Genero] = 'F' 
ORDER BY [PrimeiroNome];

-- 10 - Buscar o nome do filme e o gênero

SELECT F.Nome AS NomeFilme, G.Genero AS Genero
FROM [dbo].[FilmesGenero] FG
JOIN [dbo].[Filmes] F ON FG.IdFilme = F.Id
JOIN [dbo].[Generos] G ON FG.IdGenero = G.Id;

-- 11 - Buscar o nome do filme e o gênero do tipo "Mistério"

SELECT F.Nome AS NomeFilme, G.Genero AS Genero
FROM [dbo].[FilmesGenero] FG
JOIN [dbo].[Filmes] F ON FG.IdFilme = F.Id
JOIN [dbo].[Generos] G ON FG.IdGenero = G.Id
WHERE G.Id = 10;

-- 12 - Buscar o nome do filme e os atores, trazendo o PrimeiroNome, UltimoNome e seu Papel

SELECT A.PrimeiroNome, A.UltimoNome, EF.Papel 
FROM [dbo].[ElencoFilme] EF
JOIN [dbo].[Filmes] F ON EF.IdFilme = F.Id
JOIN [dbo].[Atores] A ON EF.IdAtor = A.Id;