--Çalıştırmak istediğin satırı seç ve Execute butonuna tıkla 
--Caseİnsenstive 

--Select * from Customers

--Select ContactName,CompanyName,City from Customers
--Üstteki komutun kullanım şekli şöyle;
--bellekte fake bir tablo oluşturuyor, bize çıktı olarak o tabloyu sunuyor

--Allians kullanım şekli denir
--Select ContactName Adi,CompanyName SirketAdi,City Sehir from Customers

--Select * from Customers where City = 'London'

select * from Products where CategoryID = 1 or CategoryID = 3
-- <> farklı demek 
select * from Products where CategoryID = 1 or UnitPrice >=10

select * from Products order by UnitPrice
select * from Products order by UnitPrice asc -- assenging = artan demek , yazılması zorunlu değildir, default olarak gelir

select * from Products where CategoryID = 1 order by UnitPrice desc -- dessending = düşen 

-- yukarıda yapılan işlemler e ticaret sistemindeki sıralam işlerimlerinin kod hali

select count(*) from Products -- product tablosunda kaç data olduğunu söyler/ katalogda kaç ürün olduğunnu gösterir

select count(*) from Products where CategoryID = 2 -- id = 2 olan kaç ürün olduğunu sorgular

select CategoryID from products group by CategoryID 
-- hangi kategoride kaç farklı ürünümüz olduğunun sorgulamak için kulanılır
-- secilen colon gruplanacak kolon olmalıdır, aksi halde kod çalışmaz
--yukarıdaki işlemin çalışma mantığı şudur;
-- oluşturulan grupları fake bir tablo içinde topluyoruz
-- bu durumda bu tablo üstünde işlem yapabiliriz. Yanii;

select CategoryID,count(*) from Products group by CategoryID having count(*) < 20
-- içerisinde 20 da az ürün bulunduran kategorileri gösterir
-- önce 

select CategoryID,count(*) from Products where UnitPrice>20 group by CategoryID having count(*) < 10
-- içerisinde 10 da az ürün bulunduran kategorileri gösterir
-- önce where sorgusunu gerçekleştirir - yani önce veri filtrelenir
-- category id ye göre grupla ve 10 dan az olnaları listele

-- şu an yazdığımız kod son kullanıcı açısından kullanışlı değil sebebi is;
-- listelediğimiz kategoriler id leriyle listelenirler 
-- bu durumu şu şekilde düzeltebiliriz, kategorinin gösterdiği id den kategori ismini çekeriz
-- bu tabloları join'leriz yani birleştiririz

select * 
from products inner join Categories
on Products.categoryid = Categories.CategoryId-- on = durumunda, şartında demek

select Products.ProductID, Products.ProductName, Products.UnitPrice,Categories.CategoryName
from products inner join Categories
on Products.categoryid = Categories.CategoryId
where Products.UnitPrice >10 -- Ürünlerden fiyatı 10dan büyükk olanlar için 
-- kategorilerle join et ve tabloyu bana getir
-- bu yazdığımız kodları c#la ilişkilendireceğiz / DTO - Data Transformation Object

-- inner join iki tabloda da eşleşen elemanları bir araya getirir,
-- eşleşmeyen datayı getirmez
-- NOT! inner join kullanırken * işaretini kullanmaya özen göster
-- ALlians kullanacağım
select * from Products p inner join [Order Details] od
on p.ProductID = od.ProductID -- inner join sadece eşleşen kayıtları getirir

select * from Products p inner join [Order Details] od
on p.ProductID = od.ProductID -- satışı yapılmayan ürünleri de görmek istersek kullanabiliriz


-- left join dediğimizde solda olup sağda olmayanları da getir deme
-- istek : sisteme kayıt olmuş ancak hiç sipariş alamayanalrı listele
select * from Customers c left join Orders o
on c.CustomerID = o.CustomerID 
where o.CustomerID is null -- null kontrolünü primary key e uyguladık çünkü null olamaz 

-- ana tablo genelde sola yazıldığı için right joinin kullanımı pek mantıklı değildir
-- ancak ana tablo sağa yazıldığı durumlarda kuulanılması makul olur

select * from Products p inner join [Order Details] od
on p.ProductID = od.ProductID
inner join Orders o
on  o.OrderID = od.OrderId
-- bir nileşen dahaeklemek istiyorsan devamına bir inner join daha eklersin