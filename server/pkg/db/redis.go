package db

import (
	"fmt"
	"github.com/go-redis/redis"
	"wechat/config"
	"wechat/pkg/logger"
)

var cmd redis.Cmdable

func init() {
	c := config.Conf.Redis
	switch len(c.Addrs) {
	case 0:
		logger.Error("redis地址不能为空")
	case 1:
		cmd = redis.NewClient(&redis.Options{
			Addr:        c.Addrs[0],
			Password:    c.Pwd,
			PoolSize:    c.PoolSize,
			DB:          c.DB,
			IdleTimeout: c.Timeout,
		})
	default:
		cmd = redis.NewClusterClient(&redis.ClusterOptions{
			Addrs:       c.Addrs,
			Password:    c.Pwd,
			PoolSize:    c.PoolSize,
			IdleTimeout: c.Timeout,
		})
	}

	_, err := cmd.Ping().Result()
	if err == redis.Nil {
		logger.Error("Redis异常", logger.WithError(err))
	} else if err != nil {
		logger.Error("Redis连接失败", logger.WithError(err))
	} else {
		logger.Info("Redis连接成功")
	}
}

func GetRedis() *redis.Cmdable {
	return &cmd
}

// 向key的hash中添加元素field的值
func HashSet(key, field string, data interface{}) {
	err := cmd.HSet(key, field, data)
	if err != nil {
		logger.Error("Redis HSet Error:", logger.WithError(err.Err()))
	}
}

// 批量向key的hash添加对应元素field的值
func BatchHashSet(key string, fields map[string]interface{}) string {
	val, err := cmd.HMSet(key, fields).Result()
	if err != nil {
		logger.Error("Redis HMSet Error:", logger.WithError(err))
	}
	return val
}

// 通过key获取hash的元素值
func HashGet(key, field string) string {
	result := ""
	val, err := cmd.HGet(key, field).Result()
	if err == redis.Nil {
		logger.Infof("Key Doesn't Exists: %s ", field)
		return result
	} else if err != nil {
		logger.Error("Redis HGet Error:", logger.WithError(err))
		return result
	}
	return val
}

// 批量获取key的hash中对应多元素值
func BatchHashGet(key string, fields ...string) map[string]interface{} {
	resMap := make(map[string]interface{})
	for _, field := range fields {
		var result interface{}
		val, err := cmd.HGet(key, fmt.Sprintf("%s", field)).Result()
		if err == redis.Nil {
			logger.Infof("Key Doesn't Exists: %s", field)
			resMap[field] = result
		} else if err != nil {
			logger.Error("Redis HMGet Error:", logger.WithError(err))
			resMap[field] = result
		}
		if val != "" {
			resMap[field] = val
		} else {
			resMap[field] = result
		}
	}
	return resMap
}

// 获取自增唯一ID
func Incr(key string) int {
	val, err := cmd.Incr(key).Result()
	if err != nil {
		logger.Error("Redis Incr Error:", logger.WithError(err))
	}
	return int(val)
}

// 添加集合数据
func SetAdd(key, val string) {
	cmd.SAdd(key, val)
}

// 从集合中获取数据
func SetGet(key string) []string {
	val, err := cmd.SMembers(key).Result()
	if err != nil {
		logger.Error("Redis SMembers Error:", logger.WithError(err))
	}
	return val
}
