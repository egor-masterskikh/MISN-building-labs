clear;
clc;

global model_name total_channels fc_1 delta_fc f_max delta_f ampl fd;

model_name = "lab4";
total_channels = 12;  % количество каналов первичной группы
fc_1 = 64e3;  % несущая частота первого канала
delta_fc = 4e3;  % шаг между несущими частотами соседних каналов
f_max = delta_fc / 2;  % максимальная частота канального сигнала
delta_f = 100;  % шаг между частотами сигналов соседних каналов
ampl = 1;  % амплитуда сигнала, общая для всех каналов

% частота дискретизации
fd = 2 ^ (floor(log2(funs.fc_(total_channels) / delta_fc * 8)) + 1) * delta_fc;

% требуемые параметры канала
ch_req_params = struct;

ch_req_params(1).Name = "f";
ch_req_params(1).Type = "edit";
ch_req_params(1).Prompt = "Frequency (Hz)";
ch_req_params(1).ValGenerator = "funs.f_";

ch_req_params(2).Name = "fc";
ch_req_params(2).Type = "edit";
ch_req_params(2).Prompt = "Carrier frequency (Hz)";
ch_req_params(2).ValGenerator = "funs.fc_";

% рабочее пространство модели (model workspace)
mw = Simulink.data.connect(strcat(model_name, ".slx"));

% установить параметры модели
mw.fd = fd;
mw.ampl = ampl;
mw.delta_f = delta_f;
mw.delta_fc = delta_fc;
