clc;
clear;

table = readtable("characteristics_tables/coder.csv");
points_num = height(table);

x_min = -floor(points_num / 2 - 2);
x_max = floor(points_num / 2 - 1);

x_left = [x_min:-1, -0.1];
x_right = [0.1, 1:x_max];
x = [x_left, x_right];

xx_left = x_min:.05:-0.1;
xx_right = 0.1:.05:x_max;

y_left = table(2:points_num / 2, ["in_segment_step", "input_voltage"]);
in_segment_step_y_left = transpose(y_left.in_segment_step);
input_voltage_y_left = transpose(y_left.input_voltage);

y_right = table(points_num / 2 + 1:points_num, ["in_segment_step", "input_voltage"]);
in_segment_step_y_right = transpose(y_right.in_segment_step);
input_voltage_y_right = transpose(y_right.input_voltage);

in_segment_step_y = [in_segment_step_y_left, in_segment_step_y_right];
input_voltage_y = [input_voltage_y_left, input_voltage_y_right];

in_segment_step_yy_left = spline(x_left, in_segment_step_y_left, xx_left);
input_voltage_yy_left = spline(x_left, input_voltage_y_left, xx_left);

in_segment_step_yy_right = spline(x_right, in_segment_step_y_right, xx_right);
input_voltage_yy_right = spline(x_right, input_voltage_y_right, xx_right);


subplot(2, 1, 1);
plot(x, in_segment_step_y, 'ob');
hold on;
plot(xx_left, in_segment_step_yy_left, 'Color', '#eb6f40');
hold on;
plot(xx_right, in_segment_step_yy_right, 'Color', '#eb6f40')
ylabel('step in segment, mV');

subplot(2, 1, 2);
plot(x, input_voltage_y, 'ob');
hold on;
plot(xx_left, input_voltage_yy_left, 'Color', '#eb6f40');
hold on;
plot(xx_right, input_voltage_yy_right, 'Color', '#eb6f40');
xlabel('input code index');
ylabel('input voltage, V');
