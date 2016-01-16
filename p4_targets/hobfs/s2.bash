echo 'Next: ./hobfs_ctrl.py --thrift-port 33333 --init'
read -n 1 -s
./hobfs_ctrl.py --thrift-port 33333 --init
echo 'Next: ./hobfs_ctrl.py --thrift-port 33333 --secure --dir 1 --seed 42 --period 2000 --length 14'
read -n 1 -s
./hobfs_ctrl.py --thrift-port 33333 --secure --dir 1 --seed 42 --period 2000 --length 14
