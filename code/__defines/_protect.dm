///Protects a datum from being VV'd
#define GENERAL_PROTECT_DATUM(Path)\
##Path/can_vv_get(var_name){\
<<<<<<< HEAD
    return FALSE;\
=======
	.=..();\
	return FALSE;\
>>>>>>> 74d68be7e3 ([MIRROR] We love word games (#11552))
}\
##Path/vv_edit_var(var_name, var_value){\
    return FALSE;\
}\
##Path/CanProcCall(procname){\
    return FALSE;\
}