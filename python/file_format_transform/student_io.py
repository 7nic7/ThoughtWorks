import json


def convert_file_format(input_file_path: str, output_file_path: str,
                        input_format: str = 'csv', output_format: str = 'json'):
    if input_format == 'csv':
        sep = ','
    output = {}
    f = open(input_file_path, 'r', encoding='utf-8')
    columns = f.readline().strip().split(sep)
    row = 0
    while True:
        contents = f.readline().strip().split(sep)
        if len(contents) <= 1:
            f.close()
            break
        output[row] = {}
        for col, content in zip(columns, contents):
            if col in ['age', 'score']:
                output[row][col] = int(content)
            else:
                output[row][col] = content
        row += 1

    with open(output_file_path, 'w') as f:
        json.dump(output, f)


