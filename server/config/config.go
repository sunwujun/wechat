package config

import (
	"gopkg.in/yaml.v2"
	"io/ioutil"
	"log"
	"time"
)

var Conf *Config

type Config struct {
	Server   Server `yaml:"server"`
	Database MySQL  `yaml:"mysql"`
	Redis    Redis  `yaml:"redis"`
	Keys     Keys   `yaml:"keys"`
}

//Server yaml config
type Server struct {
	Port         string        `yaml:"port"`
	ReadTimeout  time.Duration `yaml:"read-timeout"`
	WriteTimeout time.Duration `yaml:"write-timeout"`
	RunMode      string        `yaml:"run-mode"`
}

//MySQL yaml config
type MySQL struct {
	URL      string `yaml:"url"`
	Username string `yaml:"username"`
	Password string `yaml:"password"`
	Dbname   string `yaml:"dbname"`
}

//Redis yaml config
type Redis struct {
	Addrs       []string      `yaml:"addrs"`
	Pwd         string        `yaml:"pwd"`
	PoolSize    int           `yaml:"poolsize"`
	DB          int           `yaml:"db"`
	Timeout     time.Duration `yaml:"timeout"`
	ExpiredTime int           `yaml:"expired-time"`
}

type Keys struct {
	Encryptkey string `yaml:"encryptkey"`
}

func init() {
	Conf = getYamlConfig()
	log.Println("[Setting] Config init success")
}

func getYamlConfig() *Config {
	var c *Config
	file, err := ioutil.ReadFile("config/config.yml")
	if err != nil {
		log.Printf("[Setting] config e:%s \n", err.Error())
	}

	if err := yaml.UnmarshalStrict(file, &c); err != nil {
		log.Printf("[Setting] yaml unmarshal e: %s \n", err.Error())
	}
	return c
}
