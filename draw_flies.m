function num = draw_flies( fly_positions, on_indices, off_indices )

scatter(fly_positions(1, on_indices), fly_positions(2, on_indices), 25, 'filled');
hold on;
scatter(fly_positions(1, off_indices), fly_positions(2, off_indices), 6);
hold off;

num = 0;
end

