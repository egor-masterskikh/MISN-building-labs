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

        % несущая частота k-го канала
        function fc_k = fc_(k)
            global fc_1 delta_fc;
            fc_k = fc_1 + delta_fc * (k - 1);
        end

        % частота сигнала k-го канала
        function f_k = f_(k)
            global f_max delta_f total_channels;
            f_k = f_max - (total_channels - k) * delta_f;
        end

        % частота модулированного сигнала k-го канала
        function fm_k = fm_(k)
            fm_k = funs.fc_(k) + funs.f_(k);
        end

        % частота левой границы полосы пропускания полосового фильтра
        function f_pass1 = f_pass1_(k)
            global delta_f;
            f_pass1 = funs.fm_(k) - delta_f / 2;
        end

        % частота левой границы полосы задерживания полосового фильтра
        function f_stop1 = f_stop1_(k)
            global delta_f;
            f_stop1 = funs.f_pass1_(k) - delta_f / 2;
        end

        function f_pass2 = f_pass2_(k)
            global delta_f;
            f_pass2 = funs.fm_(k) + delta_f / 2;
        end

        function f_stop2 = f_stop2_(k)
            global delta_f;
            f_stop2 = funs.f_pass2_(k) + delta_f / 2;
        end

        % создать параметр канала, если необходимо, и установить его значение
        % param -- параметр как экземпляр структуры с полями Name, Type, Prompt, ValGenerator
        % k -- номер канала
        function ch_set_param(ch_name, param, k)
            val_generator_expr = strcat(param.ValGenerator, '(', num2str(k), ')');
            val = num2str(eval(val_generator_expr));
            try
                set_param(ch_name, param.Name, val);
            catch exception
                switch exception.identifier
                    case "Simulink:Commands:ParamUnknown"
                        ch = Simulink.Mask.get(ch_name);
                        ch.addParameter( ...
                            "Type", param.Type, ...
                            "Name", param.Name, ...
                            "Prompt", param.Prompt, ...
                            "Value", val ...
                        );
                        set_param(ch_name, param.Name, val);
                    otherwise
                        rethrow(exception);
                end
            end
        end

        function freqs = ch_filter_freqs_(k)
            freqs = [funs.f_stop1_(k) funs.f_pass1_(k) funs.f_pass2_(k) funs.f_stop2_(k)];
        end
    end
end
