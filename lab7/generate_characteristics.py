import csv


def generate_characteristic(direct_measurement_filename):
    direct_measurement_filepath = f'direct_measurements/{direct_measurement_filename}'
    characteristic_filepath = f'characteristics_tables/{direct_measurement_filename}'
    with (open(direct_measurement_filepath) as direct_measurement_file,
          open(characteristic_filepath, 'w', newline='') as characteristic_file):
        direct_measurement = csv.reader(direct_measurement_file, delimiter=';')
        header_row = next(direct_measurement)

        # -- добавить столбец in_segment_step
        characteristic = []
        input_voltage_prev = None
        for i, (output_code, input_voltage_str) in enumerate(direct_measurement):
            try:
                input_voltage = float(input_voltage_str)
            except ValueError:
                input_voltage = 0

            if i == 0:
                in_segment_step = 0
            else:
                in_segment_step = round((input_voltage_prev - input_voltage) / 16 * 1e3, 5)

            characteristic.append((output_code, input_voltage, in_segment_step))
            input_voltage_prev = input_voltage
        # /-- добавить столбец in_segment_step

        characteristic.insert(0, (*header_row, 'in_segment_step'))

        writer = csv.writer(characteristic_file, delimiter=';')
        writer.writerows(characteristic)


def generate_characteristics():
    generate_characteristic('coder.csv')
    generate_characteristic('decoder.csv')


if __name__ == '__main__':
    generate_characteristics()
