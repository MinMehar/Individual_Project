#determine parameters and decision boundary

here::i_am("code/decision_boundary.R")

SNL_data_1 <-read.csv("orig_data/SNL_Harvard_1.csv", header=TRUE)

require(boot)

SNL_data_1$Risk <- as.numeric(SNL_data_1$Risk)



#Rescaling Features



maximum_1 <- max(SNL_data_1$Patient_Age)

maximum_2 <- max(SNL_data_1$Tumor_Size)



SNL_data_1$Patient_Age_rescale <- SNL_data_1$Patient_Age/maximum_1

SNL_data_1$Tumor_Size_rescale <- SNL_data_1$Tumor_Size/maximum_2



#Define cost function for a given y and hypothesis value



cost = function(y,yhat) {
  
  if(y==1) cost = -log(yhat)
  
  if(y==0) cost = -log(1-yhat)
  
  cost
  
}



#Total cost



J = function(theta0, theta1,theta2, m, x1,x2, y){
  
  ## inv.logit is the sigmoid function in the "boot" package ##
  
  yhat = inv.logit(theta0 + theta1*x1 + theta2*x2)
  
  sum_cost = (1/m)*sum(mapply(FUN=cost,y,yhat))
  
  sum_cost
  
  
  
}





#Defining initial values



x1=SNL_data_1$Patient_Age_rescale



x2=SNL_data_1$Tumor_Size_rescale







y=SNL_data_1$Risk



m=nrow(SNL_data_1)



convg_threshold = .0001



alpha = .01



initial_theta0 = -10

initial_theta1 = 1

initial_theta2 = 1





current_theta0 = initial_theta0

current_theta1 = initial_theta1

current_theta2 = initial_theta2



theta0_values = c(current_theta0) # a vector to store updated theta0 values during iterations

theta1_values = c(current_theta1) # a vector to store updated theta1 values during iterations

theta2_values = c(current_theta2) # a vector to store updated theta1 values during iterations

initial_J = J(initial_theta0, initial_theta1, initial_theta2, m, x1, x2, y)



current_J = initial_J

J_values = c(initial_J) # a vector to store cost function values during iterations







#Define functions to compute the partial derivative terms



dJ0 = function(theta0, theta1, theta2, m, x1,x2, y){
  
  yhat= inv.logit(theta0 + theta1*x1 + theta2*x2)
  
  (1/m)*sum((yhat-y)*1)
  
}





dJ1 = function(theta0, theta1, theta2, m, x1,x2, y){
  
  yhat= inv.logit(theta0 + theta1*x1 + theta2*x2)
  
  (1/m)*sum((yhat-y)*x1)
  
}





dJ2 = function(theta0, theta1, theta2, m, x1,x2, y){
  
  yhat= inv.logit(theta0 + theta1*x1 + theta2*x2)
  
  (1/m)*sum((yhat-y)*x2)
  
}







delta_J = 10 # an arbitrary value to start the algorithm







while (delta_J >.0001) {
  
  new_theta0 = current_theta0 - alpha*dJ0(current_theta0, current_theta1, current_theta2, m, x1, x2, y )
  
  new_theta1 = current_theta1 - alpha*dJ1(current_theta0, current_theta1, current_theta2, m, x1, x2, y )
  
  new_theta2 = current_theta2 - alpha*dJ2(current_theta0, current_theta1, current_theta2, m, x1, x2, y )
  
  new_J = J(new_theta0, new_theta1, new_theta2, m, x1, x2, y)
  
  theta0_values = c(theta0_values, new_theta0)
  
  theta1_values = c(theta1_values, new_theta1)
  
  theta2_values = c(theta2_values, new_theta2)
  
  J_values = c(J_values, new_J)
  
  delta_J = abs(new_J - current_J)
  
  
  
  current_J = new_J
  
  current_theta0 = new_theta0
  
  current_theta1 = new_theta1
  
  current_theta2 = new_theta2
  
  
  
}







print(new_theta0)

print(new_theta1)

print(new_theta2)


#The decision boundary formula is 0 = -5.192761 + 4.728167$x_1$ + 3.662024$x_2$.
