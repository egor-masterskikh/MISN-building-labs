for k = 1:12
    ch_name = funs.ch_name_(k);

    set_param(ch_name, "f", num2str(f_seq(k)));

    % сохранить в рабочем пространстве Matlab параметры канального фильтра
    k_str = num2str(k);
    f_stop1_str = num2str(funs.f_stop1_(k));
    f_pass1_str = num2str(funs.f_pass1_(k));
    f_pass2_str = num2str(funs.f_pass2_(k));
    f_stop2_str = num2str(funs.f_stop2_(k));
    eval(strcat( ...
        "f_stop1_", k_str, " = ", f_stop1_str, ';', ...
        "f_pass1_", k_str, " = ", f_pass1_str, ';', ...
        "f_pass2_", k_str, " = ", f_pass2_str, ';', ...
        "f_stop2_", k_str, " = ", f_stop2_str, ';' ...
    ));
end

clear k k_str ch_name f_stop1_str f_pass1_str f_pass2_str f_stop2_str;
