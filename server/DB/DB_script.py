###
# PLEASE RUN THE BELOW CODE IF YOU NEVER RUN THIS SCRIPT IN YOUR LOCAL OR DELETE THE DB
# 
#
# ###

import mysql.connector

import datetime, time
import names
import random as rnd





def run_sql_file(filename, connection): 
    ''' 
    The function takes a filename and a connection as input 
    and will run the SQL query on the given connection   
    ''' 
    start = time.time() 
     
    file = open(filename, 'r') 
    sql = s = " ".join(file.readlines()) 
    print ("Start executing: " + filename + " at " + str(datetime.datetime.now().strftime("%Y-%m-%d %H:%M")) + "\n" + sql)
    cursor = connection.cursor() 
    cursor.execute(sql)     
     
    end = time.time() 
    print ("Time elapsed to run the query:")
    print (str((end - start)*1000) + ' ms')


def fill_randomly(connection):
    #Disabling foreign key constraints temporarily
    foreing_constraint="SET foreign_key_checks = 0;\n"
    cursor=connection.cursor()
    cursor.execute(foreing_constraint)
    start = time.time() 

    ##Insert  randomly 20 new departments
    sql = "INSERT INTO MDEBIS.student (Student_Id, Password,Name,Surname,Year,GPA,Department_Id,Mail,Course_Ids) VALUES (%s, %s,%s,%s,%s,%s,%s,%s,%s)"
    ids=[]
    for i in range(75000):
        if i%750==0:
            print("%"+str((i/75000)*100)+" completed")
        password=rnd.randint(100000,999999)
        dep_id=rnd.randint(1,17)
        id1=str(rnd.randint(2016,2022))
        id2=str(500+dep_id)
        id3=str(rnd.randint(100,999))
        id=id1+id2+id3
        while id in ids:
            dep_id=rnd.randint(1,17)
            id1=str(rnd.randint(2016,2022))
            id2=str(500+dep_id)
            id3=str(rnd.randint(100,999))
            id=id1+id2+id3
        name=names.get_first_name()
        surname=names.get_last_name()
        year=2023-int(id1)
        gpa=rnd.random()*4
        mail=name.lower()+"."+surname.lower()+"@ogr.deu.edu.tr"
        courses=""
        for i in range(4*year):
            new_course=str((rnd.randint(1,35))+(35*(dep_id-1)))
            while new_course in courses.split(";"):
                new_course=str((rnd.randint(1,35))+(35*(dep_id-1)))
                
            courses+=new_course+";"

        val = (id,password,name,surname,year,gpa,dep_id,mail,courses)
        cursor.execute(sql, val)
        connection.commit()
        ids.append(id)
    end = time.time() 
    print ("Time elapsed to run the query:")
    print (str((end - start)*1000) + ' ms')

def fill_course_has_student(connection):
    start = time.time() 
    mycursor = connection.cursor()

    mycursor.execute("SELECT * FROM student")

    myresult = mycursor.fetchall()
    for student in myresult:
        student_id=student[0]
        student_courses=student[7].split(";")
        situtations=["Passed","Current","Failed"]
        grades=["AA","BA","BB","CB","CC","DC","DD","FD","FF"]
        sql = "INSERT INTO MDEBIS.course_has_student (Course_Id,Student_Id,Situtation,Non_Attendance,Grade) VALUES (%s, %s,%s,%s,%s)"
        for course_id in student_courses:
            if course_id=='':
                continue
            situtation=situtations[rnd.randint(0,2)]
            grade="0"
            if situtation=="Passed":
                grade=grades[rnd.randint(0,8)]
            val = (int(course_id),int(student_id),situtation,0,grade)
            mycursor.execute(sql, val)
        connection.commit()

    end = time.time() 
    print ("Time elapsed to run the query:")
    print (str((end - start)*1000) + ' ms')


def add_lecturers(connection):
    #Disabling foreign key constraints temporarily
    foreing_constraint="SET foreign_key_checks = 0;\n"
    cursor=connection.cursor()
    cursor.execute(foreing_constraint)
    start = time.time() 

    ##Insert  randomly 20 new departments
    sql = "INSERT INTO MDEBIS.lecturer (Lecturer_Id, Password,Name,Surname,Mail,Department_Id,Title) VALUES (%s, %s,%s,%s,%s,%s,%s)"
    titles=["Assoc. Prof. Dr.","Prof. Dr.","Dr.","Lecturer","Research Assistant","Asst. Prof. Dr."]
    for i in range(400):
        name=names.get_first_name()
        surname=names.get_last_name()
        password=str(rnd.randint(100000,999999))

        dep_id=rnd.randint(1,17)
        id1=str(rnd.randint(2000,2022))
        id2=str(500+dep_id)
        id3=str(rnd.randint(100,999))
        id=id1+id2+id3
        mail=name.lower()+"."+surname.lower()+"@deu.edu.tr"

        title=titles[rnd.randint(0,5)]

        val = (id,password,name,surname,mail,dep_id,title)
        cursor.execute(sql, val)
        connection.commit()
     
    end = time.time() 
    print ("Time elapsed to run the query:")
    print (str((end - start)*1000) + ' ms')

