erlc logger.erl
erlc importlog.erl
erl -noshell -s importlog start -s init stop

LOG_PATH=`cat importlog.erl | grep define | grep log | sed -e "s/-define(log_path,\"//i"| sed -e "s/\").//i"`
cat $LOG_PATH
