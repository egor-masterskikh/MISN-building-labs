clc;
clear;

function ch = plot_characteristic(table_filepath, column_name)
    table = readtable(table_filepath);
    points_num = height(table);

    x_mid = floor(points_num / 2);
    
    ch.x = (-x_mid + 1):(x_mid - 1);
    ch.y = table{:, column_name};
    ch.y(x_mid + 1) = [];

    if isnan(ch.y(1))
        ch.x(1) = [];
        ch.y(1) = [];
    end
    
    ch.xx = ch.x(1):.05:ch.x(end);
    ch.yy = spline(ch.x, ch.y, ch.xx);
end

coder_input_voltage = plot_characteristic( ...
    'characteristics_tables/coder.csv', 'input_voltage' ...
);
coder_in_segment_step = plot_characteristic( ...
    'characteristics_tables/coder.csv', 'in_segment_step' ...
);

figure( ...
    'Name', 'Coder Characteristic', ...
    'NumberTitle', 'off' ...
);

subplot(2, 1, 1);
plot(coder_input_voltage.x, coder_input_voltage.y, 'ob');
hold on;
plot(coder_input_voltage.xx, coder_input_voltage.yy, 'Color', '#eb6f40');
grid on;
ylabel('Input Voltage, V');
set(gca, 'xticklabel', []);

subplot(2, 1, 2);
plot(coder_in_segment_step.x, coder_in_segment_step.y, 'ob');
hold on;
plot(coder_in_segment_step.xx, coder_in_segment_step.yy, 'Color', '#eb6f40');
grid on;
xlabel('Input Code Index');
ylabel('Step in Segment, mV');


decoder_input_voltage = plot_characteristic( ...
    'characteristics_tables/decoder.csv', 'input_voltage' ...
);
decoder_in_segment_step = plot_characteristic( ...
    'characteristics_tables/decoder.csv', 'in_segment_step' ...
);

figure( ...
    'Name', 'Decoder Characteristic', ...
    'NumberTitle', 'off' ...
);

subplot(2, 1, 1);
plot(decoder_input_voltage.x, decoder_input_voltage.y, 'ob');
hold on;
plot(decoder_input_voltage.xx, decoder_input_voltage.yy, 'Color', '#34a853');
grid on;
ylabel('Input Voltage, V');
set(gca, 'xticklabel', []);

subplot(2, 1, 2);
plot(decoder_in_segment_step.x, decoder_in_segment_step.y, 'ob');
hold on;
plot(decoder_in_segment_step.xx, decoder_in_segment_step.yy, 'Color', '#34a853');
grid on;
xlabel('Input Code Index');
ylabel('Step in Segment, mV');
