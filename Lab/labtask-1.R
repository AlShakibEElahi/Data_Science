x <- readline(prompt = "Enter a number: ")
y <- as.integer(x)
class(y)
  
if(y%%2==0){
  print("Number is even")
}else{
  print("Number is odd")
}
