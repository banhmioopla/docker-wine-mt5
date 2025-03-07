import sys
import os
import rpyc
import time
# sys.path.append(os.path.abspath(os.path.join(os.path.dirname(__file__), '..', 'app')))


conn = rpyc.classic.connect(host="192.168.65.0/24", port=5900)
print(conn)
time.sleep(5)

def login_remote(account_id, pw, server):
    print("Ok Remote")
    import MetaTrader5 as _mt5
    _mt5.initialize(login = account_id, password = pw, server = server)
    return _mt5.account_info()._asdict()

fn = conn.teleport(login_remote)
time.sleep(5)

data = fn(7300401,'1@NGeF3vvh7mIy','CMarketsSC-MT5-2')
time.sleep(5)
print('data', data)

