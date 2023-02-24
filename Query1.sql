--TSql Yorum sat�r� "--" ile olu�turulur.

--B�y�k, K���k harf duyarl�l��� yoktur. 

/*
SQL sorgular�nda baz� durumlarda elde etmek istedi�imiz veriler i�in b�y�k / k���k harf duyarl�l���n� kontrol etmemiz gerekebiliyor.
Bu durumu SQL'in BINARY komutunu kullanarak kolayca halledebiliyoruz. 

*/

USE Northwind -- hangi veritaban�nda �al��aca��m�z� g�steririr.

--SELCET KOMUTU
Select * from Personeller

Select MusteriAdi from Musteriler

--Bo�luk karakteri olan tabloyu sorgulama
Select * from [Satis Detaylari]

--Kolonlar� Birle�tirme
Select Adi+' '+SoyAdi [Personel Bilgisi] from Personeller

--Farkl� t�rde olan kolonlar� birle�tirme
select Adi+' '+ Convert(nvarchar, PersonelID) [Personel Bilgisi] from Personeller
select Adi+' '+ Cast(PersonelID as nvarchar ) [Personel Bilgisi] from Personeller

--WHERE KOMUTU
select * from Personeller where adi='Anne'

/*

<> E�it De�ilse
=  E�itse
<= K���k E�itse
>= B�y�k E�itse

*/

--BETWEEN KOMUTU
Select IseBaslamaTarihi from Personeller where YEAR(IseBaslamaTarihi) between 1992 and 1995

--IN KOMUTU
Select * from Personeller where Sehir In('London', 'Redmond') --or g�revi g�r�r virg�ller

--LIKE SORGULARI
/*

	%		(Genel �nemli De�il) Operat�r�
	_		(�zel �nemli De�il) Operat�r�
	[]		(ya da) Operat�ru 
	[*-*]	(Alfabetik Aras�nda) Operat�ru
	[^*]	(De�il) Operator�

*/

--�sminin ba� harfi j olan personeller
select * from Personeller where Adi LIKE 'j%'

--�sminin son harfi y olan personeller
select * from Personeller where adi LIKE '%y'

--�sminin son �� harfi ert olan personeller
select * from Personeller where adi LIKE '%ert'

--�sminin ilk harfi r, son harfi t olan personeller
select * from Personeller where adi LIKE 'r%t'

--�sminde an ge�en personeller
select * from Personeller where Adi LIKE '%an%'

--�sminin ba� harfi n olan ve i�erisinde an ge�en personeller
select * from Personeller where Adi LIKE 'n%an%'

--�sminin ilk harfi a, ikinci harfi fark etmez ve ���nc� harfi d olan personeller
select * from Personeller where adi LIKE 'm_c%'

--�sminin ilk harfi m, ikinci-���nc�-d�rd�nc� fark etmez ve be�inci harfi a olan personeller
select  * from Personeller where adi LIKE 'm___a%'

--�sminin ilk harfi n ya da r olan personeller
select * from Personeller where adi LIKE '[nr]%'

--�sminin i�erisinde a ya da i ge�en personeller
select * from Personeller where adi LIKE '%[ai]%'

--�sminin ba� harfi a ile k aras�nda alfabetik s�raya g�re herhangi bir harf olan personeller
select * from Personeller where adi LIKE '[a-k]%'

--�sminin ba� harfi a olmayan personeller
select * from Personeller where adi LIKE '[^a]%'

--�sminin ba� harfi an olmayan personeller
select * from personeller where adi LIKE '[^an]%'

--isminin ilk harfinde n veya m olmayan ikinci harfi a olan son harfi et olan personeller
select * from Personeller where adi LIKE '[^nm]a%et'


--LIKE SORGULARINDA ESCAPE(KA�I�) KARAKTERLER�
