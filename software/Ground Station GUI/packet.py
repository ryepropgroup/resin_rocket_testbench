from ctypes import Structure, c_uint, c_ushort, c_char, c_bool

class DATA(Structure):
    _fields_ = [("type", c_char),
                ("state", c_char),
                ("timestamp", c_uint),
                ("t1", c_ushort),
                ("t2", c_ushort),
                ("p1", c_ushort),
                ("p2", c_ushort),
                ("fm1", c_ushort),
                ("fm2", c_ushort)]