package logger

import (
	"encoding/json"
	"fmt"
	"github.com/BurntSushi/toml"
	rotatelogs "github.com/lestrrat-go/file-rotatelogs"
	"go.uber.org/zap"
	"go.uber.org/zap/zapcore"
	"gopkg.in/natefinch/lumberjack.v2"
	"gopkg.in/yaml.v2"
	"io"
	"io/ioutil"
	"os"
	"time"
)

//logger.Info("info level test")
//logger.Error("e level test")
//logger.Warn("warn level test")
//logger.Debug("debug level test")
//
//logger.Infof("info level test: %s", "111")
//logger.Errorf("e level test: %s", "111")
//logger.Warnf("warn level test: %s", "111")
//logger.Debugf("debug level test: %s", "111")
//
//logger.Info("this is a log", logger.With("Trace", "12345677"))
//logger.Info("this is a log", logger.WithError(errors.New("this is a new e")))

func init() {
	c := New()
	c.SetDivision("time")                   // 设置归档方式，"time"时间归档 "size" 文件大小归档，文件大小等可以在配置文件配置
	c.SetTimeUnit(Day)                      // 时间归档 可以设置切割单位
	c.SetEncoding("json")                   // 输出格式 "json" 或者 "console"
	c.SetInfoFile("./logs/server.log")      // 设置info级别日志
	c.SetErrorFile("./logs/server_err.log") // 设置warn级别日志
	c.InitLogger()
}

const (
	TimeDivision     = "time"
	SizeDivision     = "size"
	_defaultEncoding = "console"
	_defaultDivision = "size"
	_defaultUnit     = Hour
)

var (
	Logger                    *Log
	_encoderNameToConstructor = map[string]func(zapcore.EncoderConfig) zapcore.Encoder{
		"console": func(encoderConfig zapcore.EncoderConfig) zapcore.Encoder {
			return zapcore.NewConsoleEncoder(encoderConfig)
		},
		"json": func(encoderConfig zapcore.EncoderConfig) zapcore.Encoder {
			return zapcore.NewJSONEncoder(encoderConfig)
		},
	}
)

type Log struct {
	L *zap.Logger
}

type LogOptions struct {
	Encoding      string   `json:"encoding" yaml:"encoding" toml:"encoding"`
	InfoFilename  string   `json:"info_filename" yaml:"info_filename" toml:"info_filename"`
	ErrorFilename string   `json:"error_filename" yaml:"error_filename" toml:"error_filename"`
	MaxSize       int      `json:"max_size" yaml:"max_size" toml:"max_size"`
	MaxBackups    int      `json:"max_backups" yaml:"max_backups" toml:"max_backups"`
	MaxAge        int      `json:"max_age" yaml:"max_age" toml:"max_age"`
	Compress      bool     `json:"compress" yaml:"compress" toml:"compress"`
	Division      string   `json:"division" yaml:"division" toml:"division"`
	LevelSeparate bool     `json:"level_separate" yaml:"level_separate" toml:"level_separate"`
	TimeUnit      TimeUnit `json:"time_unit" yaml:"time_unit" toml:"time_unit"`

	closeDisplay int
	caller       bool
}

func infoLevel() zap.LevelEnablerFunc {
	return func(lvl zapcore.Level) bool {
		return lvl < zapcore.WarnLevel
	}
}

func warnLevel() zap.LevelEnablerFunc {
	return func(lvl zapcore.Level) bool {
		return lvl >= zapcore.WarnLevel
	}
}

func New() *LogOptions {
	return &LogOptions{
		Division:      _defaultDivision,
		LevelSeparate: false,
		TimeUnit:      _defaultUnit,
		Encoding:      _defaultEncoding,
		caller:        false,
	}
}

func NewFromToml(confPath string) *LogOptions {
	var c *LogOptions
	if _, err := toml.DecodeFile(confPath, &c); err != nil {
		panic(err)
	}
	return c
}

func NewFromYaml(confPath string) *LogOptions {
	var c *LogOptions
	file, err := ioutil.ReadFile(confPath)
	if err != nil {
		fmt.Printf("yamlFile.Get e   #%v ", err)
	}
	err = yaml.Unmarshal(file, &c)
	if err != nil {
		fmt.Printf("e: %v", err)
	}
	return c
}

func NewFromJson(confPath string) *LogOptions {
	var c *LogOptions
	file, err := ioutil.ReadFile(confPath)
	if err != nil {
		fmt.Printf("yamlFile.Get e   #%v ", err)
	}
	err = json.Unmarshal(file, &c)
	if err != nil {
		fmt.Printf("e: %v", err)
	}
	return c
}

func (c *LogOptions) SetDivision(division string) {
	c.Division = division
}

func (c *LogOptions) CloseConsoleDisplay() {
	c.closeDisplay = 1
}

func (c *LogOptions) SetCaller(b bool) {
	c.caller = b
}

func (c *LogOptions) SetTimeUnit(t TimeUnit) {
	c.TimeUnit = t
}

func (c *LogOptions) SetErrorFile(path string) {
	c.LevelSeparate = true
	c.ErrorFilename = path
}

func (c *LogOptions) SetInfoFile(path string) {
	c.InfoFilename = path
}

