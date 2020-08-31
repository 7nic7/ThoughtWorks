
create table student_stat (
-- TODO:
name varchar(5),
teacher varchar(5),
subject varchar(4),
avg_score float(3,1),
score float(3,1),
total_score float(5,1),
score_rate float(4,1)
)

create procedure calc_student_stat
-- TODO:

BEGIN

TRUNCATE TABLE student_stat;

INSERT INTO student_stat 
(name,
teacher,
subject,
score,
avg_score,
total_score,
score_rate)
	select t1.name,
		   t1.teacher,
		   t1.subject,
		   t1.score,
		   t2.avg_score,
		   t3.total_score,
		   t1.score / t3.total_score as score_rate
      		from(select b.name,
	               		c.teacher,
	               		c.subject,
	              		a.student_id,
                        a.subject_id,
	               		a.score
				from score a
				left join student b on a.student_id = b.id
				left join subject c on a.subject_id = c.id) t1
	  		left join (select subject_id,
		           			  avg(score) as avg_score
		           		from score
                        group by subject_id) t2 on t1.subject_id = t2.subject_id
	  		left join (select student_id,
		            		  sum(score) as total_score
						from score
		 				group by student_id) t3 on t1.student_id = t3.student_id;
END;;