select * from car_purchasing_data;


-- find the unique gender to the data you have

select distinct(gender) from car_purchasing_data;

-- find the unique age to the data you have

select count(distinct(Age)), age from car_purchasing_data
group by age;



-- find the unique country to the data you have

select Country from car_purchasing_data
group by Country;

-- find the unique salary to the data you have

select Annual_Salary from car_purchasing_data
group by Annual_Salary;

-- find the unique customer name to the data you have

select Customer_Name from car_purchasing_data
group by Customer_Name;

-- find the total amount of annual_salary to the data you have

select sum(Annual_Salary) from car_purchasing_data;

-- find the total amount which that one debit the credit card

select sum(Credit_Card_Debt) from car_purchasing_data;

-- find the total Revenue debited to the credit card

select sum(Credit_Card_Debt)/1.18 as total_revenue_debit_card from car_purchasing_data;

-- find the total and revenue of puchase amount

select sum(Car_Purchase_Amount) as total_amt_of_car_pur, sum(Car_Purchase_Amount)/1.18 as total_revenue_purchase_amt from car_purchasing_data;

-- find the total  of net_worth 
select sum(Net_Worth) from car_purchasing_data;

-- find the  to 10 largest car purchase amount with customer name
select Customer_Name ,max(Car_Purchase_Amount) as largest_am from car_purchasing_data
group by Customer_Name
order by largest_am desc
limit 10;

-- find the to 5 customer name who debit the largest amount to the credit card
select Customer_Name , max(Credit_Card_Debt) as largest_am_debit from car_purchasing_data
group by Customer_Name
order by largest_am_debit desc
limit 5;



-- find the customer rank Credit_Card_Debt
select Customer_Name,Credit_Card_Debt,
rank() over (partition by Customer_Name order by Credit_Card_Debt ) as customer_rank
from car_purchasing_data;

-- find the customer rank behalf on Car_Purchase_Amount

select Customer_Name,Car_Purchase_Amount,
rank() over (partition by Car_Purchase_Amount ) customer_rank
from car_purchasing_data;

-- find max,min,avg amount debit to Credit_Card
select max(Credit_Card_Debt),min(Credit_Card_Debt) , avg(Credit_Card_Debt) from car_purchasing_data;

-- find the how many transcation has been done by credidt_card with customer name

select Customer_Name, count(Credit_Card_Debt) from car_purchasing_data
group by Customer_Name;

-- find the customer name who purchase car avg of  greterteh or equll , avg of Credit_Card_Debt
select Customer_Name , Car_Purchase_Amount from car_purchasing_data
where Car_Purchase_Amount >= (select avg(Credit_Card_Debt) from car_purchasing_data
);

-- find the Customer_Name who debit  Credit_Card_amount avg of Car_Purchase_Amount

select Customer_Name,Credit_Card_Debt from car_purchasing_data
where Credit_Card_Debt >= (select avg(Car_Purchase_Amount) from car_purchasing_data) ;



