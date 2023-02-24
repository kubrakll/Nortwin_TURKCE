--TSql Yorum satýrý "--" ile oluþturulur.

--Büyük, Küçük harf duyarlýlýðý yoktur. 

/*
SQL sorgularýnda bazý durumlarda elde etmek istediðimiz veriler için büyük / küçük harf duyarlýlýðýný kontrol etmemiz gerekebiliyor.
Bu durumu SQL'in BINARY komutunu kullanarak kolayca halledebiliyoruz. 

*/

USE Northwind -- hangi veritabanýnda çalýþacaðýmýzý gösteririr.

--SELCET KOMUTU
Select * from Personeller

Select MusteriAdi from Musteriler

--Boþluk karakteri olan tabloyu sorgulama
Select * from [Satis Detaylari]

--Kolonlarý Birleþtirme
Select Adi+' '+SoyAdi [Personel Bilgisi] from Personeller

--Farklý türde olan kolonlarý birleþtirme
select Adi+' '+ Convert(nvarchar, PersonelID) [Personel Bilgisi] from Personeller
select Adi+' '+ Cast(PersonelID as nvarchar ) [Personel Bilgisi] from Personeller

--WHERE KOMUTU
select * from Personeller where adi='Anne'

/*

<> Eþit Deðilse
=  Eþitse
<= Küçük Eþitse
>= Büyük Eþitse

*/

--BETWEEN KOMUTU
Select IseBaslamaTarihi from Personeller where YEAR(IseBaslamaTarihi) between 1992 and 1995

--IN KOMUTU
Select * from Personeller where Sehir In('London', 'Redmond') --or görevi görür virgüller

--LIKE SORGULARI
/*

	%		(Genel Önemli Deðil) Operatörü
	_		(Özel Önemli Deðil) Operatörü
	[]		(ya da) Operatöru 
	[*-*]	(Alfabetik Arasýnda) Operatöru
	[^*]	(Deðil) Operatorü

*/

--Ýsminin baþ harfi j olan personeller
select * from Personeller where Adi LIKE 'j%'

--Ýsminin son harfi y olan personeller
select * from Personeller where adi LIKE '%y'

--Ýsminin son üç harfi ert olan personeller
select * from Personeller where adi LIKE '%ert'

--Ýsminin ilk harfi r, son harfi t olan personeller
select * from Personeller where adi LIKE 'r%t'

--Ýsminde an geçen personeller
select * from Personeller where Adi LIKE '%an%'

--Ýsminin baþ harfi n olan ve içerisinde an geçen personeller
select * from Personeller where Adi LIKE 'n%an%'

--Ýsminin ilk harfi a, ikinci harfi fark etmez ve üçüncü harfi d olan personeller
select * from Personeller where adi LIKE 'm_c%'

--Ýsminin ilk harfi m, ikinci-üçüncü-dördüncü fark etmez ve beþinci harfi a olan personeller
select  * from Personeller where adi LIKE 'm___a%'

--Ýsminin ilk harfi n ya da r olan personeller
select * from Personeller where adi LIKE '[nr]%'

--Ýsminin içerisinde a ya da i geçen personeller
select * from Personeller where adi LIKE '%[ai]%'

--Ýsminin baþ harfi a ile k arasýnda alfabetik sýraya göre herhangi bir harf olan personeller
select * from Personeller where adi LIKE '[a-k]%'

--Ýsminin baþ harfi a olmayan personeller
select * from Personeller where adi LIKE '[^a]%'

--Ýsminin baþ harfi an olmayan personeller
select * from personeller where adi LIKE '[^an]%'

--isminin ilk harfinde n veya m olmayan ikinci harfi a olan son harfi et olan personeller
select * from Personeller where adi LIKE '[^nm]a%et'


--LIKE SORGULARINDA ESCAPE(KAÇIÞ) KARAKTERLERÝ
