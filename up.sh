


# First we will install all required tools.
# /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/opentensor/bittensor/master/scripts/install.sh)"

# Next we will install cubit.
pip install https://github.com/opentensor/cubit/releases/download/v1.1.2/cubit-1.1.2-cp38-cp38-linux_x86_64.whl

# Next reinstall bittensor from source
python3 -m pip install -e ~/.bittensor/bittensor

# Next we will create our coldkey and 10 hotkeys
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '0' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '1' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '2' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '3' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '4' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '5' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '6' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '7' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '8' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
python3 -c "import bittensor as bt; w = bt.wallet( coldkey = 'test', hotkey = '9' ); w.create( coldkey_use_password = True, hotkey_use_password = False);"
