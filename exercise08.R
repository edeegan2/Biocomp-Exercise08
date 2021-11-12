###Exercise8
rm(list=ls())

###Question1

#reading in table
score <- read.table("UWvMsu_1-22-13.txt", header=TRUE)
#creating empty matrix
scoresmatrix <- matrix(ncol=2,nrow=50, dimnames = list(c(1:50), c("UW", "MSU")))

#for loop to add up score
for (i in 1:nrow(score)){
  if(score[i,2]=="UW"){
    if(i>1){
      scoresmatrix[i,1]=score[i,3]+scoresmatrix[(i-1),1]
      scoresmatrix[i,2]=scoresmatrix[(i-1),2]
    }else{
      scoresmatrix[i,1]=score[i,3]+0
      scoresmatrix[i,2]=0
    }
    
  }else{
    if(i>1){
      scoresmatrix[i,2]=score[i,3]+scoresmatrix[(i-1),2]
      scoresmatrix[i,1]=scoresmatrix[(i-1),1]
    }else{
      scoresmatrix[i,2]=score[i,3]+0
      scoresmatrix[i,1]=0
    }
    
  }
}

#plotting scores over time
graph <- plot(x=score[,1], y=scoresmatrix[,1], type = 'l')
graph <- lines(x=score[,1],y=scoresmatrix[,2])
#displaying graph
graph


###Question2


#printing intro statement and generating a random number
print("I'm thiking of a number 1-100...")
x <- as.numeric(sample(x=1:100,size=1))

#for loop for game, using if else statement for if guess is higher or lower than guess
for(i in 1:10){
  guess <- readline(prompt="Guess")
  if(x==guess){
    print("Correct!")
    break
  }else{
    if(x>guess){
      print("Higher")
      print(10-i)
    }else{
      print("Lower")
      print(10-i)
    }
  }
}





