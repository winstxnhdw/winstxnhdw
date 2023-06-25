function gtop --wraps='watch -n 0.5 nvidia-smi' --description 'alias gtop=watch -n 0.5 nvidia-smi'
  watch -n 0.5 nvidia-smi
end