def add_course(connection):

    

    #Disabling foreign key constraints temporarily
    foreing_constraint="SET foreign_key_checks = 0;\n"
    cursor=connection.cursor()
    cursor.execute(foreing_constraint)
    start = time.time() 

    sql = "INSERT INTO MDEBIS.course (Course_Id,Name,Departmend_Ids,Attandence_Limit,Days,Hours,Credit) VALUES (%s, %s,%s,%s,%s,%s,%s)"
    given_days=""
    given_hours=""
    for i in range(1,596):
        id=i
        print(i)
        name="Course Name"
        attandence=rnd.randint(-1,4) #-1 indicates free of attendence
        days=""
        hours=""
        #find a unique day hours pair
        found=True
        while(found):
            day1=rnd.randint(1,5)
            day2=rnd.randint(1,5)
            days=str(day1)+";"+str(day2)
            hour1=rnd.randint(1,8)
            hour2=rnd.randint(1,8)

            hours=str(hour1)+";"+str(hour2)
            splitted_given_days=given_days.split("|")
            splitted_given_hours=given_hours.split("|")
            for day in splitted_given_days:
                if days==day:
                    continue
            
            for hour in splitted_given_hours:
                if hours==hours:
                    continue

            break

        dep_id=int(id/35)+1

        if id%35==0:
            dep_id=dep_id-1

        credit=rnd.randint(0,4)
        val = (id,name,dep_id,attandence,days,hours,credit)
        cursor.execute(sql, val)
        given_days=given_days+days+"|"
        given_hours=given_hours+hours+"|"
        if id%35==0:
            given_days=""
            given_hours=""
        connection.commit()
        id=id+1
     
    end = time.time() 
    print ("Time elapsed to run the query:")
    print (str((end - start)*1000) + ' ms')

def fill_course_has_lecturers(connection):
    start = time.time() 
    cursor = connection.cursor()
    lecturers_dict={}
    cursor.execute("SELECT * FROM lecturer")
    for i in range(1,18):
        lecturers_dict[i]=[]

    myresult = cursor.fetchall()
    for row in myresult:
        lecturer_id=row[0]
        dep_id=row[5]
        list_old=lecturers_dict[dep_id]
        list_old.append(lecturer_id)
        lecturers_dict[dep_id]=list_old


    cursor.execute("SELECT * FROM course")
    myresult = cursor.fetchall()
    for row in myresult:
        course_id=int(row[0])
        dep_id=int(row[2])
        lecturer_ids=[]
        for i in range(rnd.randint(1,4)):
            lec_ids=lecturers_dict[dep_id]
            chosen_lec_id=lec_ids[rnd.randint(0,len(lec_ids)-1)]
            while chosen_lec_id in lecturer_ids:
                chosen_lec_id=lec_ids[rnd.randint(0,len(lec_ids)-1)]

            lecturer_ids.append(chosen_lec_id)
            
        sql = "INSERT INTO MDEBIS.course_has_lecturer (Course_Course_Id,Lecturer_Lecturer_Id) VALUES (%s, %s)"
        val = (int(course_id),int(chosen_lec_id))
        cursor.execute(sql, val)
        connection.commit()

def add_course_credits(connection):
    cursor=connection.cursor()
    cursor.execute("SELECT * FROM course")
    myresult = cursor.fetchall()

    credits=[rnd.randint(1,8) for x in range(170)]




def main():
    mydb = mysql.connector.connect(
        host="localhost",
        user="root",
        password="354152",
        database='MDEBIS')
    cursor = mydb.cursor()
    cursor.execute("select * from MDEBIS.student")
    myresult=cursor.fetchall()
    for row in myresult:
        student_id=row[0]
        passw=rnd.randint(100000,999999)
        cursor.execute("UPDATE MDEBIS.student SET Password=%s where student.Student_Id=%s",[passw,student_id])
        mydb.commit()
    #run_sql_file("C:\\Users\\emirc\\Desktop\\CENG\\DB\\term_project\\Modern-Dokuz--Eylul-Bilgi-Isletim-Sistemi-MDEBIS-\\server\\DB\\DB_initial_script.sql",mydb)
    #fill_randomly(mydb)
    #add_lecturers(mydb)
    #add_course(mydb)
    #fill_course_has_student(mydb)
    #fill_course_has_lecturers(mydb)
if __name__ == "__main__": 
    main() 