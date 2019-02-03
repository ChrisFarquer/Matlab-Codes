%EE 3533 Example: Numerical Integration 
Q1 = quad(@myfun,0,2)
Q2 = quad(@(x)myfun2(x,5),0,2)