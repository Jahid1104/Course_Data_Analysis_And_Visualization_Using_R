
####  R Codes by Md Jahid Hasan Jone
#### Data Structures

###1.	Vector (ordered collection of same data type)
X = c(1, 3, 5, 7, 8)
print(X)


###2.	List (can be various type data, can even hold other data structures)
Id = c(1, 2, 3, 4)
Name = c("A", "B", "C", "D")
number = 4
ABC = list(Id, Name, number)
print(ABC)
View(ABC)

###3.	dataframe (as tabale, can hold various type of data)
Name = c("A", "B", "C")
Language = c("Bangla", "English", "Arabic")
Age = c(20, 25, 15)
df = data.frame(Name, Language, Age)
print(df)

View(df)


###4.	Matrix (single type data, 2D structure)
A = matrix (
        c(1, 2, 3, 4, 5, 6, 7, 8, 9), 
        nrow = 3, ncol = 3, 	 
        byrow = T		# By default matrices are in column-wise order 
)
print(A)
View(A)

###5.	Array (single type data, 3D structure)
A = array(
        c(1, 2, 3, 4, 5, 6, 7, 8),
        dim = c(2, 2, 2)					 
)
print(A)


###6.	Factors (character type, groups)
fac = factor(c("Male", "Female", "Male",
               "Male", "Female", "Male", "Female"))
print(fac)



# Data frame formation

ID <- c(1:5)
Name <-c ("A","B","C","D","E")
Date_of_Birth <- as.Date (c("1999-12-16","1999-12-16","1999-12-16","1999-12-16","1999-12-16"))

df<-data.frame(ID,Name,Date_of_Birth)
df
Student_data <- df

View(Student_data)










library("writexl")
library(writexl)

write_xlsx(Student_data,"Student_data.xlsx")
Student_data

#Data frame import

library(readxl)

library(readxl)
Student_date <- read_excel("Student_date.xlsx")# copy the code from import promt
View(Student_date)