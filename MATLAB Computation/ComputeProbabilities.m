% Max number to display
disp_num = 200;

% Create x and y axes
num_students = linspace(1, disp_num, disp_num);
probability_triplets = arrayfun(@calculateProbability, num_students);

stairs(num_students, probability_triplets);
title("Probability of at Least 3 People Sharing a Birthday")
xlabel("Number of People")
ylabel("Probability")


% Function to calculate factorial iteratively.
function stepResult = step_factorial(iterator, threshold)
    if iterator > threshold
        stepResult = 1;
    else
        stepResult = iterator;
    end
end

% Function to calculate power iteratively
function stepResult = step_power(base, iterator, threshold)
    if iterator > threshold
        stepResult = 1;
    else
        stepResult = base;
    end
end

% Calculate a single term of the sum from the closed form formula
function term = calculateTerm(n, k)
    term = 1;
    product = 1;
    for m=1:k
        product = product * nchoosek(n-2*m+2, 2);
    end

    term = term * product;
    for i=1:365
        term = term * (step_factorial(i, 365) / step_factorial(i, k)) * ...
                      (1 / step_factorial(i, 365+k-n)) * ...
                      (1 / step_power(365, i, n));
    end
end

% Calculate the sum of the terms of pairs of people not sharing a birthday among n
function sum = calculateSum(n)
    sum = 0;
    for k=0:floor(n/2)
        sum = sum + calculateTerm(n, k);
    end
end

% Calculate total probability!
function p = calculateProbability(n)
    p = 1 - calculateSum(n);
end