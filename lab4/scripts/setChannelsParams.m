for k = 1:12
    ch_name = funs.ch_name_(k);

    set_param(ch_name, "f", num2str(f_seq(k)));

    % сохранить в рабочем пространстве Matlab параметры канального фильтра
    ch_filter_freqs = funs.ch_filter_freqs_(k);
    k_ = num2str(k);
    eval(strcat( ...
        "f_stop1_", k_, " = ", num2str(ch_filter_freqs(1)), ';', ...
        "f_pass1_", k_, " = ", num2str(ch_filter_freqs(2)), ';', ...
        "f_pass2_", k_, " = ", num2str(ch_filter_freqs(3)), ';', ...
        "f_stop2_", k_, " = ", num2str(ch_filter_freqs(4)), ';' ...
    ));
end

clear k ch_name ch_filter_freqs k_;
