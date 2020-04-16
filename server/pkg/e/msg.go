package e

var MsgFlags = map[int]string{
	SUCCESS: "success",
	ERROR:   "fail",
}

func GetMsg(code int) string {
	msg, ok := MsgFlags[code]
	if ok {
		return msg
	}

	return MsgFlags[ERROR]
}
