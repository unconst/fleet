import subprocess
import bittensor
import argparse
import socket
import json
import os

coldkey = 'testwallet'
hotkey_prefix = 'test-'
subtensor = bittensor.subtensor(network='nobunaga')

def get_proc_name_for_wallet(wallet) -> str:
    return "pC:" + str(wallet.name) + "_H:" + wallet.hotkey_str

def get_pm2_processes() -> dict:
    try:
        return json.loads( subprocess.check_output(['pm2', 'jlist']).decode('utf-8') )
    except:
        return []

def get_pm2_processes_names() -> dict:
    return [r['name'] for r in get_pm2_processes()]

def is_wallet_running(wallet) -> bool:
    return get_proc_name_for_wallet(wallet) in get_pm2_processes_names()

def get_free_port() -> int:
    sock = socket.socket()
    sock.bind(('', 0))
    return sock.getsockname()[1]

def main():

    # Create wallets
    wallets = []
    for i in range(10):
        wallet_i = bittensor.wallet( path  = '/tmp/', name = coldkey, hotkey = hotkey_prefix + str(i) )
        wallet_i.create()
        wallets.append( wallet_i )

    for wallet in wallets:
        subtensor.register (
            wallet = wallet,
            wait_for_inclusion = False,
            wait_for_finalization = True,
            prompt = False,
            max_allowed_attempts = 3,
            output_in_place = True,
            cuda = True,
            dev_id = [0,1,2,3,4,5,6,7],
            TPB = 256,
            num_processes = None,
            update_interval = None,
            log_verbose = False,
        )
        pm2_run_script = " ".join( [  
            'pm2 start',
            'core_server/main.py',
            '--interpreter python3',
            '-f',
            '--name {}'.format( get_proc_name_for_wallet(wallet) ),
            '--', 
            '--logging.debug', 
            '--neuron.model_name EleutherAI/gpt-neo-1.3B',
            '--neuron.autocast',
            '--wallet.name {}'.format(wallet.name),
            '--wallet.hotkey {}'.format(wallet.hotkey_str),
            '--neuron.device cuda:0',
            '--axon.port {}'.format(get_free_port()),
            '--subtensor.network {}'.format(subtensor.network),
            '--prometheus.level DEBUG'
        ])
        print ( '\nScript:', pm2_run_script)
        print ( '\nRunning:', get_proc_name_for_wallet( wallet ))
        subprocess.Popen(pm2_run_script.split(), stdout=subprocess.PIPE)
        if is_wallet_running(wallet):
            print ('Success')
        else:
            print ('Failed')

    for w in wallets:
        print ('Wallet:', w, 'Process:', get_proc_name_for_wallet( w ), ' Running:', is_wallet_running(w) )



if __name__ == "__main__":
    main()
