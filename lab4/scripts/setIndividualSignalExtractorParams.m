individual_signal_extractor_name = strcat(model_name, "/Individual Signal Extractor");

extracted_ch_number = str2double(get_param(individual_signal_extractor_name, "ch_num"));

extracted_ch_filter_freqs = funs.ch_filter_freqs_(extracted_ch_number);
f_stop1_extracted = extracted_ch_filter_freqs(1);
f_pass1_extracted = extracted_ch_filter_freqs(2);
f_pass2_extracted = extracted_ch_filter_freqs(3);
f_stop2_extracted = extracted_ch_filter_freqs(4);

fc_extracted = funs.fc_(extracted_ch_number);
f_cutoff_extracted = fc_extracted + delta_f;

set_param(individual_signal_extractor_name, "fc", num2str(fc_extracted));
set_param(individual_signal_extractor_name, "f_cutoff", num2str(f_cutoff_extracted));

clear extracted_ch_filter_freqs fc_extracted f_cutoff_extracted;
