package generate

import (
	"github.com/bwmarrin/snowflake"
	"strings"
	"wechat/pkg/logger"
)

var (
	node *snowflake.Node
	err  error
)

func init() {
	node, err = snowflake.NewNode(1)
	if err != nil {
		logger.Error("snowflake初始化失败", logger.WithError(err))
		return
	}
}

func GenerateUID() string {
	return "wxid_" + strings.ReplaceAll(node.Generate().Base64(), "==", "")
}
