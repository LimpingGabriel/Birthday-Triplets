% Conduct a random simulation for birthday triplets problem.

disp_num = 200;
num_sims = 10000;

count_trips = zeros(disp_num, 1);

for n = 1:disp_num
    for i=1:num_sims
        random_birthdays = randi([1,365],1,n);
        [counts, groups] = groupcounts(random_birthdays');
        if (max(counts) >= 3)
            count_trips(n) = count_trips(n) + 1;
        end
    end
end

% Display graph
stairs(linspace(1,disp_num,disp_num), count_trips / num_sims)