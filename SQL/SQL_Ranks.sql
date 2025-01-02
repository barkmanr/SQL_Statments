--using ranks
use section7

SELECT * from item
SELECT i_id, i_name, i_manufactureyear,i_cost,sum(i_cost) over (PARTITION by i_manufactureyear) as 'Total anual cost' from item
SELECT i_class,i_cost,avg(i_cost) over (PARTITION by i_class) as 'average cost', i_cost-avg(i_cost) over (PARTITION by i_class) as 'deviation from average cost' from item
select i_class,i_cost,i_price, DENSE_RANK() over (order by i_price Desc) as 'Rank' from item
select i_class,i_cost,i_price, DENSE_RANK() over (Partition by i_class order by i_price Desc) as 'Rank' from item
SELECT i_class,avg(i_price),DENSE_RANK() over (order by avg(i_price) Desc) as 'rank' from item group by i_class

drop table ranks
create table ranks(i_name VARCHAR(1), i_cost DECIMAL(5,2), ranking int)
insert into ranks SELECT i_name, i_cost, DENSE_RANK() over (order by i_cost desc) from item
select * from ranks where ranking = 2