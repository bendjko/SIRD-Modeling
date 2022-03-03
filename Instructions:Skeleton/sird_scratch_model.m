% xt+1 = Axt
%set amount of iterations
iter = 1000;

%make the sird values
sird = [1; 0; 0; 0];
s = 1:iter;
i = 1:iter;
r = 1:iter;
d = 1:iter;


%track time
time = 1:iter;
%make the A matrix
A = [0.95 0.04 0 0; 0.05 0.85 0 0; 0 0.1 1 0; 0 0.01 0 1];

%run the model over a period of time
for j = 1:iter
   %keep track of values
    s(j) = sird(1);
    i(j) = sird(2);
    r(j) = sird(3);
    d(j) = sird(4);
    
    %apply the matrix A to sird
    sird = A*sird;
   
    
end

%plot the thing
figure;
plot(time, s);
hold on
plot(time, i);
plot(time, r);
plot(time, d);
xlabel("Time(steps)");
ylabel("Fraction Population");
title("SIRD Model Simulation from 9.3");
legend("S", "I", "R", "D");
