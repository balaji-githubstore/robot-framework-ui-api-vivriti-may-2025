import requests
from pathlib import Path

def post_on_session_upload(base_url, end_point, headers={}, payload={},files_to_upload=[]):
    files = []
    print(files_to_upload)
    for file in list(files_to_upload):
        f1 = dict(file)
        temp = (f1['filekey'], (Path(str(f1['path'])).name, open(f1['path'], 'rb'), f1['type']))
        files.append(temp)

    response = requests.request('POST', base_url+end_point, headers=dict(headers), data=dict(payload), files=files)
    return response

