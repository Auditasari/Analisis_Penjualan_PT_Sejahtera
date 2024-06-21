---menentukan primary key 

alter table "Customers"
add primary key("CustomerID")

ALTER TABLE "Orders"
ADD PRIMARY KEY ("OrderID"),
ADD FOREIGN KEY ("CustomerID") REFERENCES "Customers" ("CustomerID");

ALTER TABLE "ProductCategory"
ADD PRIMARY KEY ("CategoryID")

ALTER TABLE "Products"
ADD PRIMARY KEY ("ProdNumber")

--Membuat datamaster

create table datamaster as(
select distinct
	o."Date" as order_date,
	pc."CategoryName" as category_name,
	p."ProdName" as product_name,
	p."Price" as product_price,
	o."Quantity" as order_qty,
	o."Quantity" * p."Price" as total_sales,
	c."CustomerEmail" as cust_email,
	c."CustomerCity" as cust_city
From "Orders" as o
join "Customers" as c
on o."CustomerID" = c."CustomerID"
join "Products" as p
on o."ProdNumber" = p."ProdNumber"
join "ProductCategory" as pc
on p."Category" = pc."CategoryID"
order by order_date 
);



