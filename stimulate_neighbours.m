function [new_times, number_stimulated] = stimulate_neighbours( fly_position, fly_positions, max_distance, times_till_fire, stimulation_gap)

neighbours = neighbourhood_flies(fly_position, fly_positions, max_distance);

neighbour_times = times_till_fire(neighbours);

stimulated_indices = neighbour_times <= stimulation_gap & neighbour_times > 1;
number_stimulated = length(find(stimulated_indices));

neighbour_times(neighbour_times <= stimulation_gap & neighbour_times >= 1) = 1;

new_times = times_till_fire;
new_times(neighbours) = neighbour_times;

end

