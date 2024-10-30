individual_signal_extractor_name = strcat(model_name, "/Individual Signal Extractor");

extracted_ch_number = str2double(get_param(individual_signal_extractor_name, "ch_num"));

fc_extracted = fc_seq(extracted_ch_number);

f_stop1_extracted = fc_extracted;
f_stop2_extracted = fc_seq(extracted_ch_number + 1);

f_pass1_extracted = f_stop1_extracted + f_min;
f_pass2_extracted = f_stop1_extracted + f_max;

set_param(individual_signal_extractor_name, "fc", num2str(fc_extracted));

clear extracted_ch_filter_freqs fc_extracted;
