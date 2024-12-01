from jinja2 import Environment, FileSystemLoader, select_autoescape
import os.path
import pypandoc
import csv

env = Environment(
    loader=FileSystemLoader('.'),
    autoescape=select_autoescape()
)


def fixed_precision(num, precision):
    try:
        return format(float(num), f'.{precision}f')
    except ValueError:
        return num


env.filters['fixed_precision'] = fixed_precision

labs_to_render = (1, 2, 3, 4, 6, 7)

for lab_num in labs_to_render:
    lab_path = f'lab{lab_num}'
    report_filename = 'report.md'
    template = env.get_template(f'{lab_path}/{report_filename}')

    report_out_path = f'{lab_path}/report_out'
    if not os.path.exists(report_out_path):
        os.makedirs(report_out_path)

    parameters_for_template = {}

    if lab_num == 7:
        with (open('lab7/characteristics_tables/coder.csv', newline='') as coder_characteristic_file,
              open('lab7/characteristics_tables/decoder.csv', newline='') as decoder_characteristic_file):
            coder_characteristic = tuple(csv.reader(coder_characteristic_file, delimiter=';'))
            decoder_characteristic = tuple(csv.reader(decoder_characteristic_file, delimiter=';'))

        parameters_for_template = {
            'coder_characteristic': coder_characteristic,
            'decoder_characteristic': decoder_characteristic
        }

    content = template.render(parameters_for_template)
    pypandoc.convert_text(
        source=content, format='md',
        outputfile=f'{lab_path}/report_out/{report_filename.replace('md', 'html')}', to='html',
        extra_args=('--mathjax', '--standalone')
    )
