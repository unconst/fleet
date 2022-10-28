# First we will install all required tools.
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/opentensor/bittensor/master/scripts/install.sh)"

# Next we will install cubit.
pip install https://github.com/opentensor/cubit/releases/download/v1.1.2/cubit-1.1.2-cp38-cp38-linux_x86_64.whl

# Next reinstall bittensor from source
python3 -m pip install -e ~/.bittensor/bittensor

# Next we will create our coldkey and 10 hotkeys
sudo apt update
sudo apt install npm

# Now we will register them
sudo npm install pm2 -g
