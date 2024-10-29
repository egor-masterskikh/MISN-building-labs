clear;
clc;

global model_name total_channels fc_1 delta_fc fc_seq f_max f_min delta_f f_seq fm_seq ampl fd;

model_name = "lab4";
total_channels = 12;  % количество каналов первичной группы
fc_1 = 64e3;  % несущая частота первого канала
delta_fc = 4e3;  % шаг между несущими частотами соседних каналов

f_max = delta_fc / 2;  % максимальная частота входного канального сигнала
delta_f = 100;  % шаг между ближайшими частотами входных сигналов
f_min = f_max - delta_f * total_channels;
ampl = 1;  % амплитуда сигнала, общая для всех каналов

fc_seq = funs.get_fc_seq();
f_seq = funs.get_f_seq();
fm_seq = f_seq + fc_seq;

% частота дискретизации
fd = 2 ^ ceil(log2(8 * fm_seq(total_channels)));

% рабочее пространство модели (model workspace)
mw = Simulink.data.connect(strcat(model_name, ".slx"));

% установить параметры модели
mw.fd = fd;
mw.ampl = ampl;
mw.delta_f = delta_f;
mw.delta_fc = delta_fc;
