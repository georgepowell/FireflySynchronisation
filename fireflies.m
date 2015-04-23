frequency = 5;
stimulation_gap = 2;
neighbour_dist = 1.5;
num_flies = 5;



%firefly_positions = rand(2, num_flies);
%times_until_fire = fix(rand(1, num_flies) * (frequency)) + 1;
range = 0:2*pi/(num_flies - 1):2*pi;
firefly_positions = vertcat(sin(range), cos(range));
times_until_fire = 1:num_flies;


number_flashed = zeros(1, frequency);
graph_nums = [];


for i=1:10000
    flashing_states = find(times_until_fire == 1);
    inactive_states = find(times_until_fire ~= 1);
    
    
    
    stillStimulating = true;
    
    while stillStimulating
        stillStimulating =  false;
        flashing_positions = firefly_positions(:, flashing_states);
        number_flashing = length(flashing_positions(1, :));
        
        for j=1:number_flashing
            [times_until_fire, number_stimulated] = stimulate_neighbours(flashing_positions(:, j), firefly_positions, neighbour_dist, times_until_fire, stimulation_gap);
            if number_stimulated > 0
                stillStimulating = true;
            end
        end
    end
    
    flashing_positions = firefly_positions(:, flashing_states);
    number_flashing = length(flashing_positions(1, :));
    number_flashed(mod(i, frequency) + 1) = number_flashing;
    
    graph_nums( fix((i - 1) / frequency) + 1, mod(i - 1, frequency) + 1 ) = number_flashing;
    
    flashing_states = find(times_until_fire == 1);
    
    figure(1);
    draw_flies(firefly_positions, flashing_states, inactive_states);
    figure(2);
    plot(graph_nums);
    %bar(number_flashed);
    
    times_until_fire = times_until_fire - 1;
    times_until_fire(flashing_states) = frequency;
        times_until_fire
    
    pause(0.1);
end


