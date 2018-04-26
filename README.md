# plot_matrix_in_R
plot matrix in R

Arguments:
mat: a matrix
value.min: the lower bound of matrix elements, default min(mat)
value.max: the upper bound of matrix elements, default max(mat)
color.min: the color of lower bound, default "white"
color.max: the color of upper bound, default "black"

Examples:
plot.matrix(matrix(1:20,4,5))
plot.matrix(matrix(1:20,4,5),color.min="orange",color.max="brown")
plot.matrix(matrix(1:20,4,5),value.min=0,value.max=20)
