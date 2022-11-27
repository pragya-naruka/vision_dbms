use vision_schema;

#First
select c.catName,count(p.productID)as  Total_Products_Sold  
from  productcategory  p,orderdetails  o,category c where p.productID = o.prod_Id and p.catID = c.category_id group by catID;

#Second
select c.customerCity, sum(salesQuantity) as Total_Sale 
from sales s, customers c where s.salesZipcode = c.customerZipcode 
group by salesZipcode
order by Total_Sale Desc 
Limit 20;
 
#Third
select p.productName,sum(quantity)as total_quantity 
from orderdetails od, products p where od.prod_Id = p.product_id group by od.prod_Id order by total_quantity desc limit 10;

#Fourth
#Removing the $ sign from column productPrice
Update products 
set productPrice = replace(productPrice,'$','');

select c.customerName,round(sum(od.quantity*p.productPrice),2) as total_money 
from customers c 
inner join orders o on o.customerId = c.cust_id 
inner join orderdetails  od on o.order_id = od.orderID 
inner join products p on od.prod_Id = p.product_id 
group by o.customerId order by total_money desc Limit 5;