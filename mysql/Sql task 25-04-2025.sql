use sql_task;
select * from logins;
select * from users;

/*1.	Monthly Active Users (MAU) – Count of distinct users who logged in during each month over the last 12 months.*/
select min(login_date), max(login_date) from logins;

select date_format(login_date, '%y-%m') as Logged_in_date, count(distinct(l.user_id)) as CountOfUsers from logins l
join users u on l.user_id=u.user_id
where login_date between '2023-01-01' and '2023-12-31'
group by Logged_in_date;

/*2.	1-Month Retention Rate – For each signup month, calculate the percentage of users who signed up in that month and also logged in again in the following month.*/
select date_format(u.signup_date,'%Y-%m') as month, count(distinct u.user_id) as signup_users, count(distinct l.user_id) as retained_users, 
round((count(distinct l.user_id)*100.0/ count(distinct u.user_id)),2) as retention_rate 
from users u
left join logins l
on u.user_id=l.user_id
and extract(year from l.login_date) = extract(year from u.signup_date)
and extract(month from l.login_date) = extract(month from u.signup_date) +1
group by date_format(u.signup_date, '%Y-%m')
order by month;