func (c *LogOptions) SetEncoding(encoding string) {
	c.Encoding = encoding
}

func (c *LogOptions) isOutput() bool {
	return c.InfoFilename != ""
}

func (c *LogOptions) InitLogger() *Log {
	var (
		core               zapcore.Core
		infoHook, warnHook io.Writer
		wsInfo             []zapcore.WriteSyncer
		wsWarn             []zapcore.WriteSyncer
	)

	if c.Encoding == "" {
		c.Encoding = _defaultEncoding
	}
	encoder := _encoderNameToConstructor[c.Encoding]

	encoderConfig := zapcore.EncoderConfig{
		TimeKey:        "time",
		LevelKey:       "level",
		NameKey:        "logger",
		CallerKey:      "file",
		MessageKey:     "msg",
		StacktraceKey:  "stacktrace",
		LineEnding:     zapcore.DefaultLineEnding,
		EncodeLevel:    zapcore.LowercaseLevelEncoder,
		EncodeTime:     zapcore.ISO8601TimeEncoder,
		EncodeDuration: zapcore.SecondsDurationEncoder,
		EncodeCaller:   zapcore.FullCallerEncoder,
	}

	if c.closeDisplay == 0 {
		wsInfo = append(wsInfo, zapcore.AddSync(os.Stdout))
		wsWarn = append(wsWarn, zapcore.AddSync(os.Stdout))
	}

	if c.isOutput() {
		switch c.Division {
		case TimeDivision:
			infoHook = c.timeDivisionWriter(c.InfoFilename)
			if c.LevelSeparate {
				warnHook = c.timeDivisionWriter(c.ErrorFilename)
			}
		case SizeDivision:
			infoHook = c.sizeDivisionWriter(c.InfoFilename)
			if c.LevelSeparate {
				warnHook = c.sizeDivisionWriter(c.ErrorFilename)
			}
		}
		wsInfo = append(wsInfo, zapcore.AddSync(infoHook))
	}

	if c.ErrorFilename != "" {
		wsWarn = append(wsWarn, zapcore.AddSync(warnHook))
	}

	if c.LevelSeparate {
		core = zapcore.NewTee(
			zapcore.NewCore(encoder(encoderConfig), zapcore.NewMultiWriteSyncer(wsInfo...), infoLevel()),
			zapcore.NewCore(encoder(encoderConfig), zapcore.NewMultiWriteSyncer(wsWarn...), warnLevel()),
		)
	} else {
		core = zapcore.NewCore(encoder(encoderConfig), zapcore.NewMultiWriteSyncer(wsInfo...), zap.InfoLevel)
	}

	development := zap.Development()
	stackTrace := zap.AddStacktrace(zapcore.WarnLevel)

	var logger *zap.Logger
	if c.caller {
		logger = zap.New(core, zap.AddCaller(), development, stackTrace)
	} else {
		logger = zap.New(core, development, stackTrace)
	}

	Logger = &Log{logger}
	return Logger
}

func (c *LogOptions) sizeDivisionWriter(filename string) io.Writer {
	hook := &lumberjack.Logger{
		Filename:   filename,
		MaxSize:    c.MaxSize,
		MaxBackups: c.MaxBackups,
		MaxAge:     c.MaxSize,
		Compress:   c.Compress,
	}
	return hook
}

func (c *LogOptions) timeDivisionWriter(filename string) io.Writer {
	hook, err := rotatelogs.New(
		filename+c.TimeUnit.Format(),
		rotatelogs.WithMaxAge(time.Duration(int64(24*time.Hour)*int64(c.MaxAge))),
		rotatelogs.WithRotationTime(c.TimeUnit.RotationGap()),
	)

	if err != nil {
		panic(err)
	}
	return hook
}

func Info(msg string, args ...zap.Field) {
	Logger.L.Info(msg, args...)
}

func Error(msg string, args ...zap.Field) {
	Logger.L.Error(msg, args...)
}

func Warn(msg string, args ...zap.Field) {
	Logger.L.Warn(msg, args...)
}

func Debug(msg string, args ...zap.Field) {
	Logger.L.Debug(msg, args...)
}

func Fatal(msg string, args ...zap.Field) {
	Logger.L.Fatal(msg, args...)
}

func Infof(format string, args ...interface{}) {
	logMsg := fmt.Sprintf(format, args...)
	Logger.L.Info(logMsg)
}

func Errorf(format string, args ...interface{}) {
	logMsg := fmt.Sprintf(format, args...)
	Logger.L.Error(logMsg)
}

func Warnf(format string, args ...interface{}) {
	logMsg := fmt.Sprintf(format, args...)
	Logger.L.Warn(logMsg)
}

func Debugf(format string, args ...interface{}) {
	logMsg := fmt.Sprintf(format, args...)
	Logger.L.Debug(logMsg)
}

func Fatalf(format string, args ...interface{}) {
	logMsg := fmt.Sprintf(format, args...)
	Logger.L.Fatal(logMsg)
}

func With(k string, v interface{}) zap.Field {
	return zap.Any(k, v)
}

func WithError(err error) zap.Field {
	return zap.NamedError("e", err)
}
