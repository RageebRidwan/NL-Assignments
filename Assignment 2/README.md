৩. Primary Key এবং Foreign Key কী?
উত্তর: Primary Key হলো ডাটাবেস টেবিলের এমন একটি কলাম বা একাধিক কলামের সমষ্টি যা সেই টেবিলের প্রত্যেকটা রেকর্ড বা row কে ইউনিকভাবে চিহ্নিত করতে পারে। সাধারণত Primary Key প্রতি টেবিলে একটা করে থাকে এবং কখনো  NULL হতে পারে না ।
অপরদিকে Foreign Key হলো এমন একটি কলাম যা অন্য টেবিল এর Primary Key বা Unique Key এর রেফারেন্স হিসেবে একটি টেবিলে ব্যবহৃত হয় এবং টেবিলগুলোর মাঝে সম্পর্ক বা relational integrity স্থাপন করে। নিচে Primary Key এবং Foreign Key এর উদাহরণ SQL কোড এর সাহায্যে দেওয়া হলো:
create table departments (
  dept_id serial primary key,
  dept_name varchar(50)
);

create table employees (
  emp_id serial primary key,
  emp_name varchar(100),
  dept_id integer,
  foreign key (dept_id) references departments(dept_id)
);
এখানে, employees টেবিলের dept_id হলো Foreign Key যা departments টেবিলের dept_id কে রেফার করে।

৪. VARCHAR ও CHAR ডেটা টাইপের মধ্যে পার্থক্য কী?
উত্তর: VARCHAR(n) হলো ভ্যারিয়েবল ধৈর্ঘ্যের স্ট্রিং টাইপ যেখানে একটা স্ট্রিং ভ্যালু/ ডাটা  store করলে তা সেই ডাটার দৈর্ঘ্য যতটুকু হবে ততটুকু জায়গাই নিবে এবং এক্সট্রা প্যাডিং বা space অ্যাড করবে না। অবশ্য সর্বোচ্চ n ধৈর্ঘ্যের বেশি জায়গা ডাটা নিতে পারবে না। 

CHAR(n) হলো ফিক্সড ধৈর্ঘ্যের স্ট্রিং টাইপ যেখানে ডাটার ধৈর্ঘ্য যদি n এর চেয়ে কম হয়ে থাকে বাকি জায়গা padding / স্পেস দিয়ে পূরণ হয়ে যায়। 
নিচে VARCHAR ও CHAR এর উদাহরণ SQL কোড এর সাহায্যে দেওয়া হলো:
create table example (
  name_v varchar(10),
  name_c char(10)
);

insert into example values ('Rageeb', 'Rageeb');
name_v এ Rageeb হবে 6 ক্যারেক্টার, আর name_c হবে 10 ক্যারেক্টার (6 + 4 স্পেস)।

৫. WHERE ক্লজের উদ্দেশ্য কী?
উত্তর: WHERE ক্লজ ব্যবহার করা হয় SELECT, UPDATE, DELETE কুয়েরিতে বিভিন্ন শর্ত সাপেক্ষে ডাটাবেস থেকে নির্দিষ্ট ডাটা / রেকর্ড  filter করতে। নির্দিষ্ট মান অনুসারেও WHERE ক্লজ দিয়ে ডাটা নির্বাচন করা সম্ভব। 
নিচে WHERE ক্লজের উদাহরণ SQL কোড এর সাহায্যে দেওয়া হলো:
select * from employees
where dept_id = 5 and emp_name like 'A%';
এখানে শুধু সেই কর্মচারীদের তথ্য আসবে যাদের ডিপার্টমেন্ট আইডি ৫ এবং নাম ‘A’ দিয়ে শুরু।

৬. limit এবং offset ক্লজ কেন ব্যবহার করা হয়?
উত্তর: limit এবং offset ব্যবহার করা হয় ডাটাবেস টেবিল থেকে নির্দিষ্ট সংখ্যক রেকর্ড রিটার্ন করানোর জন্য। pagination যা বড় ডাটাবেসের ক্ষেত্রে ধাপে ধাপে ডাটা দেখানোর জন্য ব্যবহৃত হয় সেখানে সাধারণত limit এবং offset ব্যবহৃত হয়। 
নিচে limit এবং offset ক্লজের উদাহরণ SQL কোড এর সাহায্যে দেওয়া হলো:
select * from employees
order by emp_id
limit 10 offset 20;
এই কুয়েরি প্রথম ২০টা row বাদ দিয়ে পরবর্তী ১০টি row দেখাবে — অর্থাৎ 21 থেকে 30 পর্যন্ত।

৭. update statement দিয়ে ডেটা কীভাবে পরিবর্তন করা যায়?
উত্তর: update স্টেটমেন্ট ব্যবহার করে একটি টেবিলের existing রেকর্ড পরিবর্তন করা হয়ে থাকে। শুধুমাত্র নির্দিষ্ট রো-ই যেন আপডেট হয় একটা ডাটাবেস টেবিল থেকে সেজন্য where ক্লজও ব্যবহৃত হয়ে থাকে এই স্টেটমেন্টের সাথে। 
নিচে update স্টেটমেন্টের উদাহরণ SQL কোড এর সাহায্যে দেওয়া হলো:
update employees
set emp_name = 'rakib ahmed', dept_id = 3
where emp_id = 5;
এখানে emp_id যেটি ৫, শুধু সেই এমপ্লয়ির নাম এবং ডিপার্টমেন্ট আইডি পরিবর্তন হবে।
