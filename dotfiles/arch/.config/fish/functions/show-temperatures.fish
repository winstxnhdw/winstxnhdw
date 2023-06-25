function show-temperatures --wraps='watch -n 0.5 sensors' --description 'alias show-temperatures=watch -n 0.5 sensors'
  watch -n 0.5 sensors
end
