# 1.查询同时存在1课程和2课程的情况

# 2.查询同时存在1课程和2课程的情况

# 3.查询平均成绩大于等于60分的同学的学生编号和学生姓名和平均成绩
select * from(
select 
t1.id,
t1.name,
avg(t2.score) as avg_score
from student t1
left join
student_course t2
on t1.id=t2.studentId
group by t1.id, t1.name
) tt where tt.avg_score>=60;
# 4.查询在student_course表中不存在成绩的学生信息的SQL语句
select t1.* 
from student t1 
left join 
student_course t2
on t1.id=t2.studentId
where t2.studentId is null;
# 5.查询所有有成绩的SQL

# 6.查询学过编号为1并且也学过编号为2的课程的同学的信息
select * from student 
where id in
(select t1.studentId from
(select studentId, count(studentId) as cnt from student_course 
where courseId in (1,2)
group by studentId) t1 where t1.cnt=2);
# 7.检索1课程分数小于60，按分数降序排列的学生信息
select * from student 
where id in (
select studentId from student_course
where courseId=1 and score<60
order by score desc);
# 8.查询每门课程的平均成绩，结果按平均成绩降序排列，平均成绩相同时，按课程编号升序排列
select courseId, avg(score) from student_course
group by courseId
order by avg(score) desc, courseId asc;
# 9.查询课程名称为"数学"，且分数低于60的学生姓名和分数
select 
t1.name, t2.score
from student t1
left join 
student_course t2 on t1.id=t2.studentId
left join 
course t3 on t2.courseId=t3.id 
where t3.name="数学" and t2.score<60;




