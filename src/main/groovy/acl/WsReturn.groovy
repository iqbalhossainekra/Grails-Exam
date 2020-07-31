package acl

class WSReturn {
    int code
    String message
    Object data

    WSReturn(int p_code, String p_message, Object p_data) {
        code = p_code
        message = p_message
        data = p_data
    }

}



