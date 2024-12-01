clc;
clear;

function characteristic = plot_characteristic(table_filepath, column_name)
    table = readtable(table_filepath);
    points_num = height(table);

    x_mid = floor(points_num / 2);

    x_left = 1:x_mid;
    x_right = x_mid + 1:points_num;

    y_left = transpose(table{x_left, column_name});
    y_right = transpose(table{x_right, column_name});

    x_left = x_left - x_mid;
    x_left(end) = -0.1;
    x_right = x_right - x_mid - 1;
    x_right(1) = 0.1;

    if isnan(y_left(1))
        x_left(1) = [];
        y_left(1) = [];
    end
    if isnan(y_right(1))
        x_right(1) = [];
        y_right(1) = [];
    end
    
    characteristic.x = [x_left, x_right];
    characteristic.y = [y_left, y_right];
    
    characteristic.xx_left = x_left(1):.05:x_left(end);
    characteristic.xx_right = x_right(1):.05:x_right(end);
    
    characteristic.yy_left = spline(x_left, y_left, characteristic.xx_left);
    characteristic.yy_right = spline(x_right, y_right, characteristic.xx_right);
end

coder_input_voltage = plot_characteristic( ...
    'characteristics_tables/coder.csv', 'input_voltage' ...
);

coder_in_segment_step = plot_characteristic( ...
    'characteristics_tables/coder.csv', 'in_segment_step' ...
);


subplot(2, 1, 1);
plot(coder_input_voltage.x, coder_input_voltage.y, 'ob');
hold on;
plot(coder_input_voltage.xx_left, coder_input_voltage.yy_left, 'Color', '#eb6f40');
hold on;
plot(coder_input_voltage.xx_right, coder_input_voltage.yy_right, 'Color', '#eb6f40');
ylabel('input voltage, V');

subplot(2, 1, 2);
plot(coder_in_segment_step.x, coder_in_segment_step.y, 'ob');
hold on;
plot(coder_in_segment_step.xx_left, coder_in_segment_step.yy_left, 'Color', '#eb6f40');
hold on;
plot(coder_in_segment_step.xx_right, coder_in_segment_step.yy_right, 'Color', '#eb6f40');
xlabel('input code index');
ylabel('step in segment, mV');
