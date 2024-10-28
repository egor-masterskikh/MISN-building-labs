for k = 1:12
    ch_name = funs.ch_name_(k);

    % установить параметры канала
    for ch_req_param = ch_req_params
        funs.ch_set_param(ch_name, ch_req_param, k);
    end

    % сохранить в рабочем пространстве Matlab параметры фильтра канала
    ch_filter_freqs = funs.ch_filter_freqs_(k);
    k_ = num2str(k);
    eval(strcat( ...
        "f_stop1_", k_, " = ", num2str(ch_filter_freqs(1)), ';', ...
        "f_pass1_", k_, " = ", num2str(ch_filter_freqs(2)), ';', ...
        "f_pass2_", k_, " = ", num2str(ch_filter_freqs(3)), ';', ...
        "f_stop2_", k_, " = ", num2str(ch_filter_freqs(4)), ';' ...
    ));
end

clear k ch_name ch_req_param ch_filter_freqs k_;
