classdef funs
    methods (Static)
        % имя канала
        function ch_name = ch_name_(k)
            global model_name;
            ch_name = strcat(model_name, "/Channel ", num2str(k));
        end

        % имя канального фильтра
        function ch_filter_name = ch_filter_name_(k)
            ch_filter_name = strcat(funs.ch_name_(k), "/Modulating Freq Filter");
        end

        function fc_seq = get_fc_seq()
            global fc_1 delta_fc total_channels;
            fc_seq = fc_1:delta_fc:(fc_1 + delta_fc * (total_channels - 1));
        end

        function f_seq = get_f_seq()
            global f_min f_max delta_f total_channels;
            f_seq = randsample(f_min:delta_f:f_max, total_channels);
        end

        % частота левой границы полосы пропускания полосового фильтра
        function f_pass1 = f_pass1_(k)
            global fm_seq f_seq;
            f_pass1 = fm_seq(k) - f_seq(k) / 5;
        end

        function f_pass2 = f_pass2_(k)
            global fm_seq f_seq;
            f_pass2 = fm_seq(k) + f_seq(k) / 5;
        end

        % частота левой границы полосы задерживания полосового фильтра
        function f_stop1 = f_stop1_(k)
            global f_seq;
            f_stop1 = funs.f_pass1_(k) - f_seq(k) / 5;
        end

        function f_stop2 = f_stop2_(k)
            global f_seq;
            f_stop2 = funs.f_pass2_(k) + f_seq(k) / 5;
        end
    end
end
