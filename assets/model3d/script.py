import os
import requests

# URL do JSON no GitHub
url = "https://github.com/Bowserinator/Periodic-Table-JSON/raw/refs/heads/master/PeriodicTableJSON.json"

# Nome da pasta onde os arquivos serão armazenados
output_folder = "element_3d_models"
os.makedirs(output_folder, exist_ok=True)

# Função para fazer o download do arquivo 3D
def download_bohr_model_3d(symbol, url):
    response = requests.get(url)
    if response.status_code == 200:
        file_path = os.path.join(output_folder, f"{symbol}.glb")
        with open(file_path, "wb") as f:
            f.write(response.content)
        print(f"Downloaded: {file_path}")
    else:
        print(f"Failed to download {url}")

# Obter o JSON da URL
response = requests.get(url)
if response.status_code == 200:
    data = response.json()
    elements = data.get("elements", [])

    # Loop para baixar cada arquivo 3D de cada elemento
    for element in elements:
        symbol = element.get("symbol")
        bohr_model_3d_url = element.get("bohr_model_3d")
        if symbol and bohr_model_3d_url:
            download_bohr_model_3d(symbol, bohr_model_3d_url)
else:
    print(f"Failed to retrieve JSON data from {url}")
