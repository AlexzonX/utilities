import socket
from tqdm import tqdm
from multiprocessing.pool import ThreadPool

HOST = "localhost"
PORTS_COUNT = 2**16

def is_opend_port(port):
    with socket.socket(socket.AF_INET, socket.SOCK_STREAM) as sock:
        return not sock.connect_ex((HOST,port))

if __name__ == "__main__":
        pool= ThreadPool(4000)
for port in tqdm(range(1,PORTS_COUNT),total = PORTS_COUNT-1,desc=f'Scanning {HOST}'):
    if is_opend_port(port):
        print(f"port {port} open")
