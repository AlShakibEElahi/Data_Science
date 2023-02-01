#making data-frames
grades <- data.frame(names = c("Elahi","Shakib","Rion"),
                     mid = c(89,90,91),
                     final = c(91,92,93))
grades
class(grades$names) #if data-type = factor? use stringAsFactors = FALSE
