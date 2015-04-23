function indices = neighbourhood_flies( fly_position, fly_positions, max_distance )

indices = [];

max_distance_squared = max_distance * max_distance;

for i=1:length(fly_positions)

    current_fly = fly_positions(:, i);
    difference = current_fly - fly_position;
    
    distance_squared = difference(1) * difference(1) + difference(2) * difference(2);
    
    if (distance_squared <= max_distance_squared)
        indices(end + 1) = i;
    end

end

end

