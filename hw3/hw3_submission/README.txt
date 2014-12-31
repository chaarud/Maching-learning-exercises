README
CS189 HW3
02/25/2014
########################################
Sunil Srinivasan		23038238
Chaaru Dingankar		22580441
########################################

Q1:

a:
Run q1/q1a.m to get the results for Problem 1a, with the output being the
least squares losses for d=1 through 10 in addition to a plot of the data
alongside the models for d=1 through 4. The least squares losses are stored
in the array "Least_squares_losses".

b:
Run q1/q1b.m to get the results for Problem 1b, with the predictions and 
prediction errors. The prediction errors for d=3 and 10 are stored in the
array called "errors".


Q2:

Open q2/q2.m, edit the values for "mu" and "sigma", and if subtracting one 
distribution from another, "subtract" (to true), "mu2", and "sigma2", then
run the q2.m script. The script will display the contour map and will prompt
(in Matlab) for a file name to save the plot as.
Edit the bounds of the plot in the "meshgrid" as necessary so that the
contours fit in the plot.

Q3:

Run q3.m, and the script will generate the MLEs and covariance matrices for each
digit class in each test set, as well as the priors. These are only stored for 
the latest test set; to store for a certain test set, restrict the outermost for
loop to only the data set that you want to store parameters for.
It will also calculate the error rates and plot the learning curves for the
two types of model classifications we use.

i:
The mu values for each class for the latest test set are stored in an array 
called "mus". The covariance matrices for each class for the latest test set
are stored in an array called "epsilons".

ii:
The priors for the latest test set are stored in the array called "priors".

iii:
To generate an image, uncomment the two commented lines in the "part iii" 
section of the code. Change the index of epsilons to generate an image for 
a different class.

iv:
The error rates are stored in the array called "a_errors" for part a and
"b_errors" for part b.