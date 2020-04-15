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

func init() {
	Conf = getYamlConfig()
	log.Println("[Setting] Config init success")
}

func getYamlConfig() *Config {
	var c *Config
	file, err := ioutil.ReadFile("config/config.yml")
	if err != nil {
		log.Printf("[Setting] config error:%s \n", err.Error())
	}

	if err := yaml.UnmarshalStrict(file, &c); err != nil {
		log.Printf("[Setting] yaml unmarshal error: %s \n", err.Error())
	}
	return c
}
