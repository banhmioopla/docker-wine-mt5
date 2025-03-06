from mt5linux import MetaTrader5
import os

# connecto to the server
mt5 = MetaTrader5(
    host = os.getenv('MT5_HOST'),
    port = os.getenv('MT5_PORT')
) 
# use as you learned from: https://www.mql5.com/en/docs/integration/python_metatrader5/
mt5.initialize()
mt5.terminal_info()
mt5.copy_rates_from_pos('VALE3',mt5.TIMEFRAME_M1,0,1000)
# ...
# don't forget to shutdown
mt5.shutdown()