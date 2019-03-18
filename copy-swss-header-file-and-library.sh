SWSS_COMMON_DIR_DST=/usr/local/swss-common
SWSS_COMMON_DIR_SRC=/data/sonic-swss-common

mkdir -p ${SWSS_COMMON_DIR_DST}/include/swss
mkdir -p ${SWSS_COMMON_DIR_DST}/lib

INC_FILES='
	consumerstatetable.h 
        consumertablebase.h
	dbconnector.h
	json.h
	logger.h
	rediscommand.h
	redispipeline.h
	redisreply.h
	redisselect.h
	redistran.h
	schema.h
	selectable.h
	table.h'

SWSS_INC_FILES='
	consumerstatetable.h 
	consumertable.h 
	dbconnector.h 
	json.hpp 
	logger.h 
	netdispatcher.h 
	netlink.h 
	netmsg.h 
	notificationconsumer.h 
	notificationproducer.h 
	producertable.h 
	redisapi.h 
	redisclient.h 
	redisreply.h 
	schema.h 
	selectableevent.h 
	select.h 
	table.h
	tokenize.h 
	warm_restart.h'

for f in ${INC_FILES}
do
    echo $f
    cp ${SWSS_COMMON_DIR_SRC}/common/$f ${SWSS_COMMON_DIR_DST}/include
done

for f in ${SWSS_INC_FILES}
do
    echo $f
    cp ${SWSS_COMMON_DIR_SRC}/common/$f ${SWSS_COMMON_DIR_DST}/include/swss
done

cp ${SWSS_COMMON_DIR_SRC}/common/libswsscommon.la ${SWSS_COMMON_DIR_DST}/lib
