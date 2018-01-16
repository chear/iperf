
LOCAL_PATH := $(call my-dir)

#########################
# Build the libiperf library

iperf_lib_src_files := \
	cjson.c \
	iperf_api.c \
	iperf_error.c \
	iperf_client_api.c \
	iperf_server_api.c \
	iperf_tcp.c \
	iperf_udp.c \
	iperf_util.c \
	locale.c \
	net.c \
	tcp_info.c \
	tcp_window_size.c \
	timer.c \
	units.c 	
iperf_lib_static_libs := liblog

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	$(iperf_lib_src_files)

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_CFLAGS := -O2 -W -Wall \
	-DHAVE_CONFIG_H
# LOCAL_PRELINK_MODULE := false
LOCAL_STATIC_LIBRARIES := $(iperf_lib_static_libs)
LOCAL_MODULE := libiperf
LOCAL_MODULE_TAGS := eng

include $(BUILD_STATIC_LIBRARY)


include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
	$(iperf_lib_src_files)

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_CFLAGS := -O2 -W -Wall \
	-DHAVE_CONFIG_H
LOCAL_MODULE := libiperf
LOCAL_STATIC_LIBRARIES := $(iperf_lib_static_libs)
LOCAL_MODULE_TAGS := eng

include $(BUILD_HOST_STATIC_LIBRARY)

#########################
# Build the iperf binary

iperf_src_files :=  \
	main.c

iperf_static_libs := libiperf liblog

iperf_cflags := -O2 -W -Wall \
	-DHAVE_CONFIG_H

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(iperf_src_files)
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_CFLAGS := $(iperf_cflags)
LOCAL_SHARED_LIBRARIES := $(iperf_shared_libraries)
LOCAL_STATIC_LIBRARIES := $(iperf_static_libs)
LOCAL_MODULE := iperf
LOCAL_MODULE_TAGS := eng
include $(BUILD_EXECUTABLE)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(iperf_src_files)
LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_CFLAGS := $(iperf_cflags)
LOCAL_STATIC_LIBRARIES := $(iperf_static_libs) $(iperf_shared_libraries)
LOCAL_MODULE := iperf
LOCAL_MODULE_TAGS := eng
include $(BUILD_HOST_EXECUTABLE)

