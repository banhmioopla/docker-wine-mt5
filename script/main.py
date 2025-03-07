from fastapi import FastAPI
from mt5linux import MetaTrader5
import os

app = FastAPI()

MT5_HOST = "mt5-app"
MT5_PORT = int(8080)

mt5 = MetaTrader5(host=MT5_HOST, port=MT5_PORT)
mt5.initialize()

@app.get("/")
def read_root():
    return {"message": "MT5 Linux API is running"}

@app.get("/terminal_info")
def get_terminal_info():
    info = mt5.terminal_info()._asdict()
    return info

@app.get("/market_data/{symbol}")
def get_market_data(symbol: str):
    rates = mt5.copy_rates_from_pos(symbol, mt5.TIMEFRAME_M1, 0, 100)
    if rates is None:
        return {"error": "Không thể lấy dữ liệu"}
    return {"symbol": symbol, "rates": rates}

@app.on_event("shutdown")
def shutdown_mt5():
    mt5.shutdown()
