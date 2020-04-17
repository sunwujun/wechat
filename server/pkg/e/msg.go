package e

var MsgFlags = map[int]string{
	SUCCESS:                        "success",
	ERROR:                          "fail",
	INVALID_PARAMS:                 "请求参数错误",
	ERROR_AUTH_CHECK_TOKEN_FAIL:    "无权访问",
	ERROR_AUTH_CHECK_TOKEN_TIMEOUT: "授权已过期",
	ERROR_AUTH_TOKEN:               "生成失败",
	ERROR_AUTH:                     "无效Token",
	PAGE_NOT_FOUND:                 "Page not found",
}

func GetMsg(code int) string {
	msg, ok := MsgFlags[code]
	if ok {
		return msg
	}

	return MsgFlags[ERROR]
}
