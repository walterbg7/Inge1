CREATE PROCEDURE [dbo].[Departamento_Insert]
	@Nombre NVARCHAR (50),
	@Presupuesto FLOAT = 0.0
AS
BEGIN
	INSERT INTO [Departamento] ([Nombre],[Presupuesto])
	VALUES (@Nombre,@Presupuesto)
END
