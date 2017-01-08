SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[опл_н]
(
	@счет_код int,
	@инф_опл text,
	@дата date,
	@опл_сум decimal(10, 0),
	@опл_вид_код int
)
AS
	SET NOCOUNT OFF;
    
    INSERT INTO [опл]
                ([счет_код],
                 [инф_опл],
                 [дата],
                 [опл_сум],
                 [опл_вид_код])
    VALUES      (@счет_код,
                 @инф_опл,
                 @дата,
                 @опл_сум,
                 @опл_вид_код);
  /*  
    SELECT счет_код,
           инф_опл,
           дата,
           опл_сум,
           опл_вид_код
    FROM   опл
    WHERE  ( счет_код = @счет_код ) 
    */
GO