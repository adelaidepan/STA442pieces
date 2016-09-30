sat = read.table("http://www.utstat.toronto.edu/~brunner/data/legal/openSAT.data.txt")

#calculate the difference
sat$diff <- sat$VERBAL - sat$MATH

#check the mean of difference
mean(sat$VERBAL)-mean(sat$MATH)

boxplot(sat$diff)
qqnorm(sat$diff)
qqline(sat$diff)
shapiro.test(sat$diff)

#do a paired t-test
t.test(sat$VERBAL, sat$MATH, mu=0, paired = T, alternative = "two.sided")

#do a glm
glm(GPA ~ VERBAL*MATH, data = sat)
