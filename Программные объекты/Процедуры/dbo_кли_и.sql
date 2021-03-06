﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[кли_и]
(
	@кли_код int,
	@фам char(30),
	@имя char(30),
	@отч char(30),
	@пол int,
	@рожд_дата date,
	@рожд_место char(30),
	@гражд_код int,
	@рег int,
	
	@раб_место char(30),
	@раб_должность char(30),
	@раб_ком_уд char(30),
	@раб_прибыл char(30),
	@пас_вид_код int,
	@пас_номер char(30),
	@пас_дата date,
	@пас_дата_по date,

	@пас_выдан char(30),
	@адр_страна_код int,
	@адр_город char(30),
	@адрес char(100),
	@телефон char(30),
	@е_маил char(30),
	@авто_марка char(30),
	@авто_номер char(30),
	@инф_кли text,
	@виза_вид_код int,
	@виза_сер char(3),
	@виза_номер char(30),
	@виза_дата_с date,
	@виза_дата_по date,
	@страх_стр_код int,
	@страх_кем_код int,
	@страх_номер char(30),
	@страх_дата_с date,
	@страх_дата_по date,
	@миг_карта char(30),
	@миг_карта_дата_с date,
	@миг_карта_дата_по date,
	@скид_карта char(30),
	@скид_проц int,
	@гра_дата date,
	@гра_код int,
	@фам_лат char(30),
	@имя_лат char(30),
	@отч_лат char(30)
	
	
)
AS
	SET NOCOUNT OFF;
    
    UPDATE [кли]
    SET    [фам] = @фам,
           [имя] = @имя,
           [отч] = @отч,
           [пол] = @пол,
           [рожд_дата] = @рожд_дата,
           [рожд_место] = @рожд_место,
           [гражд_код] = @гражд_код,
          [рег] = @рег,
           [раб_место] = @раб_место,
           [раб_должность] = @раб_должность,
           [раб_ком_уд] = @раб_ком_уд,
           [раб_прибыл] = @раб_прибыл,
           [пас_вид_код] = @пас_вид_код,
           [пас_номер] = @пас_номер,
           [пас_дата] = @пас_дата,
                   [пас_дата_по] = @пас_дата_по,
           [пас_выдан] = @пас_выдан,
           [адр_страна_код] = @адр_страна_код,
           [адр_город] = @адр_город,
           [адрес] = @адрес,
           [телефон] = @телефон,
           [е_маил] = @е_маил,
           [авто_марка] = @авто_марка,
           [авто_номер] = @авто_номер,
           [инф_кли] = @инф_кли,
           [виза_вид_код] = @виза_вид_код,
           [виза_сер] = @виза_сер,
           [виза_номер] = @виза_номер,
           [виза_дата_с] = @виза_дата_с,
           [виза_дата_по] = @виза_дата_по,
           [страх_стр_код] = @страх_стр_код,
           [страх_кем_код] = @страх_кем_код,
           [страх_номер] = @страх_номер,
           [страх_дата_с] = @страх_дата_с,
           [страх_дата_по] = @страх_дата_по,
           [миг_карта] = @миг_карта,
           [миг_карта_дата_с] = @миг_карта_дата_с,
           [миг_карта_дата_по] = @миг_карта_дата_по,
           [скид_карта] = @скид_карта,
           [скид_проц] = @скид_проц,
           [гра_дата] = @гра_дата,
           [гра_код] = @гра_код,
           [фам_лат] = @фам_лат,
           [имя_лат] = @имя_лат,
           [отч_лат] = @отч_лат
          
    WHERE  [кли_код] = @кли_код 
    SELECT кли_код,
           фам,
           имя,
           отч,
           пол,
           рожд_дата,
           рожд_место,
           гражд_код,
           раб_место,
           раб_должность,
           раб_ком_уд,
           раб_прибыл,
           пас_вид_код,
           пас_номер,
           пас_дата,
          пас_дата_по,
           пас_выдан,
           адр_страна_код,
           адр_город,
           адрес,
           телефон,
           е_маил,
           авто_марка,
           авто_номер,
           инф_кли,
           виза_вид_код,
           виза_сер,
           виза_номер,
           виза_дата_с,
           виза_дата_по,
           страх_стр_код,
           страх_кем_код,
           страх_номер,
           страх_дата_с,
           страх_дата_по,
           миг_карта,
           миг_карта_дата_с,
           миг_карта_дата_по,
           скид_карта,
           скид_проц,
           гра_дата,
           гра_код,
           фам_лат,
           имя_лат,
           отч_лат
       
    FROM   кли
    WHERE  ( кли_код = @кли_код )
GO