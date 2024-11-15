from jinja2 import Environment, FileSystemLoader, select_autoescape
import pypandoc

env = Environment(
    loader=FileSystemLoader('.'),
    autoescape=select_autoescape()
)

labs_to_render = (1, 2, 3, 4, 6)

for i in labs_to_render:
    lab_path = f'lab{i}'
    report_filename = 'report.md'
    template = env.get_template(f'{lab_path}/{report_filename}')
    pypandoc.convert_text(
        source=template.render(), format='md',
        outputfile=f'{lab_path}/report_out/{report_filename.replace('md', 'html')}', to='html',
        extra_args=('--mathjax', '--standalone')
    )
